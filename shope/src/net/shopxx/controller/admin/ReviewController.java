/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.controller.admin;

import javax.annotation.Resource;

import net.shopxx.Message;
import net.shopxx.Pageable;
import net.shopxx.entity.Review;
import net.shopxx.service.ReviewService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller("adminReviewController")
@RequestMapping("/admin/review")
public class ReviewController extends BaseController {

	@Resource(name = "reviewServiceImpl")
	private ReviewService reviewService;

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, ModelMap model) {
		model.addAttribute("review", reviewService.find(id));
		return "/admin/review/edit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Long id, @RequestParam(defaultValue = "false") Boolean isShow, RedirectAttributes redirectAttributes) {
		Review review = reviewService.find(id);
		if (review == null) {
			return ERROR_VIEW;
		}
		review.setIsShow(isShow);
		reviewService.update(review);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Review.Type type, Pageable pageable, ModelMap model) {
		model.addAttribute("type", type);
		model.addAttribute("types", Review.Type.values());
		model.addAttribute("page", reviewService.findPage(null, null, type, null, pageable));
		return "/admin/review/list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody
	Message delete(Long[] ids) {
		reviewService.delete(ids);
		return SUCCESS_MESSAGE;
	}

}