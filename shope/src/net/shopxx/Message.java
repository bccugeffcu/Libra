/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx;

import net.shopxx.util.SpringUtils;

public class Message {

	public enum Type {

		success,

		warn,

		error
	}

	private Message.Type type;

	private String content;

	public Message() {
	}

	public Message(Message.Type type, String content) {
		this.type = type;
		this.content = content;
	}

	public Message(Message.Type type, String content, Object... args) {
		this.type = type;
		this.content = SpringUtils.getMessage(content, args);
	}

	public static Message success(String content, Object... args) {
		return new Message(Message.Type.success, content, args);
	}

	public static Message warn(String content, Object... args) {
		return new Message(Message.Type.warn, content, args);
	}

	public static Message error(String content, Object... args) {
		return new Message(Message.Type.error, content, args);
	}

	public Message.Type getType() {
		return type;
	}

	public void setType(Message.Type type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return SpringUtils.getMessage(content);
	}

}