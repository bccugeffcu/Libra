/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao;

import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.Member;
import net.shopxx.entity.Message;

public interface MessageDao extends BaseDao<Message, Long> {

	Page<Message> findPage(Member member, Pageable pageable);

	Page<Message> findDraftPage(Member sender, Pageable pageable);

	Long count(Member member, Boolean read);

	void remove(Long id, Member member);

}