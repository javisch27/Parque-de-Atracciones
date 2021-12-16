package controller.promociones;

import java.io.IOException;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;
import persistence.commons.DAOFactory;
import services.BuyPromocionService;

@WebServlet("/promociones/buy.do")
public class BuyPromocionServlet extends HttpServlet {

	private static final long serialVersionUID = 3455721046062278592L;
	private BuyPromocionService buyPromocionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.buyPromocionService = new BuyPromocionService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Integer promocionId = Integer.parseInt(req.getParameter("id"));
		Usuario usuario = (Usuario) req.getSession().getAttribute("usuario");
		Map<String, String> errors = buyPromocionService.buy(usuario.getUsuario_id(), promocionId);
		
		Usuario usuario2 = DAOFactory.getUserDAO().find(usuario.getUsuario_id());
		req.getSession().setAttribute("usuario", usuario2);
		
		if (errors.isEmpty()) {
			req.setAttribute("flash", "¡Gracias por comprar!");
		} else {
			req.setAttribute("errors", errors);
			req.setAttribute("flash", "No ha podido realizarse la compra");
		}
		
		String lado = usuario.getTipoAtraccionPreferida().getNombre();
		req.setAttribute("lado", lado);
		
		System.out.println(lado+" en buy");

		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher("/promociones?lado="+lado);
		
		dispatcher.forward(req, resp);
	}
}
