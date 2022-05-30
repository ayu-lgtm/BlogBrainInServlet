<%@page import="com.project.entities.*,com.project.dao.*,java.util.*,com.project.helpers.*" %>
    <%@page errorPage="error.jsp" %>
        <% user _user=(user)session.getAttribute("currentuser"); if(_user==null){ response.sendRedirect("login.jsp");
            }%>
            <% int postId=Integer.parseInt(request.getParameter("post_id")); PostDao dao=new
                PostDao(ConnectionProvider.getConnection()); post p=dao.getPostByPostId(postId); %>



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
                            
                            .banner_background {
                                clip-path: polygon(32% 0, 70% 0%, 100% 0, 100% 93%, 69% 100%, 24% 93%, 0 100%, 0 0);
                            }
                            
                            pre {
                                display: block;
                                padding: 9.5px;
                                margin: 0 0 10px;
                                font-size: 13px;
                                line-height: 1.42857143;
                                color: #333;
                                word-break: break-all;
                                word-wrap: break-word;
                                background-color: #f5f5f5;
                                border: 1px solid #ccc;
                                border-radius: 4px;
                            }
                            
                            textarea[disabled] {
                                color: #357EC7;
                                background-color: #fff !important;
                            }
                        </style>
                        <title>
                            <%= p.getpTitle() %> || Technicalblogspot By Ayush
                        </title>

                    </head>

                    <body>
                        <div id="fb-root"></div>
                        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v14.0" nonce="frxppVTK"></script>
                        <!-- Navbar -->
                        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
                            <a class="navbar-brand" href="index.jsp">
                                &nbsp;<i class="fa-brands fa-blogger-b"></i>&nbsp;Technicalblogspot</a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav mr-auto">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="profile.jsp"><i
                                                class="fa-solid fa-bell"></i>&nbsp;Ayushspace</a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link" href="contact.jsp"><i
                                                class="fa-solid fa-address-card"></i>&nbsp;Contact
                                            Us</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><i class="fa-solid fa-blog"></i>&nbsp;Do
                                            Post</a>
                                    </li>
                                </ul>
                                <form class="form-inline my-2 my-lg-0">
                                    <ul class="navbar-nav mr-right">
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="modal" data-target="#exampleModal" href="#"><i class="fa-solid fa-user-circle"></i>&nbsp;<%=_user.getName()
                                                    %></a>
                                        </li>
                                    </ul>

                                </form>
                                <ul class="navbar-nav mr-right">
                                    <li class="nav-item">
                                        <a class="nav-link" href="logoutServlet"><i
                                                class="fa-solid fa-user-plus"></i>&nbsp;Log out</a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                        <!-- End of navbar -->

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header primary-background text-white text-center">
                                        <h5 class="modal-title" id="exampleModalLabel">Shooping Maker</h5>
                                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container text-center">
                                            <img id="profile-pic" src="pics/<%=_user.getProfile()%>" style="max-width:200px;border-radius :50%" />

                                            <h5 class="modal-title" id="exampleModalLabel">
                                                <%=_user.getName() %>
                                            </h5>
                                            <br>
                                            <!-- details -->
                                            <div id="profile-details">
                                                <table class="table table-striped">
                                                    <tbody>
                                                        <tr>
                                                            <th scope="row">ID : </th>
                                                            <td>
                                                                <%=_user.getId() %>
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <th scope="row">Email :</th>
                                                            <td>
                                                                <%=_user.getEmail() %>
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <th scope="row">Gender :</th>
                                                            <td>
                                                                <%=_user.getGender().toUpperCase() %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">Registered on :</th>
                                                            <td>
                                                                <%=_user.getDateTime().toString() %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">Status :</th>
                                                            <td>
                                                                <%=_user.getAbout() %>
                                                            </td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </div>
                                            <!-- profile edit -->
                                            <div id="profile-edit" style="display:none">
                                                <form action="editServlet" method="post" enctype="multipart/form-data">
                                                    <table class="table table-striped">
                                                        <tbody>
                                                            <tr>
                                                                <th scope="row">ID : </th>
                                                                <td><input type="text" id="user_id" class="form-control" name="user_id" value="<%=_user.getId() %>" disabled></td>

                                                            </tr>
                                                            <tr>
                                                                <th scope="row">Name :</th>
                                                                <td><input type="text" id="user_name" class="form-control" name="user_name" value="<%=_user.getName() %>"></td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">Email :</th>
                                                                <td><input type="Email" id="user_email" class="form-control" name="user_email" value="<%=_user.getEmail() %>"></td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">Password :</th>
                                                                <td><input type="Password" id="user_password" class="form-control" name="user_password" value="<%=_user.getGender().toUpperCase() %>">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">Gender :</th>
                                                                <td><input type="text" id="user_gender" class="form-control disabled" name="user_gender" value="<%=_user.getGender().toUpperCase() %>" disabled></td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">Status :</th>
                                                                <td>
                                                                    <textarea rows="3" cols="22" class="form-control" name="user_textarea"><%=_user.getAbout()%></textarea>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">Change Picture</th>
                                                                <td><input type="file" name="image" class="form-control" value="pics/<%=_user.getProfile()%>" /></td>
                                                            </tr>
                                                            <tr>
                                                                <th></th>
                                                                <td><button type="submit" class="btn btn-secondary primary-background">Save</button>
                                                                </td>
                                                            </tr>

                                                        </tbody>
                                                    </table>
                                                </form>
                                            </div>
                                        </div>

                                        <div class="modal-footer">

                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" id="edit-profile-button" class="btn btn-primary primary-background">Edit</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- -End of profile modal  -->

                        <!--add-post - Modal -->


                        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header primary-background text-white">
                                        <h5 class="modal-title " id="exampleModalLabel">Provide the post details...
                                        </h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-full">
                                            <form action="addPostServlet" method="post" id="add-post-form">
                                                <div class="form-group">
                                                    <select class="form-control form-control-sm" name="cid">
                                                        <option selected disabled>Select categories....</option>

                                                        <% PostDao po=new PostDao(ConnectionProvider.getConnection());
                                                            ArrayList<Catagory> al =po.getAllCategories();

                                                            for(Catagory c:al){

                                                            %>
                                                            <option value="<%=c.getCid() %>">
                                                                <%=c.getName() %>
                                                            </option>
                                                            <% } %>

                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <input type="text" placeholder="Enter your post Title" class="form-control" name="post-title" />
                                                </div>

                                                <div class="form-group">
                                                    <textarea placeholder="Enter your Content..." rows="5" cols="10" class="form-control" name="pst-content"></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <pre><textarea placeholder="Enter your program code (if any)..."  rows="5" cols="10" class="form-control" name="post-code"></textarea></pre>
                                                </div>
                                                <div class="form-group">
                                                    <label class="form-group">Select Content pic :</label>
                                                    <hr>
                                                    <input type="file" class="form-group" name="post_pic" />
                                                </div>
                                                <div class="form-group text-center">
                                                    <button type="submit" class="btn btn-primary primary-background" class="form-group">Post</button>
                                                </div>

                                            </form>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>


                        <!-- Main body of the page -->
                        <div class="container my-4">
                            <div class="row">
                                <div class="col-md-10 offset-md-1">
                                    <div class="card border border-primary">
                                        <div class="card-header primary-background text-white ">
                                            <h4>
                                                <%=p.getpTitle() %>
                                            </h4>

                                        </div>
                                        <div class="card-body">

                                            <div class="card-body " style="border-radius:15px">
                                                <img class="card-img-top my-3" src="blogPic/<%=p.getpPic() %>" alt="<%=p.getpTitle() %>">
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-md-8">

                                                    <% userdao dao1=new userdao(ConnectionProvider.getConnection()); %>
                                                        <p>
                                                            <a href="" class="text-monospace" style="font-size:20px">
                                                                <%=dao1.getUserByUserId(p.getUserId()).getName() %>
                                                            </a> has posted :</p>
                                                </div>
                                                <div class="col-md-4">
                                                    <!--//get date from java.text package where DateFormat is class  -->

                                                    <time><i style="font-size:20px;color:gray">
                                                            <%=java.text.DateFormat.getDateTimeInstance().format(p.getpDate())
                                                                %>
                                                        </i></time>
                                                </div>

                                            </div>
                                            <hr>
                                            <p class="post-content" style="font-size:20px">
                                                <%=p.getpContent() %>
                                            </p>
                                            <br>
                                            <br>

                                            <div class="form-outline">
                                                <textarea class="form-control" id="myInput" rows="25" disabled><%=p.getpCode() %></textarea>
                                            </div>
                                            <br>
                                            <div class="text-center"><button type="button" onclick="myFunction()" class="btn btn-gray">Copy</button></div>

                                        </div>
                                        <div>

                                            <% LikeDao ld=new LikeDao(ConnectionProvider.getConnection()); %>
                                                <div class="card-footer primary-background">
                                                    <a class="btn btn-outline-light btn-sm " onclick="doLike(<%=p.getPid()%>,<%=_user.getId()%>)"><i
                                                            class="fa fa-thumbs-o-up">&nbsp;<span class="counter">
                                                                <%=ld.countLikeOnPost(p.getPid()) %>
                                                            </span></i></a>
                                                    <a class="btn btn-outline-light btn-sm"><i
                                                            class="fa fa-commenting-o">&nbsp;<span>20</span></i></a>
                                                </div>

                                        </div>
                                        <div class="card-footer">
                                            <div class="fb-comments" data-href="http://35.161.196.255:8080/Ayushspace/show_blog.jsp?post_id=<%=p.getUserId() %>" data-width="" data-numposts="5"></div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end main body of the page -->


                        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
                        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

                        <script>
                            $(document).ready(function() {

                                let editStatus = false;
                                $('#edit-profile-button').click(function() {
                                    //alert("desting");
                                    if (editStatus == false) {
                                        $('#profile-details').hide();
                                        $('#profile-edit').show();

                                        editStatus = true;
                                        $(this).text("Back");
                                    } else {
                                        $('#profile-details').show();
                                        $('#profile-edit').hide();

                                        editStatus = false;
                                        $(this).text("Edit");
                                    }
                                })

                            })
                        </script>

                        <!-- Now add post js -->

                        <script>
                            $(document).ready(function(e) {
                                //alert("loaded...")
                                $('#add-post-form').on("submit", function(event) {
                                    //this code get called when form is submitted
                                    event.preventDefault();

                                    let form = new FormData(this);

                                    //now requesting to server
                                    $.ajax({
                                        url: "addPostServlet",
                                        type: 'POST',
                                        data: form,
                                        success: function(data, textStatus, jqXHR) {
                                            console.log(data);
                                            if (data.trim() == 'done') {
                                                swal("Done !", " Adding post..", "success");

                                            } else {
                                                swal("Error !!", " Something went wrong try again.....", "error");
                                            }



                                        },
                                        error: function(jqXHR, textStatus, errorThrown) {
                                            //console.log("not submitted");
                                            swal("Error !!", " Something went wrong try again.....", "error");


                                        },
                                        processData: false,
                                        contentType: false
                                    })

                                })
                            })
                        </script>

                        <script>
                            //loading using ajax

                            function getPost(catId, temp) {
                                $("#loader").show();
                                $('#post-container').hide();

                                $(".c-link").removeClass('active');

                                $.ajax({
                                    url: "loadpost.jsp",
                                    data: {
                                        cid: catId
                                    },
                                    success: function(data, textStatus, jqXHR) {
                                        //console.log(data);
                                        $("#loader").hide();
                                        $('#post-container').show();
                                        $('#post-container').html(data);
                                        $(temp).addClass('active');

                                    }
                                })
                            }
                            $(document).ready(function() {
                                //alert("hi");
                                let allPostRef = $('.c-link')[0];
                                getPost(0, allPostRef);

                            })
                        </script>
                        <script>
                            < !--code
                            for textarea in pretag-- >
                                function myFunction() {
                                    //Get the text field
                                    var copyText = document.getElementById("myInput");

                                    //Select the text field
                                    copyText.select();
                                    copyText.setSelectionRange(0, 99999); // For mobile devices

                                    // Copy the text inside the text field
                                    navigator.clipboard.writeText(copyText.value);

                                }
                        </script>

                        <!-- do like function  -->
                        <script>
                            function doLike(pid, uid) {
                                //console.log(pid+","+uid);

                                const d = { //object in javascript
                                    uid: uid,
                                    pid: pid,
                                    operation: 'like' //key
                                }

                                $.ajax({
                                    url: "likeServlet",
                                    data: d,
                                    success: function(data, textStatus, jqXHR) {
                                        //console.log(data);
                                        if (data.trim() == 'true') {
                                            var c = $(".counter").html();
                                            //console.log(c);
                                            c++;
                                            $('.counter').html(c);

                                        }
                                    },
                                    error: function(jqXHR, textStatus, errorThrown) {
                                        //console.log(errorThrown);
                                    }
                                })
                            }
                        </script>
                        <script type="text/javascript">
                            $(window).on('resize', function() {
                                setTimeout(function() {
                                    CMSSpace.changeFBPagePlugin()
                                }, 500);
                            });

                            $(window).on('load', function() {
                                setTimeout(function() {
                                    CMSSpace.changeFBPagePlugin()
                                }, 1500);
                            });
                        </script>



                    </body>

                    </html>