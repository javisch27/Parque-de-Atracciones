package controller.promociones;

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
import model.Promocion;
import services.PromocionService;

@WebServlet("/promocion/detalle.do")
public class DetallePromocionServlet extends HttpServlet implements Servlet {

	private static final long serialVersionUID = 1965006988697544679L;
	private PromocionService promocionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.promocionService = new PromocionService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String promocionID = req.getParameter("promocionID");
		System.out.println(promocionID);
		
		Promocion promocion = promocionService.find(Integer.parseInt(promocionID));
		
		
		List<Atraccion> atracciones = promocion.getAtraccionesIncluidas();

		req.setAttribute("atracciones", atracciones);
		req.setAttribute("promocion", promocion);
		

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/promociones/detallePromocion.jsp");
		dispatcher.forward(req, resp);

	}

}