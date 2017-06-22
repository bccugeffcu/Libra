/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao.impl;

import net.shopxx.dao.AdPositionDao;
import net.shopxx.entity.AdPosition;

import org.springframework.stereotype.Repository;

@Repository("adPositionDaoImpl")
public class AdPositionDaoImpl extends BaseDaoImpl<AdPosition, Long> implements AdPositionDao {

}