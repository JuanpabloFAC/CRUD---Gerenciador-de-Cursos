package Web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Course;

import java.io.IOException;
import java.sql.SQLException;

import Dao.CourseDao;

public class CourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	private CourseDao dao;
    public CourseServlet() throws ClassNotFoundException, SQLException {
        super(); //  Ela garante que qualquer inicialização necessária na classe pai seja feita antes da inicialização da classe filha
        
        dao = new CourseDao(); // Para cada objeto CourseServlet criado, é criado também um objeto CourseDao
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action = request.getParameter("action");
		String forward="";
		
		if(action==null) {
			action="default";
		}
		
		switch(action) {
			
			case "delete":
		
				//System.out.println(action);
				
				int courseid = Integer.parseInt(request.getParameter("courseid"));
				dao.deleteCourse(courseid);
				
				RequestDispatcher del = request.getRequestDispatcher("view.jsp");
				request.setAttribute("courses", dao.getAllCourses());
				del.forward(request, response);
				
				break;
				
			case "edit":
				
				//System.out.println(action);
				
				RequestDispatcher edit = request.getRequestDispatcher("add.jsp"); //chama add
				
				courseid = Integer.parseInt(request.getParameter("courseid"));
				Course course = dao.getCourseById(courseid);
				request.setAttribute("course", course);
				
				edit.forward(request, response);
				
				
				break;
				
			
			
			default:
				
				RequestDispatcher view = request.getRequestDispatcher("view.jsp");
				request.setAttribute("courses", dao.getAllCourses());
				view.forward(request, response);
				break;
		}
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String feesParameter = request.getParameter("fees");
		String durationParameter = request.getParameter("duration");
		
		Course course = new Course();
		
		course.setCoursename(request.getParameter("coursename"));
		
		//System.out.println(feesParameter);
		
		course.setCategory(request.getParameter("category"));
		
		course.setDuration(Integer.parseInt(durationParameter));
		
		course.setFees(Integer.parseInt(feesParameter));
		
		String courseid = request.getParameter("courseid");
		
		if(courseid == null || courseid.isEmpty()) {
			
			try {
				dao.addCourse(course);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
		} else {
			course.setCourseid(Integer.parseInt(courseid));
			dao.updateCourse(course);
			
			
			//
			
		}
		
		RequestDispatcher list = request.getRequestDispatcher("view.jsp");
		request.setAttribute("courses", dao.getAllCourses());
		list.forward(request, response);
		
	}

}
