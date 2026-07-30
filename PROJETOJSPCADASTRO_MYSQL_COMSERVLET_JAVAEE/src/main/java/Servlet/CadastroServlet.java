package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DAO.ConnectionFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cadastrar")
public class CadastroServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String nome = request.getParameter("usuario");

        try (Connection conn = ConnectionFactory.getConnection()) {
            String sql = "INSERT INTO usuarios (nome) VALUES (?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nome);
            stmt.executeUpdate(); // Executa o INSERT
            
            request.setAttribute("mensagem", "Usuário " + nome + " salvo com sucesso!");
        } catch (SQLException e) {
            request.setAttribute("mensagem", "Erro ao salvar: " + e.getMessage());
        }

        response.sendRedirect("listar"); 
    }
}
