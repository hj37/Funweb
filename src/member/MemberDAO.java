package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	//커넥션풀(DataSource)을 얻은 후 ConnectionDB접속 
	private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		//커넥션풀에 존재하는 커넥션 얻기 
		Connection con = ds.getConnection();
		//커넥션 반환
		return con;
	}
	
	/*insertMember()메소드 : 
	 * 가입할 회원정보들을? MemberBean객체의 각 변수에 저장한 후 매개변수로 전달받아 DB에 INSERT*/
	public void insertMember(MemberBean memberBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="";
		/*메소드안에서 지역변수라서 초기화를 해야함*/
		
		
		try {
			//커넥션풀로부터 커넥션얻기 (DB접속) 
			con = getConnection();
			sql = "insert into member(id,passwd,name,reg_date,email,address,tel,mtel)"
					+ "values(?,?,?,now(),?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,memberBean.getId());
			pstmt.setString(2,memberBean.getPasswd());
			pstmt.setString(3,memberBean.getName());
			pstmt.setString(4,memberBean.getEmail());
			pstmt.setString(5,memberBean.getAddress());
			pstmt.setString(6,memberBean.getTel());
			pstmt.setString(7,memberBean.getMtel());


			pstmt.executeUpdate(); //INSERT 실행 


		
		} catch (Exception e) {
			System.out.println("insertMember메소드 내부에서 예외발생 : " + e.toString());
		}finally {
			try {
				if(pstmt != null) { pstmt.close(); }
				if(con != null) { con.close(); }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}//finally
		
	}//insertMember메서드 
	
	
	//회원가입을 위해 사용자가 입력한 id값을 매개변수로 전달받아..
	//DB에 사용자가 입력한 id값이 존재하는지 select하여...
	//만약 사용자가 입력한 id에 해당하는 회원레코드가 select되면?
	//check변수값을 1로 저장하여 <---- 아이디 중복을 나타내게 하고,
	//만약 사용자가 입력한 id에 해당하는 회원레코드가 없으면?
	//check변수값을 0으로 저장하여 <---- 아이디 중복 아님을 나타내게 함.
	
	//결과적으로.. 아이디중복이냐 중복이 아니냐는 check변수에 저장되어 있으므로
	//check변수값을 리턴함.
	public int idCheck(String id) {
		
		//Connection을 담을 변수 선언
		Connection con = null;

		//PreparedStatement를 담을 변수 선언
		PreparedStatement pstmt = null;

		//SQL문을 생성해서 저장할 변수 선언
		String sql="";

		//검색한 결과 데이터를 저장할 임시공간인? ResultSet을 담을 변수 선언 
		ResultSet rs = null; 
		
		int check = 0; //아이디 중복이냐 아니냐 판단하는 값 
		
		try {
			//커넥션풀로부터 커넥션 얻기
			con = getConnection();
			//매개변수로 전달받은 id에 해당하는 레코드 검색 Sql문 만들기 
			sql = "select * from member where id = ?";
			//SELECT 구문을 실행할 PreparedStatement객체 얻기
			pstmt = con.prepareStatement(sql);
			//?값 설정
			pstmt.setString(1, id);
			//SELECT문 실행 후 검색한 결과를 ResultSet에 저장후 얻기 
			rs = pstmt.executeQuery();
			
			//검색한 데이터가 존재하면 
				//check 변수값을 1로 저장 
			//검색한 데이터가 존재하지 않으면 
				//check 변수값을 0으로 저장 
			if(rs.next()) {
				check = 1;
			}else {
				check = 0;
			}
			
		} catch (Exception e) {
			System.out.println("idCheck메소드 내부에서 예외발생 : " + e.toString());

		}finally {
			try {				
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(con != null) {con.close(); }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return check; //아이디 중복이면 1 중복이 아니면 0을 반환 --> join_IDCheck.jsp로 반환
		
	}
	
	public int userCheck(String id,String passwd) {
		
		//Connection을 담을 변수 선언
		Connection con = null;

		//PreparedStatement를 담을 변수 선언
		PreparedStatement pstmt = null;

		//SQL문을 생성해서 저장할 변수 선언
		String sql1="";

		//검색한 결과 데이터를 저장할 임시공간인? ResultSet을 담을 변수 선언 
		ResultSet rs1 = null; 

		int check = 0;
		
		try {
			con = getConnection();
			sql1= "select * from member where id = ?";
			pstmt = con.prepareStatement(sql1);
			//?값 설정
			pstmt.setString(1, id);
			//SELECT문 실행 후 검색한 결과를 ResultSet에 저장후 얻기 
			rs1 = pstmt.executeQuery();
			
			
			if(rs1.next()) {//id가 존재함
				if(rs1.getString("passwd").equals(passwd)) {
					check = 1; //아이디 맞음, 비밀번호 맞음
				}else {//아이디 맞음,비밀번호 틀림
					check = 0;
				}
			}else {//id가 존재하지 않음
				check = -1;
			}
			
		} catch (Exception e) {
			System.out.println("idCheck메소드 내부에서 예외발생 : " + e.toString());
		}finally {
			try {				
				if(rs1 != null) {rs1.close();}
				if(pstmt != null) {pstmt.close();}
				if(con != null) {con.close(); }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return check; //loginPro.jsp로 반환
	}//userCheck메소드
	
}//MemberDAO클래스 
