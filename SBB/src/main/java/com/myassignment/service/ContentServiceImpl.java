package com.myassignment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myassignment.dao.ContentDAO;
import com.myassignment.model.Content;

@Service
@Transactional
public class ContentServiceImpl implements ContentService {

	@Autowired
	private ContentDAO contentDAO;

	@Override
	@Transactional
	public void addContent(Content content) {
		contentDAO.addContent(content);
	}

	@Override
	@Transactional
	public List<Content> getAllContents() {
		return contentDAO.getAllContents();
	}

	@Override
	@Transactional
	public void deleteContent(Integer contentId) {
		contentDAO.deleteContent(contentId);
	}

	public Content getContent(int contentId) {
		return contentDAO.getContent(contentId);
	}

	public Content updateContent(Content content) {
		return contentDAO.updateContent(content);
	}

	public void setContentDAO(ContentDAO contentDAO) {
		this.contentDAO = contentDAO;
	}

}
