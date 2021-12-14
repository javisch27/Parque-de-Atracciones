package controller.promociones;

import java.io.IOException;
import java.util.LinkedList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Atraccion;
import model.Promocion;
import model.TipoAtraccion;
import model.TipoPromocion;
import services.AtraccionService;
import services.PromocionService;

@WebServlet("/promociones/edit.do")
public class EditPromocionServlet extends HttpServlet {

	private static final long serialVersionUID = 7598291131560345626L;
	private PromocionService promocionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.promocionService = new PromocionService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer id = Integer.parseInt(req.getParameter("id"));

		Promocion promocion = promocionService.find(id);
		req.setAttribute("promocion", promocion);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/promociones/edit2.jsp");
		dispatcher.forward(req, resp);
	}

	//metodo a modificar
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		TipoPromocion tipoPromocion = TipoPromocion.valueOf(req.getParameter("tipoPromocion"));
		TipoAtraccion tipoAtracciones = TipoAtraccion.valueOf(req.getParameter("tipoAtraccion"));
		String nombre = req.getParameter("nombre");
		String descripcion = req.getParameter("descripcion");
		String [] atraccionesIncluidasString = (req.getParameter("atraccionesIncluidas")).split(",");
		String [] atraccionesGratisPromoAXBString = (req.getParameter("atraccionesGratisPromoAXB")).split(",");
		Double variable = Double.parseDouble(req.getParameter("variable"));
		Integer id_promocion = Integer.parseInt(req.getParameter("id"));
		
		LinkedList<Atraccion> atraccionesIncluidas = new LinkedList<Atraccion>();
		LinkedList<Atraccion> atraccionesGratisPromoAXB = new LinkedList<Atraccion>();
		
		AtraccionService atraccionService = new AtraccionService();
		
		for (int i = 0; i < atraccionesIncluidasString.length; i++) {
			atraccionesIncluidas.add(atraccionService.find(Integer.valueOf(atraccionesIncluidasString[i])));
		}
		
		for (int i = 0; i < atraccionesGratisPromoAXBString.length; i++) {
			atraccionesGratisPromoAXB.add(atraccionService.find(Integer.valueOf(atraccionesGratisPromoAXBString[i])));
		}

		Promocion promocion = promocionService.update(tipoPromocion, tipoAtracciones, nombre, descripcion, atraccionesIncluidas, atraccionesGratisPromoAXB, variable, id_promocion);

		if (promocion.isValid()) {
//			resp.sendRedirect("/LaFuerza-Turismo/promociones/index.do");
			resp.sendRedirect("/views/admin/index.jsp&partial=promociones");
		} else {
			req.setAttribute("promocion", promocion);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/promociones/edit2.jsp");
			dispatcher.forward(req, resp);
		}
	}
}