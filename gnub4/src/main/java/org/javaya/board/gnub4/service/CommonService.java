package org.javaya.board.gnub4.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.javaya.board.gnub4.dao.CommonDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@SuppressWarnings("rawtypes")
public class CommonService {
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private CommonDao commonDao = null;
	public CommonDao getCommonDao() {
		return commonDao;
	}
	public void setCommonDao(CommonDao sampleDao) {
		this.commonDao = sampleDao;
	}
	
	public List getCommonList() {
		logger.debug("getCommonInfo()");
		return this.commonDao.getCommonList();
	}
	
}
