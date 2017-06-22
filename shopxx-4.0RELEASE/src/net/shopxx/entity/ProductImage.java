/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import java.io.Serializable;

import javax.validation.constraints.Min;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.builder.CompareToBuilder;
import org.hibernate.validator.constraints.Length;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class ProductImage implements Serializable, Comparable<ProductImage> {

	private static final long serialVersionUID = -3972485036781675033L;

	private String title;

	private String source;

	private String large;

	private String medium;

	private String thumbnail;

	private Integer order;

	private MultipartFile file;

	@Length(max = 200)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getLarge() {
		return large;
	}

	public void setLarge(String large) {
		this.large = large;
	}

	public String getMedium() {
		return medium;
	}

	public void setMedium(String medium) {
		this.medium = medium;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	@Min(0)
	public Integer getOrder() {
		return order;
	}

	public void setOrder(Integer order) {
		this.order = order;
	}

	@JsonIgnore
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@JsonIgnore
	public boolean isEmpty() {
		return (getFile() == null || getFile().isEmpty()) && (StringUtils.isEmpty(getSource()) || StringUtils.isEmpty(getLarge()) || StringUtils.isEmpty(getMedium()) || StringUtils.isEmpty(getThumbnail()));
	}

	public int compareTo(ProductImage productImage) {
		if (productImage == null) {
			return 1;
		}
		return new CompareToBuilder().append(getOrder(), productImage.getOrder()).toComparison();
	}

}
