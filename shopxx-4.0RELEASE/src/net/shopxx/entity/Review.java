/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "xx_review")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_review")
public class Review extends BaseEntity<Long> {

	private static final long serialVersionUID = 5637791196323852707L;

	private static final String PATH_PREFIX = "/review/content";

	private static final String PATH_SUFFIX = ".jhtml";

	public enum Type {

		positive,

		moderate,

		negative
	}

	private Integer score;

	private String content;

	private Boolean isShow;

	private String ip;

	private Member member;

	private Goods goods;

	@NotNull
	@Min(1)
	@Max(5)
	@Column(nullable = false, updatable = false)
	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@NotEmpty
	@Length(max = 200)
	@Column(nullable = false, updatable = false)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(nullable = false)
	public Boolean getIsShow() {
		return isShow;
	}

	public void setIsShow(Boolean isShow) {
		this.isShow = isShow;
	}

	@Column(nullable = false, updatable = false)
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(updatable = false)
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false, updatable = false)
	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	@Transient
	public String getPath() {
		return getGoods() != null && getGoods().getId() != null ? PATH_PREFIX + "/" + getGoods().getId() + PATH_SUFFIX : null;
	}

}
