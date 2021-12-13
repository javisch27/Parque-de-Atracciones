package controller.attractions;

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
import services.BuyAttractionService;

@WebServlet("/attractions/buy.do")
public class BuyAttractionServlet extends HttpServlet {

	private static final long serialVersionUID = 3455721046062278592L;
	private BuyAttractionService buyAttractionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.buyAttractionService = new BuyAttractionService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Integer attractionId = Integer.parseInt(req.getParameter("id"));
		Usuario usuario = (Usuario) req.getSession().getAttribute("usuario");
		Map<String, String> errors = buyAttractionService.buy(usuario.getUsuario_id(), attractionId);
		
		Usuario usuario2 = DAOFactory.getUserDAO().find(usuario.getUsuario_id());
		req.getSession().setAttribute("usuario", usuario2);
		
		if (errors.isEmpty()) {
			req.setAttribute("flash", "¡Gracias por comprar!");
		} else {
			req.setAttribute("errors", errors);
			req.setAttribute("flash", "No ha podido realizarse la compra");
		}
		
		String promocionID = req.getParameter("promocionID");
		String attractionID = req.getParameter("id");
		String lado = req.getParameter("lado");
		String ruta = req.getParameter("ruta");
		

// 		RequestDispatcher dispatcher = getServletContext()
//				.getRequestDispatcher("/attractions/index.do");
 		
 		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher("/"+ruta+"?promocionID="+promocionID+"&attractionID="+attractionID );

 		
 		
 	
		dispatcher.forward(req, resp);
	}
}
