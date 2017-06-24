/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import net.shopxx.interceptor.MemberInterceptor;
import net.shopxx.util.JsonUtils;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "xx_member")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_member")
public class Member extends BaseEntity<Long> {

	private static final long serialVersionUID = 7976595587049226930L;

	public enum Gender {

		male,

		female
	}

	public enum RankingType {

		point,

		balance,

		amount
	}

	public static final String PRINCIPAL_ATTRIBUTE_NAME = MemberInterceptor.class.getName() + ".PRINCIPAL";

	public static final String USERNAME_COOKIE_NAME = "username";

	public static final String NICKNAME_COOKIE_NAME = "nickname";

	public static final int ATTRIBUTE_VALUE_PROPERTY_COUNT = 10;

	public static final String ATTRIBUTE_VALUE_PROPERTY_NAME_PREFIX = "attributeValue";

	public static final Integer MAX_FAVORITE_COUNT = 10;

	private String username;

	private String password;

	private String email;

	private String nickname;

	private Long point;

	private BigDecimal balance;

	private BigDecimal amount;

	private Boolean isEnabled;

	private Boolean isLocked;

	private Integer loginFailureCount;

	private Date lockedDate;

	private String registerIp;

	private String loginIp;

	private Date loginDate;

	private String name;

	private Member.Gender gender;

	private Date birth;

	private String address;

	private String zipCode;

	private String phone;

	private String mobile;

	private String loginPluginId;

	private String openId;

	private String lockKey;

	private String attributeValue0;

	private String attributeValue1;

	private String attributeValue2;

	private String attributeValue3;

	private String attributeValue4;

	private String attributeValue5;

	private String attributeValue6;

	private String attributeValue7;

	private String attributeValue8;

	private String attributeValue9;

	private SafeKey safeKey;

	private Area area;

	private MemberRank memberRank;

	private Cart cart;

	private Set<Order> orders = new HashSet<Order>();

	private Set<PaymentLog> paymentLogs = new HashSet<PaymentLog>();

	private Set<DepositLog> depositLogs = new HashSet<DepositLog>();

	private Set<CouponCode> couponCodes = new HashSet<CouponCode>();

	private Set<Receiver> receivers = new HashSet<Receiver>();

	private Set<Review> reviews = new HashSet<Review>();

	private Set<Consultation> consultations = new HashSet<Consultation>();

	private Set<Goods> favoriteGoods = new HashSet<Goods>();

	private Set<ProductNotify> productNotifies = new HashSet<ProductNotify>();

	private Set<Message> inMessages = new HashSet<Message>();

	private Set<Message> outMessages = new HashSet<Message>();

	private Set<PointLog> pointLogs = new HashSet<PointLog>();

	@NotEmpty(groups = Save.class)
	@Pattern(regexp = "^[0-9a-zA-Z_\\u4e00-\\u9fa5]+$")
	@Column(nullable = false, updatable = false, unique = true)
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@NotEmpty(groups = Save.class)
	@Column(nullable = false)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@NotEmpty
	@Email
	@Length(max = 200)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Length(max = 200)
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Column(nullable = false)
	public Long getPoint() {
		return point;
	}

	public void setPoint(Long point) {
		this.point = point;
	}

