/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.template.method;

import java.util.List;
import java.util.regex.Pattern;

import net.shopxx.util.FreeMarkerUtils;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;

@Component("abbreviateMethod")
public class AbbreviateMethod implements TemplateMethodModelEx {

	private static final Pattern PATTERN = Pattern.compile("[\\u4e00-\\u9fa5\\ufe30-\\uffa0]");

	@SuppressWarnings("rawtypes")
	public Object exec(List arguments) throws TemplateModelException {
		String str = FreeMarkerUtils.getArgument(0, String.class, arguments);
		Integer width = FreeMarkerUtils.getArgument(1, Integer.class, arguments);
		String ellipsis = FreeMarkerUtils.getArgument(2, String.class, arguments);
		if (StringUtils.isEmpty(str) || width == null) {
			return str;
		}
		int i = 0;
		for (int strWidth = 0; i < str.length(); i++) {
			strWidth = PATTERN.matcher(String.valueOf(str.charAt(i))).find() ? strWidth + 2 : strWidth + 1;
			if (strWidth == width) {
				break;
			} else if (strWidth > width) {
				i--;
				break;
			}
		}
		return ellipsis != null && i < str.length() - 1 ? StringUtils.substring(str, 0, i + 1) + ellipsis : StringUtils.substring(str, 0, i + 1);
	}

}