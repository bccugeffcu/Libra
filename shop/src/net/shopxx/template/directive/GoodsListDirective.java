/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.template.directive;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.shopxx.Filter;
import net.shopxx.Order;
import net.shopxx.entity.Goods;
import net.shopxx.service.GoodsService;
import net.shopxx.util.FreeMarkerUtils;

import org.apache.commons.lang.math.NumberUtils;
import org.springframework.stereotype.Component;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

@Component("goodsListDirective")
public class GoodsListDirective extends BaseDirective {

	private static final String TYPE_PARAMETER_NAME = "type";

	private static final String PRODUCT_CATEGORY_ID_PARAMETER_NAME = "productCategoryId";

	private static final String BRAND_ID_PARAMETER_NAME = "brandId";

	private static final String PROMOTION_ID_PARAMETER_NAME = "promotionId";

	private static final String TAG_ID_PARAMETER_NAME = "tagId";

	private static final String ATTRIBUTE_VALUE_PARAMETER_NAME = "attributeValue";

	private static final String START_PRICE_PARAMETER_NAME = "startPrice";

	private static final String END_PRICE_PARAMETER_NAME = "endPrice";

	private static final String HAS_PROMOTION_PARAMETER_NAME = "hasPromotion";

	private static final String ORDER_TYPE_PARAMETER_NAME = "orderType";

	private static final String VARIABLE_NAME = "goodsList";

	@Resource(name = "goodsServiceImpl")
	private GoodsService goodsService;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
		Goods.Type type = FreeMarkerUtils.getParameter(TYPE_PARAMETER_NAME, Goods.Type.class, params);
		Long productCategoryId = FreeMarkerUtils.getParameter(PRODUCT_CATEGORY_ID_PARAMETER_NAME, Long.class, params);
		Long brandId = FreeMarkerUtils.getParameter(BRAND_ID_PARAMETER_NAME, Long.class, params);
		Long promotionId = FreeMarkerUtils.getParameter(PROMOTION_ID_PARAMETER_NAME, Long.class, params);
		Long tagId = FreeMarkerUtils.getParameter(TAG_ID_PARAMETER_NAME, Long.class, params);
		Map<String, String> attributeValue = FreeMarkerUtils.getParameter(ATTRIBUTE_VALUE_PARAMETER_NAME, Map.class, params);
		BigDecimal startPrice = FreeMarkerUtils.getParameter(START_PRICE_PARAMETER_NAME, BigDecimal.class, params);
		BigDecimal endPrice = FreeMarkerUtils.getParameter(END_PRICE_PARAMETER_NAME, BigDecimal.class, params);
		Boolean hasPromotion = FreeMarkerUtils.getParameter(HAS_PROMOTION_PARAMETER_NAME, Boolean.class, params);
		Goods.OrderType orderType = FreeMarkerUtils.getParameter(ORDER_TYPE_PARAMETER_NAME, Goods.OrderType.class, params);
		Integer count = getCount(params);
		List<Filter> filters = getFilters(params, Goods.class);
		List<Order> orders = getOrders(params);
		boolean useCache = useCache(env, params);
		Map<Long, String> attributeValueMap = new HashMap<Long, String>();
		if (attributeValue != null) {
			for (Map.Entry<String, String> entry : attributeValue.entrySet()) {
				if (NumberUtils.isDigits(entry.getKey())) {
					Long attributeId = Long.valueOf(entry.getKey());
					attributeValueMap.put(attributeId, entry.getValue());
				}
			}
		}
		List<Goods> goodsList = goodsService.findList(type, productCategoryId, brandId, promotionId, tagId, attributeValueMap, startPrice, endPrice, true, true, null, null, null, hasPromotion, orderType, count, filters, orders, useCache);
		setLocalVariable(VARIABLE_NAME, goodsList, env, body);
	}

}