package com.momo.lib.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.lib.dto.BookDto;

public class BookDao extends DBConnPool{
	
	/**
	 * 도서목록을 조회 후 리스트를 반환한다.
	 * @return
	 */
	public List<BookDto> getList () {
		String sql = "select * from book";
		List<BookDto> list = new ArrayList<>();
		try {
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				String no = rs.getString("no");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String rentYn = rs.getString("rentYn");

				BookDto dto = new BookDto(no, title, author, rentYn);
				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("BookDao - getList() - SQLException 오류 발생");
			e.printStackTrace();
		}
		
		return list;
		
	}
}
