<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@page import="java.sql.*,com.project.helpers.ConnectionProvider,com.project.entities.message" %>

        <!doctype html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <link rel="icon" type="image/png" href="images/blog.png" />
            <script src="https://kit.fontawesome.com/aa352f40dd.js" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
            <link rel="stylesheet" href="css/style.css">
            <style>
                .banner_background {
                    clip-path: polygon(32% 0, 70% 0%, 100% 0, 100% 93%, 69% 100%, 24% 93%, 0 100%, 0 0);
                }
            </style>
            <title>Login Page</title>

        </head>

        <body>

            <!-- Navbar -->
            <%@include file="Navbar.jsp" %>

                <main class="d-flex align-items-center primary-background banner_background" style="height:80vh">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-5 offset-md-4">
                                <div class="card">
                                    <div class="card-header primary-background text-white text-center">
                                        <i class="fa-solid fa-circle-user fa-3x "></i>
                                        <h4>Login here</h4>
                                    </div>
                                    <% message m=(message)session.getAttribute("msg"); if(m!=null){ %>
                                        <div class="alert <%=m.getCssClass() %>" role="alert">
                                            <!-- //get alert css class from login servlet when error occur -->
                                            <%=m.getContent() %>
                                        </div>
                                        <% session.removeAttribute("msg");//after getting warning session is removed for no again showing error
										} %>
                                            <div class="card-body">
                                                <form action="loginServlet" method="POST">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Email address</label>
                                                        <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                                                        <small id="emailHelp" class="form-text text-muted">We'll never
															share your email with anyone else.</small>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputPassword1">Password</label>
                                                        <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                                                    </div>

                                                    <br>
                                                    <div class="container text-center">
                                                        <button type="submit" class="btn btn-primary">Submit</button>
                                                    </div>

                                                </form>

                                            </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </main>


                <!-- Optional JavaScript -->
                <!-- jQuery first, then Popper.js, then Bootstrap JS -->
                <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                <script src="js/myjs.js"></script>
        </body>

        </html>