/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.util.List;

import net.shopxx.entity.ProductImage;

public interface ProductImageService {

	void filter(List<ProductImage> productImages);

	boolean isValid(ProductImage productImage);

	void generate(ProductImage productImage);

	void generate(List<ProductImage> productImages);

}