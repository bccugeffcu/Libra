/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.controller.admin;

import javax.annotation.Resource;

import net.shopxx.Message;
import net.shopxx.Pageable;
import net.shopxx.entity.AdPosition;
import net.shopxx.service.AdPositionService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller("adminAdPositionController")
@RequestMapping("/admin/ad_position")
public class AdPositionController extends BaseController {

	@Resource(name = "adPositionServiceImpl")
	private AdPositionService adPositionService;

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		return "/admin/ad_position/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(AdPosition adPosition, RedirectAttributes redirectAttributes) {
		if (!isValid(adPosition)) {
			return ERROR_VIEW;
		}
		adPosition.setAds(null);
		adPositionService.save(adPosition);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, ModelMap model) {
		model.addAttribute("adPosition", adPositionService.find(id));
		return "/admin/ad_position/edit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(AdPosition adPosition, RedirectAttributes redirectAttributes) {
		if (!isValid(adPosition)) {
			return ERROR_VIEW;
		}
		adPositionService.update(adPosition, "ads");
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Pageable pageable, ModelMap model) {
		model.addAttribute("page", adPositionService.findPage(pageable));
		return "/admin/ad_position/list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody
	Message delete(Long[] ids) {
		adPositionService.delete(ids);
		return SUCCESS_MESSAGE;
	}

}