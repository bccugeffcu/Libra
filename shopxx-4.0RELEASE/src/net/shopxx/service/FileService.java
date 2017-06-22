/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import net.shopxx.FileType;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {

	boolean isValid(FileType fileType, MultipartFile multipartFile);

	String upload(FileType fileType, MultipartFile multipartFile, boolean async);

	String upload(FileType fileType, MultipartFile multipartFile);

	String uploadLocal(FileType fileType, MultipartFile multipartFile);

}