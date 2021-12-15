package controller.usuarios;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.UsuarioService;

@WebServlet("/usuarios/delete.do")
public class DeleteUsuarioServlet extends HttpServlet {

	private static final long serialVersionUID = 1537949074766873118L;
	private UsuarioService usuarioService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.usuarioService = new UsuarioService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer id = Integer.parseInt(req.getParameter("id"));

		usuarioService.delete(id);

		resp.sendRedirect("/usuarios/index.do");
		//resp.sendRedirect("/views/admin/index.jsp&partial=usuarios");
	}


}