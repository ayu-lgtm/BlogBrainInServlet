<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@page isErrorPage="true" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="ISO-8859-1" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Arvo" />
            <link rel="icon" type="image/png" href="images/blog.png" />
            <script src="https://kit.fontawesome.com/aa352f40dd.js" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
            <link rel="stylesheet" href="css/style.css" />
            <title>Error</title>
            <style>
                .page_404 {
                    padding: 40px 0;
                    background: #fff;
                    font-family: "Arvo", serif;
                }
                
                .page_404 img {
                    width: 100%;
                }
                
                .four_zero_four_bg {
                    background-image: url(https://cdn.dribbble.com/users/285475/screenshots/2083086/dribbble_1.gif);
                    margin-top: 50px;
                    height: 500px;
                    background-position: center;
                }
                
                .four_zero_four_bg h1 {
                    font-size: 70px;
                }
                
                .link_404 {
                    color: #fff !important;
                    padding: 10px 20px;
                    margin: 20px 0;
                    display: inline-block;
                }
                
                .contant_box_404 {
                    margin-top: -50px;
                }
                
                .contant_box_404 .h2 {
                    font-size: 35px;
                }
                
                .contant_box_404 p {
                    font-size: 15px;
                }
                
                .contant_box_404 a {
                    width: 150px;
                    hight: 5px;
                    font-size: 15px;
                }
            </style>
        </head>

        <body>
            <section class="page_404">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="col-sm-10 col-sm-offset-1 text-center">
                                <div class="four_zero_four_bg md-3">
                                    <h1 class="text-center">
                                        Look like you're lost
                                    </h1>
                                </div>
                                <div class="contant_box_404">
                                    <h2 class="h2">
                                        <%= exception %>
                                    </h2>
                                    <p>the page you are looking for not avaible!</p>
                                    <a href="index.jsp" class="link_404 primary-background">Go to Home</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        </body>

        </html>