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
import model.Promocion;
import model.Usuario;
import services.PromocionService;

@WebServlet("/promociones") /// promociones/index.do
public class ListPromocionesServlet extends HttpServlet implements Servlet {

	private static final long serialVersionUID = -8346640902238722429L;
	private PromocionService promocionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.promocionService = new PromocionService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Promocion> promociones = promocionService.list();
		req.setAttribute("promociones", promociones);
		
		Usuario usuario = (Usuario) ((HttpServletRequest) req).getSession().getAttribute("usuario"); //TODO es valido aca? sino filtro  ??

		if (usuario != null && usuario.isAdmin()) {

			req.setAttribute("partial", "promociones");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/admin/index.jsp");
			dispatcher.forward(req, resp);

		} else {

			String lado = req.getParameter("lado");
			req.setAttribute("lado", lado.toUpperCase());

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/promociones/index2.jsp");
			dispatcher.forward(req, resp);
		}

	}

}
