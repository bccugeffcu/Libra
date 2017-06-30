/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import net.shopxx.Setting;
import net.shopxx.util.SystemUtils;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.Predicate;
import org.apache.commons.lang.BooleanUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.time.DateUtils;

@Entity
@Table(name = "xx_cart")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_cart")
public class Cart extends BaseEntity<Long> {

	private static final long serialVersionUID = -6775447997144792203L;

	public static final int TIMEOUT = 604800;

	public static final Integer MAX_CART_ITEM_COUNT = 100;

	public static final String KEY_COOKIE_NAME = "cartKey";

	public static final String QUANTITY_COOKIE_NAME = "cartQuantity";

	private String key;

	private Date expire;

	private Member member;

	private Set<CartItem> cartItems = new HashSet<CartItem>();

	@Column(name = "cart_key", nullable = false, updatable = false, unique = true)
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	@Column(nullable = false)
	public Date getExpire() {
		return expire;
	}

	public void setExpire(Date expire) {
		this.expire = expire;
	}

	@OneToOne(fetch = FetchType.LAZY)
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@OneToMany(mappedBy = "cart", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	public Set<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(Set<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	@Transient
	public int getProductWeight() {
		int productWeight = 0;
		if (getCartItems() != null) {
			for (CartItem cartItem : getCartItems()) {
				productWeight += cartItem.getWeight();
			}
		}
		return productWeight;
	}

	@Transient
	public int getProductQuantity() {
		int productQuantity = 0;
		if (getCartItems() != null) {
			for (CartItem cartItem : getCartItems()) {
				if (cartItem.getQuantity() != null) {
					productQuantity += cartItem.getQuantity();
				}
			}
		}
		return productQuantity;
	}

	@Transient
	public int getGiftWeight() {
		int giftWeight = 0;
		for (Product gift : getGifts()) {
			if (gift.getWeight() != null) {
				giftWeight += gift.getWeight();
			}
		}
		return giftWeight;
	}

	@Transient
	public int getGiftQuantity() {
		return getGifts().size();
	}

	@Transient
	public int getWeight() {
		return getProductWeight() + getGiftWeight();
	}

	@Transient
	public int getQuantity() {
		return getProductQuantity() + getGiftQuantity();
	}

	@Transient
	public long getRewardPoint() {
		long rewardPoint = 0L;
		if (getCartItems() != null) {
			for (CartItem cartItem : getCartItems()) {
				rewardPoint += cartItem.getRewardPoint();
			}
		}
		return rewardPoint;
	}

	@Transient
	public long getExchangePoint() {
		long exchangePoint = 0L;
		if (getCartItems() != null) {
			for (CartItem cartItem : getCartItems()) {
				exchangePoint += cartItem.getExchangePoint();
			}
		}
		return exchangePoint;
	}

	@Transient
	public long getAddedRewardPoint() {
		Map<CartItem, Long> cartItemRewardPointMap = new HashMap<CartItem, Long>();
		if (getCartItems() != null) {
			for (CartItem cartItem : getCartItems()) {
				cartItemRewardPointMap.put(cartItem, cartItem.getRewardPoint());
			}
		}
		Long addedRewardPoint = 0L;
		for (Promotion promotion : getPromotions()) {
			long originalRewardPoint = 0;
			Set<CartItem> cartItems = getCartItems(promotion);
			for (CartItem cartItem : cartItems) {
				originalRewardPoint += cartItemRewardPointMap.get(cartItem);
			}
			int quantity = getQuantity(promotion);
			long currentRewardPoint = promotion.calculatePoint(originalRewardPoint, quantity);
			if (originalRewardPoint > 0) {
				BigDecimal rate = new BigDecimal(currentRewardPoint).divide(new BigDecimal(originalRewardPoint), RoundingMode.DOWN);
				for (CartItem cartItem : cartItems) {
					cartItemRewardPointMap.put(cartItem, new BigDecimal(cartItemRewardPointMap.get(cartItem)).multiply(rate).longValue());
				}
			} else {
				for (CartItem cartItem : cartItems) {
					cartItemRewardPointMap.put(cartItem, new BigDecimal(currentRewardPoint).divide(new BigDecimal(quantity)).longValue());
				}
			}
			addedRewardPoint += currentRewardPoint - originalRewardPoint;
		}
		return addedRewardPoint;
	}

	@Transient
	public long getEffectiveRewardPoint() {
		long effectiveRewardPoint = getRewardPoint() + getAddedRewardPoint();
		return effectiveRewardPoint >= 0L ? effectiveRewardPoint : 0L;
	}

	@Transient
	public BigDecimal getPrice() {
		BigDecimal price = BigDecimal.ZERO;
		if (getCartItems() != null) {
			for (CartItem cartItem : getCartItems()) {
				price = price.add(cartItem.getSubtotal());
			}
		}
		return price;
	}

	@Transient
	public BigDecimal getDiscount() {
		Map<CartItem, BigDecimal> cartItemPriceMap = new HashMap<CartItem, BigDecimal>();
		if (getCartItems() != null) {
			for (CartItem cartItem : getCartItems()) {
				cartItemPriceMap.put(cartItem, cartItem.getSubtotal());
			}
		}
		BigDecimal discount = BigDecimal.ZERO;
		for (Promotion promotion : getPromotions()) {
			BigDecimal originalPrice = BigDecimal.ZERO;
			BigDecimal currentPrice = BigDecimal.ZERO;
			Set<CartItem> cartItems = getCartItems(promotion);
			for (CartItem cartItem : cartItems) {
				originalPrice = originalPrice.add(cartItemPriceMap.get(cartItem));
			}
			if (originalPrice.compareTo(BigDecimal.ZERO) > 0) {
				int quantity = getQuantity(promotion);
				currentPrice = promotion.calculatePrice(originalPrice, quantity);
				BigDecimal rate = currentPrice.divide(originalPrice, RoundingMode.DOWN);
				for (CartItem cartItem : cartItems) {
					cartItemPriceMap.put(cartItem, cartItemPriceMap.get(cartItem).multiply(rate));
				}
			} else {
				for (CartItem cartItem : cartItems) {
					cartItemPriceMap.put(cartItem, BigDecimal.ZERO);
				}
			}
			discount = discount.add(originalPrice.subtract(currentPrice));
		}
		Setting setting = SystemUtils.getSetting();
		return setting.setScale(discount);
	}

	@Transient
	public BigDecimal getEffectivePrice() {
		BigDecimal effectivePrice = getPrice().subtract(getDiscount());
		return effectivePrice.compareTo(BigDecimal.ZERO) >= 0 ? effectivePrice : BigDecimal.ZERO;
	}

	@Transient
	public Set<Product> getGifts() {
		Set<Product> gifts = new HashSet<Product>();
		for (Promotion promotion : getPromotions()) {
			if (CollectionUtils.isNotEmpty(promotion.getGifts())) {
				for (Product gift : promotion.getGifts()) {
					if (gift.getIsMarketable() && !gift.getIsOutOfStock()) {
						gifts.add(gift);
					}
				}
			}
		}
		return gifts;
	}

	@Transient
	public List<String> getGiftNames() {
		List<String> giftNames = new ArrayList<String>();
		for (Product gift : getGifts()) {
			giftNames.add(gift.getName());
		}
		return giftNames;
	}

	@Transient
	public Set<Promotion> getPromotions() {
		Set<Promotion> allPromotions = new HashSet<Promotion>();
		if (getCartItems() != null) {
			for (CartItem cartItem : getCartItems()) {
				if (cartItem.getProduct() != null) {
					allPromotions.addAll(cartItem.getProduct().getValidPromotions());
				}
			}
		}
		Set<Promotion> promotions = new TreeSet<Promotion>();
		for (Promotion promotion : allPromotions) {
			if (isValid(promotion)) {
				promotions.add(promotion);
			}
		}
		return promotions;
	}

	@Transient
	public List<String> getPromotionNames() {
		List<String> promotionNames = new ArrayList<String>();
		for (Promotion promotion : getPromotions()) {
			promotionNames.add(promotion.getName());
		}
		return promotionNames;
	}

	@Transient
	public Set<Coupon> getCoupons() {
		Set<Coupon> coupons = new HashSet<Coupon>();
		for (Promotion promotion : getPromotions()) {
			if (CollectionUtils.isNotEmpty(promotion.getCoupons())) {
				coupons.addAll(promotion.getCoupons());
			}
		}
		return coupons;
	}

	@Transient
	public boolean getIsDelivery() {
		return CollectionUtils.exists(getCartItems(), new Predicate() {
			@Override
			public boolean evaluate(Object object) {
				CartItem cartItem = (CartItem) object;
				return cartItem != null && cartItem.getIsDelivery();
			}
		}) || CollectionUtils.exists(getGifts(), new Predicate() {
			@Override
			public boolean evaluate(Object object) {
				Product product = (Product) object;
				return product != null && product.getIsDelivery();
			}
		});
	}

	@Transient
	public boolean getIsLowStock() {
		return CollectionUtils.exists(getCartItems(), new Predicate() {
			@Override
			public boolean evaluate(Object object) {
				CartItem cartItem = (CartItem) object;
				return cartItem != null && cartItem.getIsLowStock();
			}
		});
	}

	@Transient
	public String getToken() {
		HashCodeBuilder hashCodeBuilder = new HashCodeBuilder(17, 37).append(getKey());
		if (getCartItems() != null) {
			for (CartItem cartItem : getCartItems()) {
				hashCodeBuilder.append(cartItem.getProduct()).append(cartItem.getIsMarketable()).append(cartItem.getQuantity()).append(cartItem.getPrice());
			}
		}
		return DigestUtils.md5Hex(hashCodeBuilder.toString());
	}

	@Transient
	public CartItem getCartItem(Product product) {
		if (product != null && getCartItems() != null) {
			for (CartItem cartItem : getCartItems()) {
				if (cartItem.getProduct() != null && cartItem.getProduct().equals(product)) {
					return cartItem;
				}
			}
		}
		return null;
	}

	@Transient
	public boolean contains(Product product) {
		return getCartItem(product) != null;
	}

	@Transient
	public boolean contains(CartItem cartItem) {
		if (cartItem != null && getCartItems() != null) {
			return getCartItems().contains(cartItem);
		}
		return false;
	}

	@Transient
	private Set<CartItem> getCartItems(Promotion promotion) {
		Set<CartItem> cartItems = new HashSet<CartItem>();
		if (promotion != null && getCartItems() != null) {
			for (CartItem cartItem : getCartItems()) {
				if (cartItem.getProduct() != null && cartItem.getProduct().isValid(promotion)) {
					cartItems.add(cartItem);
				}
			}
		}
		return cartItems;
	}

	@Transient
	private int getQuantity(Promotion promotion) {
		int quantity = 0;
		for (CartItem cartItem : getCartItems(promotion)) {
			if (cartItem.getQuantity() != null) {
				quantity += cartItem.getQuantity();
			}
		}
		return quantity;
	}

	@Transient
	private long getRewardPoint(Promotion promotion) {
		long rewardPoint = 0L;
		for (CartItem cartItem : getCartItems(promotion)) {
			rewardPoint += cartItem.getRewardPoint();
		}
		return rewardPoint;
	}

	@Transient
	private BigDecimal getPrice(Promotion promotion) {
		BigDecimal price = BigDecimal.ZERO;
		for (CartItem cartItem : getCartItems(promotion)) {
			price = price.add(cartItem.getSubtotal());
		}
		return price;
	}

	@Transient
	private boolean isValid(Promotion promotion) {
		if (promotion == null || !promotion.hasBegun() || promotion.hasEnded()) {
			return false;
		}
		if (CollectionUtils.isEmpty(promotion.getMemberRanks()) || getMember() == null || getMember().getMemberRank() == null || !promotion.getMemberRanks().contains(getMember().getMemberRank())) {
			return false;
		}
		Integer quantity = getQuantity(promotion);
		if ((promotion.getMinimumQuantity() != null && promotion.getMinimumQuantity() > quantity) || (promotion.getMaximumQuantity() != null && promotion.getMaximumQuantity() < quantity)) {
			return false;
		}
		BigDecimal price = getPrice(promotion);
		if ((promotion.getMinimumPrice() != null && promotion.getMinimumPrice().compareTo(price) > 0) || (promotion.getMaximumPrice() != null && promotion.getMaximumPrice().compareTo(price) < 0)) {
			return false;
		}
		return true;
	}

	@Transient
	public boolean isValid(Coupon coupon) {
		if (coupon == null || !coupon.getIsEnabled() || !coupon.hasBegun() || coupon.hasExpired()) {
			return false;
		}
		if ((coupon.getMinimumQuantity() != null && coupon.getMinimumQuantity() > getProductQuantity()) || (coupon.getMaximumQuantity() != null && coupon.getMaximumQuantity() < getProductQuantity())) {
			return false;
		}
		if ((coupon.getMinimumPrice() != null && coupon.getMinimumPrice().compareTo(getEffectivePrice()) > 0) || (coupon.getMaximumPrice() != null && coupon.getMaximumPrice().compareTo(getEffectivePrice()) < 0)) {
			return false;
		}
		if (!isCouponAllowed()) {
			return false;
		}
		return true;
	}

	@Transient
	public boolean isValid(CouponCode couponCode) {
		if (couponCode == null || couponCode.getIsUsed() || couponCode.getCoupon() == null) {
			return false;
		}
		return isValid(couponCode.getCoupon());
	}

	@Transient
	public boolean hasNotMarketable() {
		return CollectionUtils.exists(getCartItems(), new Predicate() {
			@Override
			public boolean evaluate(Object object) {
				CartItem cartItem = (CartItem) object;
				return cartItem != null && !cartItem.getIsMarketable();
			}
		});
	}

	@Transient
	public boolean isFreeShipping() {
		return CollectionUtils.exists(getPromotions(), new Predicate() {
			@Override
			public boolean evaluate(Object object) {
				Promotion promotion = (Promotion) object;
				return promotion != null && BooleanUtils.isTrue(promotion.getIsFreeShipping());
			}
		});
	}

	@Transient
	public boolean isCouponAllowed() {
		return !CollectionUtils.exists(getPromotions(), new Predicate() {
			@Override
			public boolean evaluate(Object object) {
				Promotion promotion = (Promotion) object;
				return promotion != null && BooleanUtils.isFalse(promotion.getIsCouponAllowed());
			}
		});
	}

	@Transient
	public boolean isEmpty() {
		return CollectionUtils.isEmpty(getCartItems());
	}

	@PrePersist
	public void prePersist() {
		setKey(DigestUtils.md5Hex(UUID.randomUUID() + RandomStringUtils.randomAlphabetic(30)));
		setExpire(DateUtils.addSeconds(new Date(), Cart.TIMEOUT));
	}

}
