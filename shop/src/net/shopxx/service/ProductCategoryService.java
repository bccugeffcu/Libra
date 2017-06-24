/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.util.List;

import net.shopxx.entity.ProductCategory;

public interface ProductCategoryService extends BaseService<ProductCategory, Long> {

	List<ProductCategory> findRoots();

	List<ProductCategory> findRoots(Integer count);

	List<ProductCategory> findRoots(Integer count, boolean useCache);

	List<ProductCategory> findParents(ProductCategory productCategory, boolean recursive, Integer count);

	List<ProductCategory> findParents(Long productCategoryId, boolean recursive, Integer count, boolean useCache);

	List<ProductCategory> findTree();

	List<ProductCategory> findChildren(ProductCategory productCategory, boolean recursive, Integer count);

	List<ProductCategory> findChildren(Long productCategoryId, boolean recursive, Integer count, boolean useCache);

}