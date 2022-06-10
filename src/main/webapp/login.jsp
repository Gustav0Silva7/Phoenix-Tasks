<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - Phoenix Tasks</title>
<link rel = "stylesheet" href = "login.css">
<link rel="icon" href="Imagens/logo.ico" type="image/x-icon">
</head>
<body>

<div class = "container_form">
<div class = "titulo"><h2>Faça aqui o Login</h2></div>
<form action = "<%=request.getContextPath()%>/login" method = "post">
<div class = "info">
<div class = "input">
<span class = "detalhes">Email</span>
<input type = "email" name = "email" required placeholder = "usuario@email.com">
</div>
<div class = "input">
<span class = "detalhes">Senha</span>
<input type = "password" name = "senha" required placeholder = "Password">
</div>
<div class = "input">
<div class = "input_button">
<input type = "submit" value = "Entrar">
</div>
</div>
<div class = "input">
<p>Não possui conta? Faça o <a href = "cadastro.html">Cadastro</a></p>
</div>
</div>
</form>
</div>
</body>
</html>