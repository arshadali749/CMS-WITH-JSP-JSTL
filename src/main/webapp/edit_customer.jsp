<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="card" style="width: 18rem;">
		<div class="card-body">
			<form action="#">
				<div class="form-group">

					<input class="form-control" type="number" name="cid"
						value="${customer.id}" placeholder="enter first name here">
				</div>

				<div class="form-group">
					<label for="fname">FIRST NAME</label> <input class="form-control"
						value="${customer.cfname}" type="text" name="cfname"
						placeholder="enter first name here">
				</div>
				<div class="form-group">
					<label for="fname">LAST NAME</label> <input class="form-control"
						value="${customer.clname}" type="text" name="clname"
						placeholder="enter first name here">
				</div>
				<div class="form-group">
					<label for="fname">EMAIL</label> <input class="form-control"
						value="${customer.cemail}" type="text" name="cemail"
						placeholder="enter first name here">
				</div>
				<div class="form-group">
					<input class="btn btn-success" type="submit">
				</div>


			</form>



		</div>
	</div>
</body>
</html>