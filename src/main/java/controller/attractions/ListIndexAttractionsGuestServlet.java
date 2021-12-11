package controller.attractions;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Atraccion;
import services.AtraccionService;


@WebServlet("/guest/index.guest")
public class ListIndexAttractionsGuestServlet extends HttpServlet implements Servlet {
	

	private static final long serialVersionUID = 2552664789545594075L;
	private AtraccionService attractionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.attractionService = new AtraccionService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	 	String lado = req.getParameter("lado");
		
		List<Atraccion> attractions = attractionService.list();
		List<Atraccion> attractionsFiltred = new ArrayList<Atraccion>();
		
		for (Atraccion atracction : attractions) {
			if (atracction.getTipoAtraccion().toString().equals(lado)) {
				attractionsFiltred.add(atracction);
			} 
		}
	
		
		req.setAttribute("atracciones", attractionsFiltred);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/guest/index.jsp");
		dispatcher.forward(req, resp);

	}

}


