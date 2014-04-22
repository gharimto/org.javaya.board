package org.javaya.board.gnub4.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("sampleDao")
@SuppressWarnings("rawtypes")
public class CommonDao {
	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private SqlSessionTemplate sqlSession;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
		logger.debug(">>>setSqlSession");
	}
	
	public List getCommonList() {
		return sqlSession.selectList("getCommonList");
	}

}
