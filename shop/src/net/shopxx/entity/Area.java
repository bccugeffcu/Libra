/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.PreRemove;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang.StringUtils;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "xx_area")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_area")
public class Area extends OrderEntity<Long> {

	private static final long serialVersionUID = -6589805576890551817L;

	public static final String TREE_PATH_SEPARATOR = ",";

	private String name;

	private String fullName;

	private String treePath;

	private Integer grade;

	private Area parent;

	private Set<Area> children = new HashSet<Area>();

	private Set<Member> members = new HashSet<Member>();

	private Set<Receiver> receivers = new HashSet<Receiver>();

	private Set<Order> orders = new HashSet<Order>();

	private Set<DeliveryCenter> deliveryCenters = new HashSet<DeliveryCenter>();

	private Set<FreightConfig> freightConfigs = new HashSet<FreightConfig>();

	@NotEmpty
	@Length(max = 200)
	@Column(nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(nullable = false, length = 4000)
	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	@Column(nullable = false)
	public String getTreePath() {
		return treePath;
	}

	public void setTreePath(String treePath) {
		this.treePath = treePath;
	}

	@Column(nullable = false)
	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	public Area getParent() {
		return parent;
	}

	public void setParent(Area parent) {
		this.parent = parent;
	}

	@OneToMany(mappedBy = "parent", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@OrderBy("order asc")
	public Set<Area> getChildren() {
		return children;
	}

	public void setChildren(Set<Area> children) {
		this.children = children;
	}

	@OneToMany(mappedBy = "area", fetch = FetchType.LAZY)
	public Set<Member> getMembers() {
		return members;
	}

	public void setMembers(Set<Member> members) {
		this.members = members;
	}

	@OneToMany(mappedBy = "area", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	public Set<Receiver> getReceivers() {
		return receivers;
	}

	public void setReceivers(Set<Receiver> receivers) {
		this.receivers = receivers;
	}

	@OneToMany(mappedBy = "area", fetch = FetchType.LAZY)
	public Set<Order> getOrders() {
		return orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	@OneToMany(mappedBy = "area", fetch = FetchType.LAZY)
	public Set<DeliveryCenter> getDeliveryCenters() {
		return deliveryCenters;
	}

	public void setDeliveryCenters(Set<DeliveryCenter> deliveryCenters) {
		this.deliveryCenters = deliveryCenters;
	}

	@OneToMany(mappedBy = "area", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	public Set<FreightConfig> getFreightConfigs() {
		return freightConfigs;
	}

	public void setFreightConfigs(Set<FreightConfig> freightConfigs) {
		this.freightConfigs = freightConfigs;
	}

	@Transient
	public Long[] getParentIds() {
		String[] parentIds = StringUtils.split(getTreePath(), TREE_PATH_SEPARATOR);
		Long[] result = new Long[parentIds.length];
		for (int i = 0; i < parentIds.length; i++) {
			result[i] = Long.valueOf(parentIds[i]);
		}
		return result;
	}

	@Transient
	public List<Area> getParents() {
		List<Area> parents = new ArrayList<Area>();
		recursiveParents(parents, this);
		return parents;
	}

	private void recursiveParents(List<Area> parents, Area area) {
		if (area == null) {
			return;
		}
		Area parent = area.getParent();
		if (parent != null) {
			parents.add(0, parent);
			recursiveParents(parents, parent);
		}
	}

	@PreRemove
	public void preRemove() {
		Set<Member> members = getMembers();
		if (members != null) {
			for (Member member : members) {
				member.setArea(null);
			}
		}
		Set<Order> orders = getOrders();
		if (orders != null) {
			for (Order order : orders) {
				order.setArea(null);
			}
		}
		Set<DeliveryCenter> deliveryCenters = getDeliveryCenters();
		if (deliveryCenters != null) {
			for (DeliveryCenter deliveryCenter : deliveryCenters) {
				deliveryCenter.setArea(null);
			}
		}
	}

}
