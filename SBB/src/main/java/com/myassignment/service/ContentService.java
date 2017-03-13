package com.myassignment.service;

import java.util.List;

import com.myassignment.model.Content;


public interface ContentService {
	
	public void addContent(Content content);

	public List<Content> getAllContents();

	public void deleteContent(Integer contentId);

	public Content getContent(int contentId);

	public Content updateContent(Content content);
	
}
