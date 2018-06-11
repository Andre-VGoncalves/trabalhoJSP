<%@page import="DAO.ClienteDAO"%>
<%@page import="Model.Cliente"%>
<%@page import="java.util.Date;"%>
<script>
    function validar() {
   
            document.form.submit();
      
    }

<%
    String action = "";
    String idCli= "";     
    String nome = "";     
    String Sobrenome = "";     
    String cep = "";     
    String logradouro = "";    
    Date aniversario = new Date();
    Boolean ativo = true;
    Cliente cli = new Cliente();
    ClienteDAO cliDAO = new ClienteDAO();
 
    try {
        action = request.getParameter("action");
        idCli = request.getParameter("id");
        if (!idCli.equals("")) {
            cli.setId(Integer.parseInt(idCli));
            cli = cliDAO.selecionar(cli);
            idCli = cli.getId().toString();             
            nome = cli.getNome();             
            Sobrenome =  cli.getSobreNome();
            cep = cli.getCep();
            logradouro =cli.getLogradouro();
            aniversario = cli.getAniversario();
            ativo = cli.getAtivo();
        }

    } catch (Exception e) {
    }

%>
    </script>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Cadastrar novo cliente</h2>
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
                        <br>
                        <form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="" onsubmit="return validar()" method="POST" action="controller/clienteController.jsp">

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Nome <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="nome" required="required" class="form-control col-md-7 col-xs-12" name="nome"value="<%= nome%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sobrenome">Sobrenome <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="sobre_nome" name="sobrenome" required="required" class="form-control col-md-7 col-xs-12" value="<%= Sobrenome%>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Data de nascimento <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="aniversario" class="date-picker form-control col-md-7 col-xs-12" required="required" type="date" name="aniversario"value="<%= aniversario%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="CEP">CEP<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="number" id="CEP" name="cep" required="required" class="form-control col-md-7 col-xs-12" value="<%= cep%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="Logradouro">Bairro <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="Logradouro" name="logradouro" required="required" class="form-control col-md-7 col-xs-12" value="<%= logradouro%>">
                                </div>
                            </div>
                             <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="ativo">Disponivel <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <% if (ativo == true) {%>
                                    <input type="checkbox" id="ativo" name="ativo" value="true" checked required="required" class="checkbox col-md-7 col-xs-12" >
                                    <% } else {%>
                                    <input type="checkbox" id="ativo" name="ativo"  value="true" required="required" class="checkbox col-md-7 col-xs-12">
                                    <% }%>
                                </div>
                            </div>
                            <% if (action.equals("insert")) { %>
                            <input type="hidden" name="action" value="insert"/>
                            <%} else {%>
                            <input type="hidden" name="action" value="update"/>
                            <%}%>
                            <input type="hidden" name="id" value="<%= idCli%>"/>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                    <button type="submit" class="btn btn-success">Enviar</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>

            </div>
        </div>


    </div>
</div>
<!-- /page content -->