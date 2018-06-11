<%-- 
    Document   : v_relatorio
    Created on : 10/06/2018, 19:07:10
    Author     : andre
--%>

<%@page import="Model.Relatorio"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Produto"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ProdutoDAO"%>
<%@page import="java.util.List"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ClienteDAO"%>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Relatório</h3>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
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
                        ProdutoDAO pro = new ProdutoDAO();
                        List<Produto> produto = pro.selecionar();
                        UsuarioDAO usu = new UsuarioDAO();
                        List<Usuario> usuario = usu.selecionar();
                        ClienteDAO cli = new ClienteDAO();
                        List<Cliente> cliente = cli.selecionar();
                        
                        ArrayList<Relatorio> relatorio = new ArrayList<Relatorio>();
                        int qtdProdInds = 0;
                        int qtdProdDisp = 0;
                        for (int i = 0; i < produto.size(); i++){
                           if(produto.get(i).getAtivo()){
                                    qtdProdDisp++;
                                }else{
                                    qtdProdInds++;
                                }
                        }
                        
                        int clientInds = 0;
                        int clientDisp = 0;
                        for (int i = 0; i < cliente.size(); i++){
                           if(cliente.get(i).getAtivo()){
                                    clientDisp++;
                                }else{
                                    clientInds++;
                                }
                        }
                        
                        
                        int userInds = 0;
                        int userDisp = 0;
                        for (int i = 0; i < usuario.size(); i++){
                           if(usuario.get(i).getAtivo()){
                                    userDisp++;
                                }else{
                                    userInds++;
                                }
                        }
                        
                    %>

                    <table id="datatable-responsive" class="table table-striped dt-responsive nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>Qtd Livros/Usuarios/Clientes</th>
                                <th>Qtd Disponivel</th>
                                <th>Qtd Indiponísveis</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < 3; i++) {
                            %>
                            <tr>
                                
                                <td><%  if (i == 0){out.print(produto.size());}else if(i==1){out.print(usuario.size());}else{out.print(cliente.size());}%></td>
                                <td><%  if (i == 0){out.print(qtdProdDisp);}else if(i==1){out.print(userDisp);}else{out.print(clientDisp);}%></td>
                                <td><% if (i == 0){out.print(qtdProdInds);}else if(i==1){out.print(userInds);}else{out.print(clientInds);}%></td>
                               
                            </tr>
                            <%                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
