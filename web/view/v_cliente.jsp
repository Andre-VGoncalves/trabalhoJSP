<%@page import="Model.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ClienteDAO"%>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Cadastro de cliente</h3>
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
                        ClienteDAO cli = new ClienteDAO();
                        List<Cliente> cliente = cli.selecionar();
                    %>

                    <table id="datatable-responsive" class="table table-striped dt-responsive nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>Nome</th>
                                <th>Sobrenome</th>
                                <th>Aniversario</th>
                                <th>Cep</th>
                                <th>Bairro</th>
                                <th>Disponivel</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < cliente.size(); i++) {
                            %>
                            <tr>
                                <td><%  out.print(cliente.get(i).getNome());%></td>
                                <td><%  out.print(cliente.get(i).getSobreNome());%></td>
                                <td><%  out.print(cliente.get(i).getAniversario());%></td>
                                <td><%  out.print(cliente.get(i).getCep());%></td>
                                <td><%  out.print(cliente.get(i).getLogradouro());%></td>
                                <td><% if (cliente.get(i).getAtivo()){
                                    out.print("Sim");
                                }else{
                                    out.print("Não");
                                }%></td>
                                <td><a href="clienteCadastrar.jsp?action=update&id=<%= cliente.get(i).getId()%>">
                                        <i class="fa fa-edit"></i> atualizar
                                    </a></td>
                            </tr>
                            <%                                }
                            %>
                        </tbody>
                    </table>
                        <a href="clienteCadastrar.jsp?action=insert">  <button type="submit" class="btn btn-success">Cadastrar cliente</button> </a>
                </div>
            </div>
        </div>
    </div>
    <!-- /page content -->