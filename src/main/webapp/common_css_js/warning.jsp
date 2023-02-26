<%
    // this message we are getting from the RegisterServlet
String warning = (String)session.getAttribute("warning");
if(warning!=null){

%>

<!--// the scriplet tag is close and open because we have to write our html-->

<div class="alert alert-warning alert-dismissible fade show" role="alert">
    <strong><%= warning %></strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<%
     
    session.removeAttribute("message");
    }

   
%>
