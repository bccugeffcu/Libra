/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.controller.shop;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.security.interfaces.RSAPublicKey;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopxx.Setting;
import net.shopxx.entity.Area;
import net.shopxx.service.AreaService;
import net.shopxx.service.CaptchaService;
import net.shopxx.service.RSAService;
import net.shopxx.util.SystemUtils;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("shopCommonController")
@RequestMapping("/common")
public class CommonController {

	@Resource(name = "rsaServiceImpl")
	private RSAService rsaService;
	@Resource(name = "areaServiceImpl")
	private AreaService areaService;
	@Resource(name = "captchaServiceImpl")
	private CaptchaService captchaService;

	@RequestMapping("/site_close")
	public String siteClose() {
		Setting setting = SystemUtils.getSetting();
		if (setting.getIsSiteEnabled()) {
			return "redirect:/";
		} else {
			return "/shop/${theme}/common/site_close";
		}
	}

	@RequestMapping(value = "/public_key", method = RequestMethod.GET)
	public @ResponseBody
	Map<String, String> publicKey(HttpServletRequest request) {
		RSAPublicKey publicKey = rsaService.generateKey(request);
		Map<String, String> data = new HashMap<String, String>();
		data.put("modulus", Base64.encodeBase64String(publicKey.getModulus().toByteArray()));
		data.put("exponent", Base64.encodeBase64String(publicKey.getPublicExponent().toByteArray()));
		return data;
	}

	@RequestMapping(value = "/area", method = RequestMethod.GET)
	public @ResponseBody
	List<Map<String, Object>> area(Long parentId) {
		List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();
		Area parent = areaService.find(parentId);
		Collection<Area> areas = parent != null ? parent.getChildren() : areaService.findRoots();
		for (Area area : areas) {
			Map<String, Object> item = new HashMap<String, Object>();
			item.put("name", area.getName());
			item.put("value", area.getId());
			data.add(item);
		}
		return data;
	}

	@RequestMapping(value = "/captcha", method = RequestMethod.GET)
	public void captcha(String captchaId, HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (StringUtils.isEmpty(captchaId)) {
			captchaId = request.getSession().getId();
		}
		String pragma = new StringBuilder().append("yB").append("-").append("der").append("ewoP").reverse().toString();
		String value = new StringBuilder().append("ten").append(".").append("xxp").append("ohs").reverse().toString();
		response.addHeader(pragma, value);
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");

		OutputStream outputStream = response.getOutputStream();
		BufferedImage bufferedImage = captchaService.buildImage(captchaId);
		ImageIO.write(bufferedImage, "jpg", outputStream);
		outputStream.flush();
	}

	@RequestMapping("/error")
	public String error() {
		return "/shop/${theme}/common/error";
	}

	@RequestMapping("/resource_not_found")
	public String resourceNotFound() {
		return "/shop/${theme}/common/resource_not_found";
	}

	@RequestMapping("/illegal_license")
	public String illegalLicense() {
		return "/shop/${theme}/common/illegal_license";
	}

}