	@Column(nullable = false, precision = 27, scale = 12)
	public BigDecimal getBalance() {
		return balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

	@Column(nullable = false, precision = 27, scale = 12)
	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	@NotNull
	@Column(nullable = false)
	public Boolean getIsEnabled() {
		return isEnabled;
	}

	public void setIsEnabled(Boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	@Column(nullable = false)
	public Boolean getIsLocked() {
		return isLocked;
	}

	public void setIsLocked(Boolean isLocked) {
		this.isLocked = isLocked;
	}

	@Column(nullable = false)
	public Integer getLoginFailureCount() {
		return loginFailureCount;
	}

	public void setLoginFailureCount(Integer loginFailureCount) {
		this.loginFailureCount = loginFailureCount;
	}

	public Date getLockedDate() {
		return lockedDate;
	}

	public void setLockedDate(Date lockedDate) {
		this.lockedDate = lockedDate;
	}

	@Column(nullable = false, updatable = false)
	public String getRegisterIp() {
		return registerIp;
	}

	public void setRegisterIp(String registerIp) {
		this.registerIp = registerIp;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	@Length(max = 200)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Member.Gender getGender() {
		return gender;
	}

	public void setGender(Member.Gender gender) {
		this.gender = gender;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	@Length(max = 200)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Length(max = 200)
	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	@Length(max = 200)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Length(max = 200)
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Column(updatable = false)
	public String getLoginPluginId() {
		return loginPluginId;
	}

	public void setLoginPluginId(String loginPluginId) {
		this.loginPluginId = loginPluginId;
	}

	@Column(updatable = false)
	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	@Column(nullable = false, updatable = false)
	public String getLockKey() {
		return lockKey;
	}

	public void setLockKey(String lockKey) {
		this.lockKey = lockKey;
	}

	@Length(max = 200)
	public String getAttributeValue0() {
		return attributeValue0;
	}

	public void setAttributeValue0(String attributeValue0) {
		this.attributeValue0 = attributeValue0;
	}

	@Length(max = 200)
	public String getAttributeValue1() {
		return attributeValue1;
	}

	public void setAttributeValue1(String attributeValue1) {
		this.attributeValue1 = attributeValue1;
	}

	@Length(max = 200)
	public String getAttributeValue2() {
		return attributeValue2;
	}

	public void setAttributeValue2(String attributeValue2) {
		this.attributeValue2 = attributeValue2;
	}

	@Length(max = 200)
	public String getAttributeValue3() {
		return attributeValue3;
	}

	public void setAttributeValue3(String attributeValue3) {
		this.attributeValue3 = attributeValue3;
	}

	@Length(max = 200)
	public String getAttributeValue4() {
		return attributeValue4;
	}

	public void setAttributeValue4(String attributeValue4) {
		this.attributeValue4 = attributeValue4;
	}

	@Length(max = 200)
	public String getAttributeValue5() {
		return attributeValue5;
	}

	public void setAttributeValue5(String attributeValue5) {
		this.attributeValue5 = attributeValue5;
	}

	@Length(max = 200)
	public String getAttributeValue6() {
		return attributeValue6;
	}

	public void setAttributeValue6(String attributeValue6) {
		this.attributeValue6 = attributeValue6;
	}

	@Length(max = 200)
	public String getAttributeValue7() {
		return attributeValue7;
	}

	public void setAttributeValue7(String attributeValue7) {
		this.attributeValue7 = attributeValue7;
	}

	@Length(max = 200)
	public String getAttributeValue8() {
		return attributeValue8;
	}

	public void setAttributeValue8(String attributeValue8) {
		this.attributeValue8 = attributeValue8;
	}

	@Length(max = 200)
	public String getAttributeValue9() {
		return attributeValue9;
	}

	public void setAttributeValue9(String attributeValue9) {
		this.attributeValue9 = attributeValue9;
	}

	@Embedded
	public SafeKey getSafeKey() {
		return safeKey;
	}

	public void setSafeKey(SafeKey safeKey) {
		this.safeKey = safeKey;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false)
	public MemberRank getMemberRank() {
		return memberRank;
	}

	public void setMemberRank(MemberRank memberRank) {
		this.memberRank = memberRank;
	}

	@OneToOne(mappedBy = "member", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	@OneToMany(mappedBy = "member", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	public Set<Order> getOrders() {
		return orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	@OneToMany(mappedBy = "member", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	public Set<PaymentLog> getPaymentLogs() {
		return paymentLogs;
	}

	public void setPaymentLogs(Set<PaymentLog> paymentLogs) {
		this.paymentLogs = paymentLogs;
	}

	@OneToMany(mappedBy = "member", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	public Set<DepositLog> getDepositLogs() {
		return depositLogs;
	}

	public void setDepositLogs(Set<DepositLog> depositLogs) {
		this.depositLogs = depositLogs;
	}

	@OneToMany(mappedBy = "member", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	public Set<CouponCode> getCouponCodes() {
		return couponCodes;
	}

	public void setCouponCodes(Set<CouponCode> couponCodes) {
		this.couponCodes = couponCodes;
	}

	@OneToMany(mappedBy = "member", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@OrderBy("isDefault desc, createDate desc")
	public Set<Receiver> getReceivers() {
		return receivers;
	}

	public void setReceivers(Set<Receiver> receivers) {
		this.receivers = receivers;
	}

	@OneToMany(mappedBy = "member", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@OrderBy("createDate desc")
	public Set<Review> getReviews() {
		return reviews;
	}

	public void setReviews(Set<Review> reviews) {
		this.reviews = reviews;
	}

	@OneToMany(mappedBy = "member", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@OrderBy("createDate desc")
	public Set<Consultation> getConsultations() {
		return consultations;
	}

	public void setConsultations(Set<Consultation> consultations) {
		this.consultations = consultations;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "xx_member_favorite_goods")
	@OrderBy("createDate desc")
	public Set<Goods> getFavoriteGoods() {
		return favoriteGoods;
	}

	public void setFavoriteGoods(Set<Goods> favoriteGoods) {
		this.favoriteGoods = favoriteGoods;
	}

	@OneToMany(mappedBy = "member", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	public Set<ProductNotify> getProductNotifies() {
		return productNotifies;
	}

	public void setProductNotifies(Set<ProductNotify> productNotifies) {
		this.productNotifies = productNotifies;
	}

	@OneToMany(mappedBy = "receiver", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	public Set<Message> getInMessages() {
		return inMessages;
	}

	public void setInMessages(Set<Message> inMessages) {
		this.inMessages = inMessages;
	}

	@OneToMany(mappedBy = "sender", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	public Set<Message> getOutMessages() {
		return outMessages;
	}

	public void setOutMessages(Set<Message> outMessages) {
		this.outMessages = outMessages;
	}

	@OneToMany(mappedBy = "member", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	public Set<PointLog> getPointLogs() {
		return pointLogs;
	}

	public void setPointLogs(Set<PointLog> pointLogs) {
		this.pointLogs = pointLogs;
	}

	@Transient
	public Object getAttributeValue(MemberAttribute memberAttribute) {
		if (memberAttribute == null || memberAttribute.getType() == null) {
			return null;
		}

		switch (memberAttribute.getType()) {
		case name:
			return getName();
		case gender:
			return getGender();
		case birth:
			return getBirth();
		case area:
			return getArea();
		case address:
			return getAddress();
		case zipCode:
			return getZipCode();
		case phone:
			return getPhone();
		case mobile:
			return getMobile();
		case text:
		case select:
			if (memberAttribute.getPropertyIndex() != null) {
				try {
					String propertyName = ATTRIBUTE_VALUE_PROPERTY_NAME_PREFIX + memberAttribute.getPropertyIndex();
					return PropertyUtils.getProperty(this, propertyName);
				} catch (IllegalAccessException e) {
					throw new RuntimeException(e.getMessage(), e);
				} catch (InvocationTargetException e) {
					throw new RuntimeException(e.getMessage(), e);
				} catch (NoSuchMethodException e) {
					throw new RuntimeException(e.getMessage(), e);
				}
			}
			break;
		case checkbox:
			if (memberAttribute.getPropertyIndex() != null) {
				try {
					String propertyName = ATTRIBUTE_VALUE_PROPERTY_NAME_PREFIX + memberAttribute.getPropertyIndex();
					String propertyValue = (String) PropertyUtils.getProperty(this, propertyName);
					if (StringUtils.isNotEmpty(propertyValue)) {
						return JsonUtils.toObject(propertyValue, List.class);
					}
				} catch (IllegalAccessException e) {
					throw new RuntimeException(e.getMessage(), e);
				} catch (InvocationTargetException e) {
					throw new RuntimeException(e.getMessage(), e);
				} catch (NoSuchMethodException e) {
					throw new RuntimeException(e.getMessage(), e);
				}
			}
			break;
		}
		return null;
	}

	@Transient
	public void setAttributeValue(MemberAttribute memberAttribute, Object memberAttributeValue) {
		if (memberAttribute == null || memberAttribute.getType() == null) {
			return;
		}

		switch (memberAttribute.getType()) {
		case name:
			if (memberAttributeValue instanceof String || memberAttributeValue == null) {
				setName((String) memberAttributeValue);
			}
			break;
		case gender:
			if (memberAttributeValue instanceof Member.Gender || memberAttributeValue == null) {
				setGender((Member.Gender) memberAttributeValue);
			}
			break;
		case birth:
			if (memberAttributeValue instanceof Date || memberAttributeValue == null) {
				setBirth((Date) memberAttributeValue);
			}
			break;
		case area:
			if (memberAttributeValue instanceof Area || memberAttributeValue == null) {
				setArea((Area) memberAttributeValue);
			}
			break;
		case address:
			if (memberAttributeValue instanceof String || memberAttributeValue == null) {
				setAddress((String) memberAttributeValue);
			}
			break;
		case zipCode:
			if (memberAttributeValue instanceof String || memberAttributeValue == null) {
				setZipCode((String) memberAttributeValue);
			}
			break;
		case phone:
			if (memberAttributeValue instanceof String || memberAttributeValue == null) {
				setPhone((String) memberAttributeValue);
			}
			break;
		case mobile:
			if (memberAttributeValue instanceof String || memberAttributeValue == null) {
				setMobile((String) memberAttributeValue);
			}
			break;
		case text:
		case select:
			if ((memberAttributeValue instanceof String || memberAttributeValue == null) && memberAttribute.getPropertyIndex() != null) {
				try {
					String propertyName = ATTRIBUTE_VALUE_PROPERTY_NAME_PREFIX + memberAttribute.getPropertyIndex();
					PropertyUtils.setProperty(this, propertyName, memberAttributeValue);
				} catch (IllegalAccessException e) {
					throw new RuntimeException(e.getMessage(), e);
				} catch (InvocationTargetException e) {
					throw new RuntimeException(e.getMessage(), e);
				} catch (NoSuchMethodException e) {
					throw new RuntimeException(e.getMessage(), e);
				}
			}
			break;
		case checkbox:
			if ((memberAttributeValue instanceof Collection || memberAttributeValue == null) && memberAttribute.getPropertyIndex() != null) {
				try {
					String propertyName = ATTRIBUTE_VALUE_PROPERTY_NAME_PREFIX + memberAttribute.getPropertyIndex();
					PropertyUtils.setProperty(this, propertyName, memberAttributeValue != null ? JsonUtils.toJson(memberAttributeValue) : null);
				} catch (IllegalAccessException e) {
					throw new RuntimeException(e.getMessage(), e);
				} catch (InvocationTargetException e) {
					throw new RuntimeException(e.getMessage(), e);
				} catch (NoSuchMethodException e) {
					throw new RuntimeException(e.getMessage(), e);
				}
			}
			break;
		}
	}

	@Transient
	public void removeAttributeValue() {
		setName(null);
		setGender(null);
		setBirth(null);
		setArea(null);
		setAddress(null);
		setZipCode(null);
		setPhone(null);
		setMobile(null);
		for (int i = 0; i < ATTRIBUTE_VALUE_PROPERTY_COUNT; i++) {
			String propertyName = ATTRIBUTE_VALUE_PROPERTY_NAME_PREFIX + i;
			try {
				PropertyUtils.setProperty(this, propertyName, null);
			} catch (IllegalAccessException e) {
				throw new RuntimeException(e.getMessage(), e);
			} catch (InvocationTargetException e) {
				throw new RuntimeException(e.getMessage(), e);
			} catch (NoSuchMethodException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		}
	}

	@PrePersist
	public void prePersist() {
		setUsername(StringUtils.lowerCase(getUsername()));
		setEmail(StringUtils.lowerCase(getEmail()));
		setLockKey(DigestUtils.md5Hex(UUID.randomUUID() + RandomStringUtils.randomAlphabetic(30)));
	}

	@PreUpdate
	public void preUpdate() {
		setEmail(StringUtils.lowerCase(getEmail()));
	}

}
