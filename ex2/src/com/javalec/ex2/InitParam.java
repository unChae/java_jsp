package com.javalec.ex2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebInitParam;

/**
 * Servlet implementation class InitParam
 */
@WebServlet(urlPatterns={"/InitP"}, initParams={ @WebInitParam(name="id", value="abcde"), @WebInitParam(name="pw", value="12345")})

public class InitParam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InitParam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		String id = getInitParameter("id");
//		String pw = getInitParameter("pw");

//		String id = getServletContext().getInitParameter("id");
//		String pw = getServletContext().getInitParameter("pw");
//		
//		System.out.println("id =" + id);
//		System.out.println("pw =" + pw);
		
		System.out.println("listener");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
