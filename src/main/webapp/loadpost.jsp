
      <%@page import ="java.util.*,com.project.helpers.*,com.project.entities.*,com.project.dao.*" %>


      <div class="row">     
       <% 
        
        Thread.sleep(1000);
		PostDao dao=new PostDao(ConnectionProvider.getConnection());
       
        int cid = Integer.parseInt(request.getParameter("cid"));
        ArrayList<post> pst=null;
        if(cid==0){
        	 pst = dao.getAllPost();
        }else{
        	pst=dao.getPostByCatId(cid);
        }
        
        if(pst.size()==0){
        	out.println("<h3 class='display-3 text-center'>No Post in this category..</h3>");
        }
		for(post p:pst){
        %>
			<div class="col-md-6 mt-2" >
				<div class="card" style="border-radius:9px">
				    <div class="card-body " style="border-radius:15px">
				    	<img class="card-img-top" src="blogPic/<%=p.getpPic() %>" alt="<%=p.getpTitle() %>">
				    </div>
					<div class="card-body">
						<b><%=p.getpTitle() %></b>
						<p><%=p.getpContent() %></p>			
					</div>
					<div> 
						<div class="card-footer text-center primary-background">
						<%  
		                    LikeDao ld =new LikeDao(ConnectionProvider.getConnection());
						    user _user=(user)session.getAttribute("currentuser");
		                            				    
		                 %>
							<a href="" class="btn btn-outline-light btn-sm " onclick="doLike(<%=p.getPid()%>,<%=_user.getId()%>)"><i class="fa fa-thumbs-o-up">&nbsp;<span class="counter"><%=ld.countLikeOnPost(p.getPid()) %></span></i></a>
				            <a href="show_blog.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-light btn-sm">Read More..</a> 
					        <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o">&nbsp;<span>20</span></i></a>
						</div>
					</div>
				</div>
			</div>				
        <%
		}
        %>
       </div>  
       					<script>
                            function doLike(pid,uid){
                        		//console.log(pid+","+uid);
                        		
                        		const d = {   //object in javascript
                        				uid:uid,
                        				pid:pid,
                        				operation:'like'//key
                        		}
                        		
                        		$.ajax({
                    				url: "likeServlet",
                    				data:d,
                                    success: function(data, textStatus, jqXHR) {
                                    	//console.log(data);
                                    	if(data.trim()=='true')
                                    	{
                                    		var c=$(".counter").html();
                                    		//console.log(c);
                                    		c++;
                                    		$('.counter').html(c);
                                    		
                                    	}
                                    },
                        		    error:function(jqXHR, textStatus, errorThrown){
                        		    	//console.log(errorThrown);
                        		    }
                    			})
                        	}
                            </script>