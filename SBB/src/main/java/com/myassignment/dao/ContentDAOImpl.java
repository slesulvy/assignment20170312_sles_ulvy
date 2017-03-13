package com.myassignment.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myassignment.model.Content;

@Repository
public class ContentDAOImpl implements ContentDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addContent(Content content) {
		sessionFactory.getCurrentSession().saveOrUpdate(content);

	}

	@SuppressWarnings("unchecked")
	public List<Content> getAllContents() {

		return sessionFactory.getCurrentSession().createQuery("from Content cont order by cont.id desc").list(); // from Content (Content is a class model)
	}

	@Override
	public void deleteContent(Integer contentId) {
		Content content = (Content) sessionFactory.getCurrentSession().load(
				Content.class, contentId);
		if (null != content) {
			this.sessionFactory.getCurrentSession().delete(content);
		}

	}

	public Content getContent(int contentId) {
		return (Content) sessionFactory.getCurrentSession().get(
				Content.class, contentId);
	}

	@Override
	public Content updateContent(Content content) {
		sessionFactory.getCurrentSession().update(content);
		return content;
	}

}