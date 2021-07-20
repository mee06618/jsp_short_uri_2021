package com.jhs.exam.exam2.repository;

import com.jhs.exam.exam2.dto.Member;
import com.jhs.exam.exam2.dto.Site;
import com.jhs.mysqliutil.MysqlUtil;
import com.jhs.mysqliutil.SecSql;

public class MemberRepository {

	public Member getMemberByLoginId(String loginId) {
		SecSql sql = new SecSql();
		sql.append("SELECT M.*");
		sql.append("FROM member AS M");
		sql.append("WHERE M.loginId = ?", loginId);
		
		return MysqlUtil.selectRow(sql, Member.class);
	}

	public int checkMember(String id, String password) {
		SecSql sql = new SecSql();
		sql.append("SELECT count(*)");
		sql.append("FROM member");
		sql.append("WHERE loginId=?", id);
		sql.append("and loginPw=?", password);
		
		return MysqlUtil.selectRowIntValue(sql);
	}

	public Member getNickname(String id) {
		SecSql sql = new SecSql();
		sql.append("select nickname from member");
		sql.append("where loginId=?",id);

		
		
		return MysqlUtil.selectRow(sql,Member.class);
	}

}
