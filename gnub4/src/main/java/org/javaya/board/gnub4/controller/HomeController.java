package org.javaya.board.gnub4.controller;

import java.util.List;
import java.util.Locale;

import org.javaya.board.gnub4.service.CommonService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
@SuppressWarnings("rawtypes")
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private CommonService commonService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("common/common_list");

		List list = commonService.getCommonList();
		logger.debug(list.toString());
		
		mav.addObject("list", list);
		return mav;
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/common", method = RequestMethod.GET)
	public ModelAndView common(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("common/common_list");
		
		List list = commonService.getCommonList();
		logger.debug(list.toString());
		
		mav.addObject("list", list);
		return mav;
	}
	
}
