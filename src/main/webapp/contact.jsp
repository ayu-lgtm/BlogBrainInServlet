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
            body {
                background: url("images/711093.jpg");
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                background-attachment: fixed;
            }
            
            section {
                padding: 60px 0;
                min-height: 100vh;
            }
            
            .contact-info {
                display: inline-block;
                width: 100%;
                text-align: center;
                margin-bottom: 10px;
            }
            
            .contact-info-icon {
                margin-bottom: 15px;
            }
            
            .contact-info-item {
                background: #357EC7;
                padding: 30px 0px;
            }
            
            .contact-page-sec .contact-page-form h2 {
                color: #071c34;
                text-transform: capitalize;
                font-size: 22px;
                font-weight: 700;
            }
            
            .contact-page-form .col-md-6.col-sm-6.col-xs-12 {
                padding-left: 0;
            }
            
            .contact-page-form.contact-form input {
                margin-bottom: 5px;
            }
            
            .contact-page-form.contact-form textarea {
                height: 110px;
            }
            
            .contact-page-form.contact-form input[type="submit"] {
                background: #071c34;
                width: 150px;
                border-color: #071c34;
            }
            
            .contact-info-icon i {
                font-size: 48px;
                color: #fda40b;
            }
            
            .contact-info-text p {
                margin-bottom: 0px;
            }
            
            .contact-info-text h2 {
                color: #fff;
                font-size: 22px;
                text-transform: capitalize;
                font-weight: 600;
                margin-bottom: 10px;
            }
            
            .contact-info-text span {
                color: white;
                font-size: 16px;
                font-weight: ;
                display: inline-block;
                width: 100%;
            }
            
            .contact-page-form input {
                background: #f9f9f9 none repeat scroll 0 0;
                border: 1px solid #f9f9f9;
                margin-bottom: 20px;
                padding: 12px 16px;
                width: 100%;
                border-radius: 4px;
            }
            
            .contact-page-form .message-input {
                display: inline-block;
                width: 100%;
                padding-left: 0;
            }
            
            .single-input-field textarea {
                background: #f9f9f9 none repeat scroll 0 0;
                border: 1px solid #f9f9f9;
                width: 100%;
                height: 120px;
                padding: 12px 16px;
                border-radius: 4px;
            }
            
            .single-input-fieldsbtn input[type="submit"] {
                background: #071c34;
                color: #fff;
                display: inline-block;
                font-weight: 600;
                padding: 10px 0;
                text-transform: capitalize;
                width: 150px;
                margin-top: 20px;
                font-size: 16px;
            }
            
            .single-input-fieldsbtn input[type="submit"]:hover {
                background: lightblue;
                border-color: #071c34;
                color: black
            }
            
            .single-input-field h4 {
                text-transform: capitalize;
                font-size: 14px;
            }
            
            .contact-page-form {
                display: inline-block;
                width: 100%;
                margin-top: 30px;
            }
            
            .contact-page-map {
                margin-top: 36px;
            }
            
            .contact-page-form form {
                padding: 20px 15px 0;
            }
        </style>
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <%@include file="Navbar.jsp" %>

            <section class="contact-page-sec mt-5">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="contact-info">
                                <div class="contact-info-item">
                                    <div class="contact-info-icon">
                                        <i class="fas fa-map-marked"></i>
                                    </div>
                                    <div class="contact-info-text">
                                        <h2>address</h2>
                                        <span><a href="https://github.com/ayu-lgtm" class="text-white">Ayush Rastogi
											</a></span>
                                        <span>Ghaziabad , INDIA</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="contact-info">
                                <div class="contact-info-item">
                                    <div class="contact-info-icon">
                                        <i class="fas fa-envelope"></i>
                                    </div>
                                    <div class="contact-info-text">
                                        <h2>E-mail</h2>
                                        <span><a href="https://auth.geeksforgeeks.org/user/rastogiayush2000/practice"
												class="text-white">GeeksForGeeks</a></span>
                                        <span>ayush1910094@akgec.ac.in</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="contact-info">
                                <div class="contact-info-item">
                                    <div class="contact-info-icon">
                                        <i class="fas fa-clock"></i>
                                    </div>
                                    <div class="contact-info-text">
                                        <h2>Time to contact</h2>
                                        <span>Mon - Thu 9:00 am - 4.00 pm</span>
                                        <span>Thu - Mon 10.00 pm - 5.00 pm</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="contact-page-form">
                                <h2>Get in Touch</h2>
                                <form action="emailServlet" method="post">
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="single-input-field">
                                                <input type="text" placeholder="Your Name" name="name" />
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="single-input-field">
                                                <input type="email" placeholder="E-mail" name="email" required />
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="single-input-field">
                                                <input type="text" placeholder="Phone Number" name="phone" />
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="single-input-field">
                                                <input type="text" placeholder="Subject" name="subject" />
                                            </div>
                                        </div>
                                        <div class="col-md-12 message-input">
                                            <div class="single-input-field">
                                                <textarea placeholder="Write Your Message" name="message"></textarea>
                                            </div>
                                        </div>
                                        <div class="single-input-fieldsbtn">
                                            <input type="submit" value="Send Now">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-md-4 text-center">
                            <img src="images/gmail_animation.gif" style="width:100%;height:70%;margin-top:10%;display:flex">
                        </div>
                    </div>
                </div>
            </section>
    </body>

    </html>