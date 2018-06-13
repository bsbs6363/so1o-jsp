package Bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class LoginDBBean {
	private static LoginDBBean instance = new LoginDBBean();
	
	public static LoginDBBean getinstance()
	{
		return instance;
	}
	private LoginDBBean(){}
	
	private Connection getConnection() throws Exception
	{
		Connection conn =null;
		
		String url ="jdbc:oracle:thin:@168.126.146.45:1521:orcl";
		String id ="20132399";
		String pass="941209";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,id,pass);
		return conn;
	}
	
	public int confirmID(String mem_id) throws Exception{
		Connection con = null;
		PreparedStatement pstmt;
		ResultSet rs = null;
		
		String sql = "select mem_id from membert where mem_id=?";
		int re = -1;
		try{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				re = 1;
			}
			rs.close();
			pstmt.close();
			con.close();
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return re;
	}
	public int insert(LoginDataBean article)throws Exception
	{
		Connection con = null;
		PreparedStatement pstmt;
		ResultSet rs = null;
		
		String sql = "insert into membert values(?,?,?,?,?,?)";
		int re = -1;
		try
		{
			con = getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getMem_id());
			pstmt.setString(2, article.getMem_passwd());
			pstmt.setString(3, article.getMem_name());
			pstmt.setString(4, article.getMem_addr());
			pstmt.setString(5, article.getMem_phone());
			pstmt.setString(6, article.getMem_email());
			
		

			re = pstmt.executeUpdate();
			
			rs.close();
			pstmt.close();
			con.close();
						
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return re;
	}
	public int cheeck(String mem_id, String mem_passwd) throws Exception
	{
		Connection con = null;
		PreparedStatement pstmt;
		ResultSet rs = null;
		String sql = "select * from membert where mem_id= ? and mem_passwd = ?";
		int re = -1;
		try{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.setString(2, mem_passwd);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString("mem_passwd").equals(mem_passwd)){
					re = 1;
					
				}else{
					re = 0;
				}
				
			}
			
			rs.close();
			pstmt.close();
			con.close();
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}		
		return re;
	}
	
	public LoginDataBean getMember(String mem_id) throws Exception{
		Connection con = null;
		PreparedStatement pstmt;
		ResultSet rs = null;
		String sql = "select * from member where mem_id = ?";
		 LoginDataBean member = null;
		try{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				member = new LoginDataBean();
				member.setMem_id(rs.getString("mem_id"));
				member.setMem_passwd(rs.getString("mem_passwd"));
				member.setMem_email(rs.getString("mem_email"));
			
				
				
			}
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return member;
	}
	public LoginDataBean updatecheck(String mem_id) throws Exception
	{
		Connection conn =null;
		Statement stmt=null;
		ResultSet rs=null;
		LoginDataBean member =null;
		try
		{
			conn=getConnection();
			String sql = "select * from member where mem_id=mem_id";
			stmt =conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next())
			{
				member= new LoginDataBean();
				member.setMem_id(rs.getString("mem_id"));
				member.setMem_passwd(rs.getString("passwd"));
				member.setMem_email(rs.getString("email"));
			}
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(rs!=null)try{rs.close();}catch(SQLException ex){};
			if(stmt!=null)try{stmt.close();}catch(SQLException ex){};
			if(rs!=null)try{rs.close();}catch(SQLException ex){};
		}
		return member;
	}
	public void updatepro(LoginDataBean article) throws Exception
	{
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try
		{
			conn = getConnection();
			String sql = "update member set passwd=?, email=? where mem_id=mem_id";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getMem_passwd());
			
			pstmt.setString(3, article.getMem_email());
			rs = pstmt.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(rs!=null)try{rs.close();}catch(SQLException ex){};
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){};
		}
	}
	public void delete(String id1) throws Exception
	{
		Connection conn=null;
		PreparedStatement pstmt =null;
		try
		{
			conn=getConnection();
			String sql ="delete from member where mem_id=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, id1);
			pstmt.executeUpdate();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){};
			if(conn!=null)try{conn.close();}catch(SQLException ex){};
		}
	}	
	
	

}