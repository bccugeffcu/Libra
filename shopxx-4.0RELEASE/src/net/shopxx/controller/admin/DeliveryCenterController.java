/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.controller.admin;

import javax.annotation.Resource;

import net.shopxx.Message;
import net.shopxx.Pageable;
import net.shopxx.entity.DeliveryCenter;
import net.shopxx.service.AreaService;
import net.shopxx.service.DeliveryCenterService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller("adminDeliveryCenterController")
@RequestMapping("/admin/delivery_center")
public class DeliveryCenterController extends BaseController {

	@Resource(name = "deliveryCenterServiceImpl")
	private DeliveryCenterService deliveryCenterService;
	@Resource(name = "areaServiceImpl")
	private AreaService areaService;

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add() {
		return "/admin/delivery_center/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(DeliveryCenter deliveryCenter, Long areaId, Model model, RedirectAttributes redirectAttributes) {
		deliveryCenter.setArea(areaService.find(areaId));
		if (!isValid(deliveryCenter)) {
			return ERROR_VIEW;
		}
		deliveryCenter.setAreaName(null);
		deliveryCenterService.save(deliveryCenter);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, Model model) {
		model.addAttribute("deliveryCenter", deliveryCenterService.find(id));
		return "/admin/delivery_center/edit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(DeliveryCenter deliveryCenter, Long areaId, RedirectAttributes redirectAttributes) {
		deliveryCenter.setArea(areaService.find(areaId));
		if (!isValid(deliveryCenter)) {
			return ERROR_VIEW;
		}
		deliveryCenterService.update(deliveryCenter, "areaName");
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, Pageable pageable) {
		model.addAttribute("page", deliveryCenterService.findPage(pageable));
		return "/admin/delivery_center/list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody
	Message delete(Long[] ids) {
		deliveryCenterService.delete(ids);
		return SUCCESS_MESSAGE;
	}

}