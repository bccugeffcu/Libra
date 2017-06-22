/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.controller.admin;

import javax.annotation.Resource;

import net.shopxx.Message;
import net.shopxx.Setting;
import net.shopxx.Theme;
import net.shopxx.service.CacheService;
import net.shopxx.service.ThemeService;
import net.shopxx.util.SystemUtils;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller("adminThemeController")
@RequestMapping("/admin/theme")
public class ThemeController extends BaseController {

	@Resource(name = "themeServiceImpl")
	private ThemeService themeService;
	@Resource(name = "cacheServiceImpl")
	private CacheService cacheService;

	@RequestMapping(value = "/setting", method = RequestMethod.GET)
	public String setting(ModelMap model) {
		model.addAttribute("themes", themeService.getAll());
		return "/admin/theme/setting";
	}

	@RequestMapping(value = "/setting", method = RequestMethod.POST)
	public String setting(String id, MultipartFile themeFile, RedirectAttributes redirectAttributes) {
		if (themeFile != null && !themeFile.isEmpty()) {
			if (!FilenameUtils.isExtension(themeFile.getOriginalFilename(), "zip")) {
				addFlashMessage(redirectAttributes, Message.error("admin.upload.invalid"));
				return "redirect:setting.jhtml";
			}
			if (!themeService.upload(themeFile)) {
				addFlashMessage(redirectAttributes, Message.error("admin.theme.uploadInvalid"));
				return "redirect:setting.jhtml";
			}
		}
		Theme theme = themeService.get(id);
		if (theme == null) {
			return ERROR_VIEW;
		}
		Setting setting = SystemUtils.getSetting();
		setting.setTheme(theme.getId());
		SystemUtils.setSetting(setting);
		cacheService.clear();
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:setting.jhtml";
	}

}