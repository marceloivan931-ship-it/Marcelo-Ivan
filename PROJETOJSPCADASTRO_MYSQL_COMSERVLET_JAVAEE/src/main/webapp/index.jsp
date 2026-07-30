<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Gerenciamento de Usuários</title>
<style>
    body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f7f6; display: flex; flex-direction: column; align-items: center; padding: 40px; }
    .card { background: white; padding: 2rem; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); width: 100%; max-width: 600px; }
    h2 { color: #333; margin-bottom: 1.5rem; }
    
    /* Formulário */
    .form-group { display: flex; gap: 10px; margin-bottom: 2rem; }
    input[type="text"] { flex: 1; padding: 10px; border: 1px solid #ddd; border-radius: 4px; }
    input[type="submit"] { background-color: #28a745; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; transition: 0.3s; }
    input[type="submit"]:hover { background-color: #218838; }

    /* Tabela Flexbox */
    .table-container { display: flex; flex-direction: column; width: 100%; }
    .table-header { display: flex; background: #343a40; color: white; font-weight: bold; padding: 12px; border-radius: 4px 4px 0 0; }
    .table-row { display: flex; align-items: center; padding: 12px; border-bottom: 1px solid #eee; background: #fff; transition: 0.2s; }
    .table-row:hover { background: #f9f9f9; }
    .col-nome { flex: 2; }
    .col-acoes { flex: 1; display: flex; gap: 8px; justify-content: flex-end; }

    /* Botões */
    .btn { text-decoration: none; padding: 6px 12px; border-radius: 4px; font-size: 14px; color: white; transition: 0.3s; }
    .btn-edit { background-color: #007bff; }
    .btn-edit:hover { background-color: #0069d9; }
    .btn-delete { background-color: #dc3545; }
    .btn-delete:hover { background-color: #c82333; }
</style>
</head>
<body>

<div class="card">
    <h2>Novo Usuário</h2>
    <form action="cadastrar" method="POST" class="form-group">
        <input type="text" name="usuario" placeholder="Digite o nome..." required>
        <input type="submit" value="Salvar">
    </form>

    <h2>Usuários Cadastrados</h2>
    <div class="table-container">
        <div class="table-header">
            <div class="col-nome">Nome</div>
            <div class="col-acoes">Ações</div>
        </div>

        <% 
            List<String> lista = (List<String>) request.getAttribute("listaUsuarios");
            if (lista != null && !lista.isEmpty()) {
                for (String nome : lista) {
        %>
            <div class="table-row">
                <div class="col-nome"><%= nome %></div>
                <div class="col-acoes">
                    <!-- Links de exemplo - Você precisará criar os servlets de editar/excluir -->
                    <a href="editar?nome=<%= nome %>" class="btn btn-edit">Editar</a>
                    <a href="excluir?nome=<%= nome %>" class="btn btn-delete" onclick="return confirm('Excluir usuário?')">Excluir</a>
                </div>
            </div>
        <% 
                }
            } else {
        %>
            <div class="table-row" style="justify-content: center;">
                <p>Nenhum usuário encontrado. <a href="listar">Carregar Lista</a></p>
            </div>
        <% } %>
    </div>
</div>

</body>
</html>
