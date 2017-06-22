/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import net.shopxx.Setting;
import net.shopxx.TemplateConfig;
import net.shopxx.util.SystemUtils;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Store;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.nodes.TextNode;

@Indexed
@Entity
@Table(name = "xx_article")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_article")
public class Article extends BaseEntity<Long> {

	private static final long serialVersionUID = 4300028137636948650L;

	public static final String HITS_CACHE_NAME = "articleHits";

	private static final int PAGE_CONTENT_LENGTH = 2000;

	private static final String PAGE_BREAK_TAG = "shopxx_page_break_tag";

	private static final Pattern PARAGRAPH_PATTERN = Pattern.compile("[^,;\\.!?，；。！？]*([,;\\.!?，；。！？]+|$)");

	public enum GenerateMethod {

		none,

		eager,

		lazy
	}

	private String title;

	private String author;

	private String content;

	private String seoTitle;

	private String seoKeywords;

	private String seoDescription;

	private Boolean isPublication;

	private Boolean isTop;

	private Long hits;

	private Article.GenerateMethod generateMethod;

	private ArticleCategory articleCategory;

	private Set<Tag> tags = new HashSet<Tag>();

	@Field(store = Store.YES, index = Index.YES, analyze = Analyze.YES)
	@NotEmpty
	@Length(max = 200)
	@Column(nullable = false)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Field(store = Store.YES, index = Index.NO, analyze = Analyze.NO)
	@Length(max = 200)
	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Field(store = Store.YES, index = Index.YES, analyze = Analyze.YES)
	@Lob
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Length(max = 200)
	public String getSeoTitle() {
		return seoTitle;
	}

	public void setSeoTitle(String seoTitle) {
		this.seoTitle = seoTitle;
	}

	@Length(max = 200)
	public String getSeoKeywords() {
		return seoKeywords;
	}

	public void setSeoKeywords(String seoKeywords) {
		if (seoKeywords != null) {
			seoKeywords = seoKeywords.replaceAll("[,\\s]*,[,\\s]*", ",").replaceAll("^,|,$", "");
		}
		this.seoKeywords = seoKeywords;
	}

	@Length(max = 200)
	public String getSeoDescription() {
		return seoDescription;
	}

	public void setSeoDescription(String seoDescription) {
		this.seoDescription = seoDescription;
	}

	@Field(store = Store.YES, index = Index.YES, analyze = Analyze.NO)
	@NotNull
	@Column(nullable = false)
	public Boolean getIsPublication() {
		return isPublication;
	}

	public void setIsPublication(Boolean isPublication) {
		this.isPublication = isPublication;
	}

	@Field(store = Store.YES, index = Index.YES, analyze = Analyze.NO)
	@NotNull
	@Column(nullable = false)
	public Boolean getIsTop() {
		return isTop;
	}

	public void setIsTop(Boolean isTop) {
		this.isTop = isTop;
	}

	@Column(nullable = false)
	public Long getHits() {
		return hits;
	}

	public void setHits(Long hits) {
		this.hits = hits;
	}

	@Column(nullable = false)
	public Article.GenerateMethod getGenerateMethod() {
		return generateMethod;
	}

	public void setGenerateMethod(Article.GenerateMethod generateMethod) {
		this.generateMethod = generateMethod;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false)
	public ArticleCategory getArticleCategory() {
		return articleCategory;
	}

	public void setArticleCategory(ArticleCategory articleCategory) {
		this.articleCategory = articleCategory;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "xx_article_tag")
	@OrderBy("order asc")
	public Set<Tag> getTags() {
		return tags;
	}

	public void setTags(Set<Tag> tags) {
		this.tags = tags;
	}

	@Transient
	public String getPath() {
		return getPath(1);
	}

	@Transient
	public String getPath(Integer pageNumber) {
		if (pageNumber == null || pageNumber < 1) {
			return null;
		}
		TemplateConfig templateConfig = SystemUtils.getTemplateConfig("articleContent");
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("article", this);
		model.put("pageNumber", pageNumber);
		return templateConfig.getRealStaticPath(model);
	}

	@Transient
	public String getUrl() {
		return getUrl(1);
	}

	@Transient
	public String getUrl(Integer pageNumber) {
		if (pageNumber == null || pageNumber < 1) {
			return null;
		}
		Setting setting = SystemUtils.getSetting();
		return setting.getSiteUrl() + getPath(pageNumber);
	}

	@Transient
	public String getText() {
		if (StringUtils.isEmpty(getContent())) {
			return StringUtils.EMPTY;
		}
		return StringUtils.remove(Jsoup.parse(getContent()).text(), PAGE_BREAK_TAG);
	}

	@Transient
	public String[] getPageContents() {
		if (StringUtils.isEmpty(getContent())) {
			return new String[] { StringUtils.EMPTY };
		}
		if (StringUtils.contains(getContent(), PAGE_BREAK_TAG)) {
			return StringUtils.splitByWholeSeparator(getContent(), PAGE_BREAK_TAG);
		}
		List<Node> childNodes = Jsoup.parse(getContent()).body().childNodes();
		if (CollectionUtils.isEmpty(childNodes)) {
			return new String[] { getContent() };
		}
		List<String> pageContents = new ArrayList<String>();
		int textLength = 0;
		StringBuilder paragraph = new StringBuilder();
		for (Node node : childNodes) {
			if (node instanceof Element) {
				Element element = (Element) node;
				paragraph.append(element.outerHtml());
				textLength += element.text().length();
				if (textLength >= PAGE_CONTENT_LENGTH) {
					pageContents.add(paragraph.toString());
					textLength = 0;
					paragraph.setLength(0);
				}
			} else if (node instanceof TextNode) {
				TextNode textNode = (TextNode) node;
				Matcher matcher = PARAGRAPH_PATTERN.matcher(textNode.text());
				while (matcher.find()) {
					String content = matcher.group();
					paragraph.append(content);
					textLength += content.length();
					if (textLength >= PAGE_CONTENT_LENGTH) {
						pageContents.add(paragraph.toString());
						textLength = 0;
						paragraph.setLength(0);
					}
				}
			}
		}
		String pageContent = paragraph.toString();
		if (StringUtils.isNotEmpty(pageContent)) {
			pageContents.add(pageContent);
		}
		return pageContents.toArray(new String[pageContents.size()]);
	}

	@Transient
	public String getPageContent(Integer pageNumber) {
		if (pageNumber == null || pageNumber < 1) {
			return null;
		}
		String[] pageContents = getPageContents();
		if (pageContents.length < pageNumber) {
			return null;
		}
		return pageContents[pageNumber - 1];
	}

	@Transient
	public int getTotalPages() {
		return getPageContents().length;
	}

}
