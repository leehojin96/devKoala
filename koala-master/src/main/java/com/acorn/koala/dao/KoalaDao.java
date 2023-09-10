package com.acorn.koala.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.concurrent.locks.Condition;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.koala.dto.BoarderDTO;
import com.acorn.koala.dto.CommentsDTO;

@Component
public class KoalaDao {
	
	@Autowired
	DataSource ds;
	
	
	public ArrayList<BoarderDTO> selectBoard(){
		
		ArrayList<BoarderDTO> list =new ArrayList<BoarderDTO>();
		
		Connection conn =null;
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = " select w_number, userID, title, passward, content, ";
        		sql+=" to_char(writeday,'yyyy-mm-dd') 날짜 ";
        		sql+=" from board order by w_number desc ";
        try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        
	        while(rs.next()) {
	        	BoarderDTO dto = new BoarderDTO();
	        	dto.setW_number(rs.getString(1));
	        	dto.setUserID(rs.getString(2));
	        	dto.setTitle(rs.getString(3));
	        	dto.setPassward(rs.getString(4));
	        	dto.setContent(rs.getString(5));
	        	dto.setWriteday(rs.getString(6));
	        	list.add(dto);
	        }
	        
	        //System.out.println(rs.getString(5));
	        
	        close(rs,pstmt,conn);
	        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs,pstmt,conn);		
		} 	
	
		return list;
		
	}
	
	
	
	public String[] showDetail(String w_number) {
		
		String[] list = new String[6];
		
		Connection conn =null;
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = " select w_number, userID, title, passward, content, ";
        		sql+=" to_char(writeday,'yyyy-mm-dd') 날짜 ";
        		sql+=" from board where w_number = ? ";
        		
        		
        		try {
					conn = ds.getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, w_number);
	    	        //pstmt.executeUpdate();
	    	        rs = pstmt.executeQuery();
	    	        
	    	        
	    	        while(rs.next()) {
	    	        
	    	        list[0] = rs.getString(1);
	    	        list[1] = rs.getString(2);
	    	        list[2] = rs.getString(3);
	    	        list[3] = rs.getString(4);
	    	        list[4] = rs.getString(5);
	    	        list[5] = rs.getString(6);
	    	        	
	    	        }
	    	        close(rs,pstmt,conn);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
    	       
        		
        		
        		
		
		return list;
		
		
	}
	
	
	
	
	
	
	public void insertContent(BoarderDTO dto) {
		System.out.println(" insert start");
		System.out.println(dto.getTitle());
		System.out.println(dto.getPassward());
		System.out.println(dto.getContent());
		Connection conn =null;
		PreparedStatement pstmt = null;

		String sql = " insert into board values(writenum_seq.nextval,?,?,?,?,sysdate)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
	        //rs = pstmt.executeQuery();
	        //System.out.println(dto.getTitle());
			pstmt.setString(1, dto.getUserID());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getPassward());
			pstmt.setString(4, dto.getContent());
			pstmt.executeUpdate();
			
			System.out.println("insert complete");
			//close(pstmt,conn);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close( pstmt, conn);			
		} 
		
		
	}
	
	public void add_comments(CommentsDTO dto) {
		
		Connection conn =null;
		PreparedStatement pstmt = null;
		
		String sql = " insert into comments_tbl values(?,?,?, comments_seq.nextval,sysdate) ";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUserID());
			pstmt.setString(2, dto.getW_number());
			pstmt.setString(3, dto.getComments());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close( pstmt, conn);			
		} 
		
		
	}
	
	public ArrayList<CommentsDTO> show_comments(String w_number) {
		ArrayList<CommentsDTO> list =new ArrayList<CommentsDTO>();
		
		Connection conn =null;
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        
        String sql = " select w_number, comments, comments_num, userID, ";
        		sql+=" to_char(comments_dy,'yyyy-mm-dd HH24:MI') 날짜 ";
        		sql+=" from comments_tbl where w_number=? ";
				sql+=" order by comments_num desc ";
        
				try {
					conn = ds.getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, w_number);
					rs = pstmt.executeQuery();
					
					
					 while(rs.next()) {
						 CommentsDTO dto = new CommentsDTO();
				        	
				        	dto.setUserID(rs.getString(4));
				        	dto.setW_number(rs.getString(1));
				        	dto.setComments(rs.getString(2));
				        	dto.setComments_num(rs.getString(3));
				        	dto.setComments_dy(rs.getString(5));
			        	
				        	list.add(dto);
				        }
					 close(rs,pstmt,conn);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				
				
		
		
		
		
		return list;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	private void close(AutoCloseable...aaaa) {
		  for(AutoCloseable a : aaaa) {
			  try {
				if(a!=null)a.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  }
	  }
	
	
	
	public static void main(String[] args) {
		KoalaDao dao = new KoalaDao();
		//dao.create_comments_tbl();
		
	}
	
	

}
