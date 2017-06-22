/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.util.List;

import net.shopxx.entity.SpecificationItem;
import net.shopxx.entity.SpecificationValue;

public interface SpecificationValueService {

	boolean isValid(List<SpecificationItem> specificationItems, List<SpecificationValue> specificationValues);

}