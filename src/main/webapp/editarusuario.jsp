<%@ page import = "br.com.crudjspjava.dao.UsuarioDao"%>
<%@ page import = "java.util.Date" %>
<jsp:useBean id = "u" class = "br.com.crudjspjava.bean.Usuario" />
<jsp:setProperty property="id" name="u" />
<jsp:setProperty property="nome" name="u" />
<jsp:setProperty property="sexo" name="u" />
<jsp:setProperty property="data_nascimento" name="u" value="<%=new Date() %>" />
<jsp:setProperty property="email" name="u" />
<jsp:setProperty property="senha" name="u" />
<% 

int i = UsuarioDao.updateUsuario(u);
response.sendRedirect("assinatura.jsp");

%>