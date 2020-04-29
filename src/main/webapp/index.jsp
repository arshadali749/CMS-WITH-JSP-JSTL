<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>index.jsp</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<style>
.theme {
	background-color: maroon;
	color: white;
}
.title
{
background-color: green;
}
table
{
margin-top: 10px;
}
.close {
	width: 60px;
	height: 60px;
	background-color: white;
}

h5 {
	width: 80%;
	font-family: sans-serif;
	font-size: 25px;
	border: solid white 2px;
}


span : hov:hover {
	background-color: white;
}
</style>
<body>

	<div class="container">
		<div class="text-center title">
			<h1>LIST OF CUSTOMERS</h1>
		</div>
		<button type="button" class="btn btn-danger" data-toggle="modal"
			data-target="#addnewcustomer">ADD NEW CUSTOMER</button>
		<table class="table table-dark table-sm">

			<thead class="theme">
				<tr>
					<td>ID</td>
					<td>FIRST NAME</td>
					<td>LAST NAME</td>
					<td>EMAIL ADDRESS</td>
					<td>EDIT</td>
					<td>DELETE</td>
				</tr>
			</thead>
			<c:forEach items="${customers}" var="customer">
				<tr>
					<td>${customer.cid}</td>
					<td>${customer.cfname}</td>
					<td>${customer.clname}</td>
					<td>${customer.cemail}</td>
					<td><a href="edit/${customer.cid}"
						class="btn btn-success btn-sm editbtn">EDIT</a></td>
					<td><a href="delete/${customer.cid}"
						class="btn btn-danger btn-sm">DELETE</a></td>

				</tr>
			</c:forEach>
		</table>


	</div>

	<!-- add customer starts here -->

	<div class="modal fade" id="addnewcustomer" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header  theme text-center">
					<h5 class="modal-title ">ADD NEW CUSTOMER MODAL</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="/add">
						<div class="form-group">
							<label for="fname">FIRST NAME</label> <input class="form-control"
								type="text" name="cfname" placeholder="enter first name here">
						</div>
						<div class="form-group">
							<label for="fname">LAST NAME</label> <input class="form-control"
								type="text" name="clname" placeholder="enter first name here">
						</div>
						<div class="form-group">
							<label for="fname">EMAIL</label> <input class="form-control"
								type="text" name="cemail" placeholder="enter first name here">
						</div>
						<div class="form-group">
							<input class="btn btn-success" type="submit">
						</div>


					</form>

				</div>

			</div>
		</div>
	</div>
	<!-- add customer model ends here  -->


	<!-- edit customer starts here -->




	<!-- Modal -->
	<div class="modal fade" id="editcustomer" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header theme text-center">
					<h5 class="modal-title">EDIT CUSTOMER MODEL</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="/update">
						<div class="form-group">
							<label for="cid">ID</label> <input id="cid" class="form-control"
								type="number" name="cid" placeholder="enter first name here">
						</div>

						<div class="form-group">
							<label for="fname">FIRST NAME</label> <input id="cfname"
								class="form-control" type="text" name="cfname"
								placeholder="enter first name here">
						</div>
						<div class="form-group">
							<label for="fname">LAST NAME</label> <input id="clname"
								class="form-control" type="text" name="clname"
								placeholder="enter first name here">
						</div>
						<div class="form-group">
							<label for="fname">EMAIL</label> <input id="cemail"
								class="form-control" type="text" name="cemail"
								placeholder="enter first name here">
						</div>
						<div class="form-group">
							<input class="btn btn-success" type="submit">
						</div>


					</form>

				</div>

			</div>
		</div>
	</div>
	<!-- java scripts  -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<!-- edit customer model ends here  -->

	<script>
		$(document).ready(
				function() {
					$(".editbtn").click(
							function(event) {

								event.preventDefault();
								var url = $(this).attr("href");
								//alert(url);
								$.ajax({
									url : url,

									success : function(customer) {
										console.log("CID:" + customer.cid
												+ "CFNAME:" + customer.cfname
												+ "CLNAME:" + customer.clname);
										$('#cid').val(customer.cid);
										$('#cfname').val(customer.cfname);
										$('#clname').val(customer.clname);
										$('#cemail').val(customer.cemail);
										$('#editcustomer').modal('show');
									},
									error : function(res) {
										alert("error");

									}
								});

							});

				});
	</script>


</body>
</html>