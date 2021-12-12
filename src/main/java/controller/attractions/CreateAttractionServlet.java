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

@WebServlet("/attractions/create.do")
public class CreateAttractionServlet extends HttpServlet {

	private static final long serialVersionUID = 3455721046062278592L;
	private AtraccionService atraccionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.atraccionService = new AtraccionService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/attractions/create.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nombre = req.getParameter("nombre");
		Integer costo = Integer.parseInt(req.getParameter("costo"));
		Double tiempoTotal = Double.parseDouble(req.getParameter("tiempoTotal"));
		Integer cupoMaximo = Integer.parseInt(req.getParameter("cupoMaximo"));
		TipoAtraccion tipoAtraccion = TipoAtraccion.valueOf(Integer.parseInt(req.getParameter("Tipo_Atraccion")));
		String descripcion = req.getParameter("descripcion");

		Atraccion atraccion = atraccionService.create(costo, tiempoTotal, tipoAtraccion, cupoMaximo, nombre, descripcion);
		if (atraccion.isValid()) {
			resp.sendRedirect("/attractions/index.do");  //TODO  antes /LaFuerza-Turismo/attractions/index.do
		} else {
			req.setAttribute("atraccion", atraccion);

			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/views/attractions/create.jsp");
			dispatcher.forward(req, resp);
		}

	}

}
