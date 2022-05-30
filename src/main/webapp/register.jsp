<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

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
        <Title>Registration</Title>
    </head>

    <body>

        <%@include file="Navbar.jsp" %>

            <main class="primary-background banner_background">
                <div class="container">
                    <div class="col-md-8 offset-md-2">
                        <div class="card">
                            <div class="card-header text-center">
                                <i class="fa-solid fa-circle-user fa-3x "></i>
                                <h4>Register here</h4>
                            </div>
                            <div class="card-body">
                                <form action="registerServlet" method="POST" id="reg-form">
                                    <div class="form-group">
                                        <label for="user_name">Username</label>
                                        <input type="text" name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Username">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email
                                            with anyone else.</small>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="gender">Select Gender</label>
                                        <br>
                                        <input type="radio" id="gender" name="gender" value="male">&nbsp;Male
                                        <input type="radio" id="gender" name="gender" value="female">&nbsp;Female

                                    </div>

                                    <div class="form-group">
                                        <textarea name="about" class="form-control" rows="5" placeholder="something about yourself..."></textarea>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Terms and conditions</label>
                                    </div>
                                    <br>
                                    <button id="submit" type="submit" class="btn btn-primary">Submit</button> &nbsp;&nbsp;
                                    <div class="container text-center " id="loader" style="display:none;">
                                        <i class="fa-solid fa-rotate fa-spin fa-2x"></i>
                                        <h4>Please wait....</h4>

                                    </div>



                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </main>

            <!-- Script -->
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="js/myjs.js"></script>
            <script>
                $(document).ready(function() {
                    console.log("loaded.....");
                    $('#reg-form').on('submit', function(event) {
                        event.preventDefault(); //to stop to move on servlet page done message

                        let form = new FormData(this); //complete form data move to this object 

                        //send register servlet   //jquery
                        $('#submit').hide();
                        $('#loader').show();

                        $.ajax({
                            url: "registerServlet",
                            type: 'POST',
                            data: form,
                            success: function(data, textStatus, jqXHR) {
                                //console.log(data);
                                $('#submit').show();
                                $('#loader').hide();

                                //from sweat alert web ...
                                if (data.trim() === 'done') {
                                    swal("registered successfully ..we redirecting to login page")
                                        .then((value) => {
                                            window.location = "login.jsp";

                                        });
                                } else {
                                    swal(data);
                                }

                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                //console.log(jqXHR);
                                $('#submit').show();
                                $('#loader').hide();
                                swal("Something went wrong !")

                            },
                            processData: false,
                            contentType: false
                        });
                    })
                })
            </script>

    </body>

    </html>