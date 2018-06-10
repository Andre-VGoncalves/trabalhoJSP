<%@page import="Model.Cliente"%>
<%@page import="DAO.ClienteDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
    String user = (String) session.getAttribute("usuario");
    ArrayList lista = null;
    String lstItem;
    String Item[];
    try {
        if (user.equals("")) {
            response.sendRedirect("login.jsp");
        }
    } catch (NullPointerException e) {
        response.sendRedirect("login.jsp");
    }
    if (session.getAttribute("itens") != null){
        lista = new ArrayList();
        lista =(ArrayList) session.getAttribute("itens");

       
    }
%>


<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="index.html" class="site_title"><i class="fa fa-paw"></i>
                <span>Biblioteca</span></a>
        </div>

        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        
        <div class="profile clearfix">
            <div class="profile_pic">
            </div>
            <div class="profile_info">
                <span>Bem Vindo,</span>
                <h2><% out.print(session.getAttribute("usuario"));%></h2>
            </div>
            <div class="clearfix"></div>
        </div>
        <!-- /menu profile quick info -->

        <br />

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <h3>Geral</h3>
                <ul class="nav side-menu">
                    
                    <li><a><i class="fa fa-edit"></i> Menu <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="cliente.jsp">Cliente</a></li>
                            <li><a href="livro.jsp">Livros</a></li>
                         
                            <li><a href="usuario.jsp">Usuário</a></li>
                            
                            <li><a href="relatorio.jsp">Relatório</a></li>
                        </ul>
                    </li>

                    <li><a href="login.jsp"><i class="fa fa-edit"></i> SAIR </a>
                    </li>
                </ul>
            </div>
        </div>   
    </div>
</div>

<div class="modal fade" id="modal-mensagem">
    <div class="modal-dialog">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal"><span>x</span></button>
                 <h4 class="modal-title">Selecione o cliente</h4>                 
             </div>
             <div class="modal-body">
                  <%
                        ClienteDAO cl = new ClienteDAO();
                        List<Cliente> client = cl.selecionar();
                    %>

                    <table id="datatable-responsive" class="table table-striped dt-responsive nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr>                           
                                <th></th>                              
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < client.size(); i++) {
                            %>                           
                              
                            </td>

                                <td>
                                    <a href="finalizarPedido.jsp?id=<%= client.get(i).getId()%>&nome= <%  out.print(client.get(i).getNome());%>">
                                        
                                     <%  out.print(client.get(i).getNome());%>
                                    </a>
                                </td>
                            </tr>
                            <% }
                            %>
                        </tbody>
                    </table>             
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
             </div>
         </div>
     </div>
 </div>
<!-- /top navigation -->