package com.myassignment.dao;

import java.util.List;

import com.myassignment.model.Content;

public interface ContentDAO {

	public void addContent(Content content);

	public List<Content> getAllContents();

	public void deleteContent(Integer contentId);

	public Content updateContent(Content content);

	public Content getContent(int contentid);
}
