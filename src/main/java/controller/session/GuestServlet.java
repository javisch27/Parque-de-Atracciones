package controller.session;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
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

@WebServlet("/guest")
public class GuestServlet extends HttpServlet implements Servlet {

	private static final long serialVersionUID = -6744456932336971308L;
	private AtraccionService attractionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.attractionService = new AtraccionService(); //TODO esto esta bien aca??? mmmmm...
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	 	String lado = req.getParameter("lado");
		
		List<Atraccion> attractions = attractionService.list();
		
		System.out.println(lado);
		System.out.println(attractions);
		
		List<Atraccion> attractionsFiltred = new ArrayList<Atraccion>();
		
		for (Atraccion atracction : attractions) {
			if (atracction.getTipoAtraccion().getNombre().toUpperCase().equals(lado.toUpperCase())) {
				attractionsFiltred.add(atracction);
			} 
		}
	
		Collections.shuffle(attractionsFiltred);
		
		req.setAttribute("atracciones", attractionsFiltred);
		req.setAttribute("lado", lado.toUpperCase() );
		
	
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/guest/index.jsp");
		dispatcher.forward(req, resp);
		

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	 	String lado = req.getParameter("lado");
		
		List<Atraccion> attractions = attractionService.list();	
		List<Atraccion> attractionsFiltred = new ArrayList<Atraccion>();
		
		for (Atraccion atracction : attractions) {
			if (atracction.getTipoAtraccion().getNombre().toUpperCase().equals(lado.toUpperCase())) {
				attractionsFiltred.add(atracction);
			} 
		}

		Collections.shuffle(attractionsFiltred);
		
//		System.out.println(attractionsFiltred);
		
		req.setAttribute("atracciones", attractionsFiltred);
		req.setAttribute("lado", lado.toUpperCase() );
		
	
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/guest/index.jsp");
		dispatcher.forward(req, resp);
		

	}

}


