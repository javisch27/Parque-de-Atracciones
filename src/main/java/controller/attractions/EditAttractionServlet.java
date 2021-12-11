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

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/attractions/edit.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer costo = Integer.parseInt(req.getParameter("costo"));
		// Integer cost = req.getParameter("cost").trim() == "" ? null : Integer.parseInt(req.getParameter("cost"));
		Double duracion = Double.parseDouble(req.getParameter("duracion"));
		TipoAtraccion tipoAtraccion = TipoAtraccion.valueOf(Integer.parseInt(req.getParameter("Tipo_Atraccion")));
		Integer cupoMaximo = Integer.parseInt(req.getParameter("cupoMaximo"));
		String nombre = req.getParameter("nombre");
		String descripcion = req.getParameter("descripcion");
		Integer id_atraccion = Integer.parseInt(req.getParameter("id_atraccion"));

		Atraccion atraccion = attractionService.update(costo, duracion, tipoAtraccion, cupoMaximo, nombre, descripcion,
				id_atraccion);

		if (atraccion.isValid()) {
			resp.sendRedirect("/LaFuerza-Turismo/attractions/index.do");
		} else {
			req.setAttribute("atraccion", atraccion);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/attractions/edit.jsp");
			dispatcher.forward(req, resp);
		}
	}
}
