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

@WebServlet("/promociones/create.do")
public class CreatePromocionServlet extends HttpServlet {

	private static final long serialVersionUID = 3455721046062278592L;
	private PromocionService promocionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.promocionService = new PromocionService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/promociones/create2.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		TipoPromocion tipoPromocion = TipoPromocion.valueOf(req.getParameter("Tipo_Promocion"));
		TipoAtraccion tipoAtracciones = TipoAtraccion.valueOf(req.getParameter("Tipo_Atracciones"));
		String nombre = req.getParameter("nombre");
		String descripcion = req.getParameter("descripcion");
		String [] atraccionesIncluidasString = (req.getParameter("atraccionesIncluidas")).split(",");
		String [] atraccionesGratisPromoAXBString = (req.getParameter("atraccionesGratisPromoAXB")).split(",");
		Double variable = Double.parseDouble(req.getParameter("variable"));
		
		LinkedList<Atraccion> atraccionesIncluidas = new LinkedList<Atraccion>();
		LinkedList<Atraccion> atraccionesGratisPromoAXB = new LinkedList<Atraccion>();
		
		AtraccionService atraccionService = new AtraccionService();
		
		for (int i = 0; i < atraccionesIncluidasString.length; i++) {
			atraccionesIncluidas.add(atraccionService.find(Integer.valueOf(atraccionesIncluidasString[i])));
		}
		
		for (int i = 0; i < atraccionesGratisPromoAXBString.length; i++) {
			atraccionesGratisPromoAXB.add(atraccionService.find(Integer.valueOf(atraccionesGratisPromoAXBString[i])));
		}

		Promocion promocion = promocionService.create(tipoPromocion, tipoAtracciones, nombre, descripcion, atraccionesIncluidas, atraccionesGratisPromoAXB, variable);
		if (promocion.isValid()) {
			//resp.sendRedirect("/LaFuerza-Turismo/promociones/index.do");
			resp.sendRedirect("/views/admin/index.jsp&partial=promociones");
		} else {
			req.setAttribute("promocion", promocion);

			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/views/promociones/create2.jsp");
			dispatcher.forward(req, resp);
		}

	}

}