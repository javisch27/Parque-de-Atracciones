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
import model.Usuario;
import services.AtraccionService;

@WebServlet("/attractions") //antes era /index.do para filtrar
public class ListAttractionsServlet extends HttpServlet implements Servlet {

	private static final long serialVersionUID = -8346640902238722429L;
	private AtraccionService atraccionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.atraccionService = new AtraccionService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Atraccion> atracciones = atraccionService.list();
		req.setAttribute("atracciones", atracciones);
		
		Usuario usuario = (Usuario) ((HttpServletRequest) req).getSession().getAttribute("usuario"); //TODO es valido aca? sino filtro  ??
		
		if (usuario!=null && usuario.isAdmin()) {
			
			req.setAttribute("partial", "atracciones");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/admin/index.jsp");
			dispatcher.forward(req, resp);
			
		} else {
			
			String lado = req.getParameter("lado");
			req.setAttribute("lado", lado.toUpperCase() );
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/attractions/index2.jsp");
			dispatcher.forward(req, resp);
		
			
		}
		

	}

}
