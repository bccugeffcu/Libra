/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.listener;

import java.io.File;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import net.shopxx.service.ConfigService;
import net.shopxx.service.SearchService;
import net.shopxx.service.StaticService;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;

@Component("initListener")
public class InitListener implements ServletContextAware, ApplicationListener<ContextRefreshedEvent> {

	private static final String INSTALL_INIT_CONFIG_FILE_PATH = "/install_init.conf";

	private static final Logger LOGGER = Logger.getLogger(InitListener.class.getName());

	private ServletContext servletContext;

	@Value("${system.version}")
	private String systemVersion;
	@Resource(name = "configServiceImpl")
	private ConfigService configService;
	@Resource(name = "staticServiceImpl")
	private StaticService staticService;
	@Resource(name = "searchServiceImpl")
	private SearchService searchService;

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
		if (servletContext != null && contextRefreshedEvent.getApplicationContext().getParent() == null) {
			configService.init();
			try {
				File installInitConfigFile = new File(servletContext.getRealPath(INSTALL_INIT_CONFIG_FILE_PATH));
				if (installInitConfigFile.exists()) {
					staticService.generateAll();
					searchService.purge();
					searchService.index();
					installInitConfigFile.delete();
				} else {
					staticService.generateIndex();
					staticService.generateOther();
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}
	}

}