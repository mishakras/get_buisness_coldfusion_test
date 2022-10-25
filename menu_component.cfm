<cfprocessingdirective pageEncoding="UTF-8">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="menu_border.css">
		<title></title>
	</head>
	<body>
	<div class=menu>
		<tr>
			<td>
				<a href='/errors/create_new_error.cfm'>Создать новую ошибку</a>
			</td>
			<td>
				<a href='/errors/errors.cfm'>Список ошибок</a>
			</td>
			<td> 
				<a href='/users/register.cfm'>Создать нового пользователя</a>
			</td>
			<td>
				<a href='/users/users.cfm'>Список пользователей</a>
			</td>
			<cfif IsDefined('session.stLoggedInUser')>
			<td>
				<a href='/users/logout.cfm'>Выйти из системы</a>
			</td>
			<cfelse>
			<td>
				<a href='/users/login.cfm'>Войти в систему</a>
			</td>
			</cfif>
		</tr>
	</div>
	</body>
</html>