package kr.co.four.emp;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class EmpDAOImpl implements EmpDAO{
	
	@Inject SqlSession sqlsession;

	@Override
	public Map login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("kr.co.four.empMapper.login", map); //밥먹고와서 서비스만들기: 완료
	}

}
