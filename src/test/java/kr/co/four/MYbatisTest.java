//마이바티스가 잘붙었는지 테스트 하는 코드
package kr.co.four;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })

public class MYbatisTest {
	@Inject
	private SqlSessionFactory sqlFactory;
	
	@Test
	public void testFactory() {
		System.out.println(sqlFactory);
	}
	@Test
	public void tesSession() throws Exception {
		try (SqlSession session = sqlFactory.openSession()){
			System.out.println();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
