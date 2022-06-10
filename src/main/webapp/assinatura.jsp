<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.text.SimpleDateFormat"%>
    <%@ page import = "br.com.crudjspjava.bean.Usuario, br.com.crudjspjava.dao.UsuarioDao, java.util.*" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Assinatura - Phoenix Tasks</title>
<link rel = "stylesheet" href = "assinatura.css">
<link rel="icon" href="Imagens/logo.ico" type="image/x-icon">
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
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


<%List<Usuario> list = UsuarioDao.getAllUsuarios();
request.setAttribute("list", list);
%>


<div class = "container_tabela">
<div class = "sobre_titulo">
<h2>Sua Assinatura</h2>
</div>
<table class = "tabela">
<thead>
<tr>
<th>Número de Inscrição</th>
<th>Nome Completo</th>
<th>Data de Nascimento</th>
<th>Sexo</th>
<th>Email</th>
<th>Senha</th>
<th>Alterar Dados</th>
<th>Excluir Dados</th>
</tr>
</thead>
<c:forEach items = "${list}" var = "users">
<tbody>
<tr>
<td data-label="Número de Inscrição">${users.getId()}</td>
<td data-label="Nome">${users.getNome()}</td>
<td data-label="Data de Nascimento"><fmt:formatDate value = "${users.data_nascimento }" pattern = "dd/MM/yyyy"></fmt:formatDate></td>
<td data-label="Sexo">${users.getSexo()}</td>
<td data-label="Email">${users.getEmail()}</td>
<td data-label="Senha">${users.getSenha()}</td>
<td data-label = "Alterar Dados"><a href = "editardados.jsp?id=${users.getId() }">Alterar</a></td>
<td data-label = "Excluir Dados"><a href = "excluirdados.jsp?id=${users.getId() }">Excluir</a></td>
</tr>
</tbody>
</c:forEach>
</table>
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