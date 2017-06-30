/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.shopxx.entity.ParameterValue;
import net.shopxx.service.ParameterValueService;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.Predicate;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

@Service("parameterValueServiceImpl")
public class ParameterValueServiceImpl implements ParameterValueService {

	public void filter(List<ParameterValue> parameterValues) {
		CollectionUtils.filter(parameterValues, new Predicate() {
			public boolean evaluate(Object object) {
				ParameterValue parameterValue = (ParameterValue) object;
				if (parameterValue == null || StringUtils.isEmpty(parameterValue.getGroup())) {
					return false;
				}
				CollectionUtils.filter(parameterValue.getEntries(), new Predicate() {
					private Set<String> set = new HashSet<String>();

					public boolean evaluate(Object object) {
						ParameterValue.Entry entry = (ParameterValue.Entry) object;
						return entry != null && StringUtils.isNotEmpty(entry.getName()) && StringUtils.isNotEmpty(entry.getValue()) && set.add(entry.getName());
					}
				});
				return CollectionUtils.isNotEmpty(parameterValue.getEntries());
			}
		});
	}

}