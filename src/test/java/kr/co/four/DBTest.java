package kr.co.four;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class DBTest {
	@Test
	public void test() throws Exception{
		Class.forName("org.mariadb.jdbc.Driver");
		
		//Connection 클래스 사용
		String url ="jdbc:mariadb://localhost:3306/webstore";
		String username = "myself";
		String password = "1234"; 
		Connection conn = DriverManager.getConnection(url, username, password);
		System.out.println(conn);
		System.out.println("데이터 베이스 연결성공!");
	}

}
