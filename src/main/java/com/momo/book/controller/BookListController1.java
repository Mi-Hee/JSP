package com.momo.book.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.book.dao.BookDao;
import com.momo.dto.Criteria;
import com.momo.dto.PageDto;
import com.momo.lib.dto.BookDto;

@WebServlet("/book/list")
public class BookListController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * 도서 목록을 조회
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 사용자의 요청 정보를 수집한다.
		// Criteria : 검색 조건을 수집
		Criteria cri = new Criteria(request.getParameter("pageNo"), // 요청 페이지 번호 (기본값 : 1)
									request.getParameter("amount"), // 페이지당 보여줄 게시물의 수 (기본값 : 10)
									request.getParameter("searchField"),
									request.getParameter("searchWord"));
		
		System.out.println(cri);
		
		// 도서목록 조회후 request 영역에 담는다. -> 화면에 출력하기 위해서
		BookDao dao = new BookDao();
		System.out.println("리스트 출력");
		
		List<BookDto> list = dao.getList(cri);
		
		// 페이지 블럭을 생성하기 위한 객체
		PageDto pageDto = new PageDto(dao.getTotalCnt(cri), cri);
		
		request.setAttribute("list", list);
		request.setAttribute("pageDto", pageDto);
		
		// 자원 반납
		dao.close();
		
		// JSP 화면으로 전환
		request.getRequestDispatcher("/book/list.jsp").forward(request, response);
	}

}
