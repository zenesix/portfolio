package kr.co.four.emp;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


@Service
public class EmpServiceImpl implements EmpService {
	
	@Inject EmpDAO dao;

	@Override
	public Map login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.login(map) ;
	}
	

}
