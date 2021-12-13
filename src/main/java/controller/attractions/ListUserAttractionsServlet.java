package controller.attractions;

import java.io.IOException;
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

@WebServlet("/attractions/compras") 
public class ListUserAttractionsServlet extends HttpServlet implements Servlet {

	private static final long serialVersionUID = -8346640902238722429L;
	private AtraccionService atraccionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.atraccionService = new AtraccionService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer attractionId = Integer.parseInt(req.getParameter("id"));
        List<Atraccion> atracciones = atraccionService.CompradasPorUsuario(attractionId);
		req.setAttribute("atracciones", atracciones);
		String lado = req.getParameter("lado");
		req.setAttribute("lado", lado.toUpperCase() );
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/attractions/compras.jsp");
		dispatcher.forward(req, resp);
	}

}
