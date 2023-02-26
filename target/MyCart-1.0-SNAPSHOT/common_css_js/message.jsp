<%
    // this message we are getting from the RegisterServlet
String message = (String)session.getAttribute("message");
if(message!=null){

%>

<!--// the scriplet tag is close and open because we have to write our html-->

<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong><%= message %></strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<%
     
    session.removeAttribute("message");
    }

   
%>
