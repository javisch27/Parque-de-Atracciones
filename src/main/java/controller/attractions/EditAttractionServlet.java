package controller.attractions;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Atraccion;
import model.TipoAtraccion;
import services.AtraccionService;

@WebServlet("/attractions/edit.do")
public class EditAttractionServlet extends HttpServlet {

	private static final long serialVersionUID = 7598291131560345626L;
	private AtraccionService attractionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.attractionService = new AtraccionService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer id = Integer.parseInt(req.getParameter("id"));

		Atraccion atraccion = attractionService.find(id);
		req.setAttribute("atraccion", atraccion);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/attractions/edit2.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Integer costo = Integer.parseInt(req.getParameter("costo"));
		Integer costo = req.getParameter("costo").trim() == "" ? null : Integer.parseInt(req.getParameter("costo"));
		//Double duracion = Double.parseDouble(req.getParameter("duracion"));
		Double duracion = req.getParameter("tiempoTotal").trim() == "" ? null : Double.parseDouble(req.getParameter("tiempoTotal"));
		//TipoAtraccion tipoAtraccion = TipoAtraccion.valueOf(Integer.parseInt(req.getParameter("Tipo_Atraccion")));
		TipoAtraccion tipoAtraccion = req.getParameter("tipoAtraccion").trim() == "" ? null : TipoAtraccion.valueOf(req.getParameter("tipoAtraccion"));
		//Integer cupoMaximo = Integer.parseInt(req.getParameter("cupoMaximo"));
		Integer cupoMaximo = req.getParameter("cupoInicial").trim() == "" ? null : Integer.parseInt(req.getParameter("cupoInicial"));
		//String nombre = req.getParameter("nombre");
		String nombre = req.getParameter("nombre").trim() == "" ? null : req.getParameter("nombre");
		//String descripcion = req.getParameter("descripcion");
		String descripcion = req.getParameter("descripcion").trim() == "" ? null : req.getParameter("descripcion");
		//Integer id_atraccion = Integer.parseInt(req.getParameter("id_atraccion"));
		Integer id_atraccion = req.getParameter("id_atraccion").trim() == "" ? null : Integer.parseInt(req.getParameter("id_atraccion"));

		Atraccion atraccion = attractionService.update(costo, duracion, tipoAtraccion, cupoMaximo, nombre, descripcion,
				id_atraccion);
		
		if (atraccion.isValid()) {
			resp.sendRedirect("/views/admin/index.jsp&partial=atracciones");
			
			//resp.sendRedirect("/attractions/index.do"); antes
		} else {
			req.setAttribute("atraccion", atraccion);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/attractions/edit2.jsp");
			dispatcher.forward(req, resp);
		}
	}
}
