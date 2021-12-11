package controller.attractions;


import java.io.IOException;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Atraccion;
import services.AtraccionService;


@WebServlet("/attraction")
public class AttractionDetailsServlet extends HttpServlet implements Servlet {

	private static final long serialVersionUID = -6744456932336971308L;
	private AtraccionService attractionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.attractionService = new AtraccionService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	 	String attractionID = req.getParameter("attractionID");
		
	 	Atraccion attraction = attractionService.find(Integer.parseInt(attractionID));
		
			
		req.setAttribute("atraccion", attraction);
		req.setAttribute("lado", attraction.getTipoAtraccion().getNombre().toUpperCase() );
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/attractions/details.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	 	String attractionID = req.getParameter("attractionID");
		
	 	Atraccion attraction = attractionService.find(Integer.parseInt(attractionID));
		
			
		req.setAttribute("atraccion", attraction);
		req.setAttribute("lado", attraction.getTipoAtraccion().getNombre().toUpperCase() );
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/attractions/details.jsp");
		dispatcher.forward(req, resp);
		
	}
		

}