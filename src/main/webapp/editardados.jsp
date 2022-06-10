<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "br.com.crudjspjava.bean.Usuario, br.com.crudjspjava.dao.UsuarioDao"%>
    <%@page import = "java.text.SimpleDateFormat"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Editar Dados - Phoenix Tasks</title>
<link rel = "stylesheet" href = "alterar.css">
<link rel="icon" href="Imagens/logo.ico" type="image/x-icon">
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
<%
String id = request.getParameter("id");
Usuario users = UsuarioDao.getRegistroById(Integer.parseInt(id));
%>


<nav class = "container_menu">

<img src = "Imagens/logo.svg">

<input type = "checkbox" id = "click">
<label for = "click" class = "mobile_menu"><i class = "fas fa-bars"></i></label>
<div class = "menu">
<ul>
<li><a href = "about.html">A Unidade</a></li>
<li><a href = "assinatura.jsp">Assinatura</a></li>
<li><a>Tarefas</a>
<ul>
<li><a href = "lazer.html">Lazer</a></li>
<li><a href = "comunicacao.html">Comunicação</a></li>
<li><a href = "dinamicas.html">Dinâmicas</a></li>
<li><a href = "criatividade.html">Criatividade</a></li>
</ul>
</li>
</ul>
</div>
</nav>

<main class = "conteudo">

<div class = "container_form">
<div class = "titulo">Faça aqui a Edição de seus Dados</div>
<form action = "editarusuario.jsp" method = "post">

<input type = "hidden" name = "id" value = "<%=users.getId()%>">

<div class = "info">
<div class = "input">
<span class = "detalhes">Nome</span>
<input type = "text" name = "nome" value = "<%=users.getNome() %>" required placeholder = "Nome Completo">
</div>
<div class = "input">
<span class = "detalhes">Data de Nascimento</span>
<input type = "date" name = "data_nascimento" value = "<%=new SimpleDateFormat("yyyy-MM-dd").format(users.getData_nascimento()) %>">
</div>
<div class = "input">
<span class = "detalhes">Genero</span>
<select name = "sexo">
<option value = "masculino">Masculino</option>
<option value = "feminino">Feminino</option>
<option value = "nao_binario">Não Binário</option>
</select>
</div>
<div class = "input">
<span class = "detalhes">Email</span>
<input type = "email" name = "email" value = "<%=users.getEmail() %>" required placeholder = "usuario@email.com">
</div>
<div class = "input">
<span class = "detalhes">Senha</span>
<input type = "password" name = "senha" value = "<%=users.getSenha() %>" required placeholder = "Máximo 10 caracteres">
</div>
<div class = "input_button">
<input type = "submit" value = "Alterar">
</div>
</div>
</form>
</div>


</main>

<footer class = "rodape">
<div class = "rodape_conteudo">
<img src = "Imagens/logo_2.svg">
<h3>Sobre Nós</h3>
<p>A World Inc. é uma empresa fundada em 04 de fevereiro de 2018 por Kento Abei, Avgust Merchz e Milton Santos, três ex-estudantes de ciências da computação na Universidade Nove de Julho. Um dos fatores que levou a empresa a ser criada foi o projeto final dos estudantes, quando ainda estavam na universidade. Nessa época, não imaginavam o sucesso da ideia que teriam para resolver um dos problemas que mais atormentam todo estudante: a falta de organização nos estudos.</p>

<ul class = "redes_sociais">
<li><a href = "" class = "fab fa-instagram"></a></li>
<li><a href = "" class = "fab fa-whatsapp"></a></li>
<li><a href = "" class = "fab fa-twitter"></a></li>
<li><a href = "" class = "fab fa-facebook-f"></a></li>
</ul>
</div>

<div class = "rodape_menu">
<ul class = "menu_rodape">
<li><a href = "index.html">Home</a><li>
<li><a href = "assinatura.jsp">Assinatura</a><li>
<li><a href = "termos.html">Termos de Uso</a><li>
<li><a href = "privacidade.html">Política de Privacidade</a><li>
</ul>
</div>
<div class = "rodape_baixo">
<p>Todos os Direitos Reservados &copy</p>
</div>
</footer>
</body>
</html>