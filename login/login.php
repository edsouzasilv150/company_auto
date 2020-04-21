<!DOCTYPE html>
<html lang="pt">
<head>
	<meta charset="utf-8">
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
	 <?php
	//inicio de seção
	session_start();
	// verificando e-mail
	if(isset ($_POST['email']) && empty ($_POST['email']) == false) {
	    $email = addslashes($_POST['email']);
	    $senha = md5 (addslashes($_POST['senha'])); 
	    // criando a autenticação
	    $dsn = "mysql:dbname=dashboard;host=127.0.0.1";
	    $dbuser = "root";
	    $dbpass = "";
	    
	    try{
	        //conectando ao banco de dados
	        $db = new PDO($dsn, $dbuser, $dbpass);
	        //verificando dados digitados pelo usuário
	        $sql = $db->query("SELECT * FROM usuarios WHERE email = '$email' AND senha = '$senha'");
	        if($sql->rowCount() > 0){

	            $dado = $sql->fetch();

	            $_SESSION['id'] = $dado['id'];

	            header("Location: index.php");
	        }

	    } catch(PDOException $e){
	        echo "Falhou: " .$e->getMessage(); 
	    }
	}
	?>

	<!-- formulário -->
	<form method="POST" id="camp1">

	     <div class="form-group"> 
	        <strong>E-mail:</strong><br/>
	        <input type="email" name="email"class="form-control" placeholder="email"/><br/>

	        <strong>Senha:</strong><br/>
	        <input type="password" name="senha" class="form-control" placeholder="senha"/><br/>

	        <input type="submit" value="Entrar" class="btn btn-primary"/>
	    </div>
	</form>
</body>
</html>



