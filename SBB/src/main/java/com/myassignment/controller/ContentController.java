package com.myassignment.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myassignment.model.Content;
import com.myassignment.service.ContentService;

@Controller
public class ContentController {

	private static final Logger logger = Logger
			.getLogger(ContentController.class);

	public ContentController() {
		System.out.println("ContentController()");
	}

	@Autowired
	private ContentService contentService;

	@RequestMapping(value = "/")
	public ModelAndView listContent(ModelAndView model) throws IOException {
		List<Content> listContent = contentService.getAllContents();
		model.addObject("listContent", listContent);
		model.setViewName("home");
		return model;
	}

	@RequestMapping(value = "/newContent", method = RequestMethod.GET)
	public ModelAndView newContent(ModelAndView model) {
		Content content = new Content();
		model.addObject("content", content);
		model.setViewName("registerNew");
		return model;
	}

	@RequestMapping(value = "/saveContent", method = RequestMethod.POST)
	public ModelAndView saveContent(@ModelAttribute Content content) {
		if (content.getId() == 0) { 
			contentService.addContent(content);
		} else {
			contentService.updateContent(content);
		}
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/deleteContent", method = RequestMethod.GET)
	public ModelAndView deleteContent(HttpServletRequest request) {
		int contentId = Integer.parseInt(request.getParameter("id"));
		contentService.deleteContent(contentId);
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/showContent", method = RequestMethod.GET)
	public ModelAndView showContent(HttpServletRequest request) {
		int contentId = Integer.parseInt(request.getParameter("id"));
		Content content = contentService.getContent(contentId);
		ModelAndView model = new ModelAndView("detail");
		model.addObject("content", content);

		return model;
	}

}