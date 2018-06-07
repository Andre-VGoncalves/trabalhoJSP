

<%@page import="java.util.List"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page import="Model.Usuario"%>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Cadastro de Usuarios</h3>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Clientes cadastrados</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Settings 1</a>
                                </li>
                                <li><a href="#">Settings 2</a>
                                </li>
                            </ul>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <%
                        UsuarioDAO usu = new UsuarioDAO();
                        List<Usuario> usuario = usu.selecionar();
                    %>

                    <table id="datatable-responsive" class="table table-striped dt-responsive nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>Nome</th>
                                <th>Usuario</th>
                                <th>Disponível</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < usuario.size(); i++) {
                            %>
                            <tr>
                                <td><%  out.print(usuario.get(i).getNome());%></td>
                                <td><%  out.print(usuario.get(i).getLogin());%></td>
                                <td><%  if (usuario.get(i).getAtivo()){
                                    out.print("SIm");
                                }else{
                                    out.print("Não");
                                }%></td>
                                <td><a href="usuarioCadastrar.jsp?action=update&id=<%= usuario.get(i).getId()%>">
                                        <i class="fa fa-edit"></i> atualizar
                                    </a></td>
                            </tr>
                            <%                                }
                            %>
                        </tbody>
                    </table>
                        <a href="usuarioCadastrar.jsp?action=insert">  <button type="submit" class="btn btn-success">Cadastrar Usuário</button> </a>
                </div>
            </div>
        </div>
    </div>
</div>