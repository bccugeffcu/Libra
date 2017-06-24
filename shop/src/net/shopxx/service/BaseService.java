/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.io.Serializable;
import java.util.List;

import net.shopxx.Filter;
import net.shopxx.Order;
import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.BaseEntity;

public interface BaseService<T extends BaseEntity<ID>, ID extends Serializable> {

	T find(ID id);

	List<T> findAll();

	List<T> findList(ID... ids);

	List<T> findList(Integer count, List<Filter> filters, List<Order> orders);

	List<T> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders);

	Page<T> findPage(Pageable pageable);

	long count();

	long count(Filter... filters);

	boolean exists(ID id);

	boolean exists(Filter... filters);

	T save(T entity);

	T update(T entity);

	T update(T entity, String... ignoreProperties);

	void delete(ID id);

	void delete(ID... ids);

	void delete(T entity);

}