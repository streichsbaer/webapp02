<FORM METHOD=GET ACTION='cmd.jsp'>
<INPUT name='addr' type=text>
<INPUT type=submit value='Submit!'>
password = 123456
</FORM>

<%@ page import="java.io.*" %>
<%
   String addr = request.getParameter("addr");
   String[] ping = {"/bin/sh", "-c", "ping -c2 " + addr};
   String output = "";
   String password = "password";
   if(ping != null) {
      String s = null;
      try {
         Process p = Runtime.getRuntime().exec(ping);
         BufferedReader sI = new BufferedReader(new InputStreamReader(p.getInputStream()));
         while((s = sI.readLine()) != null) {
            output += s;
         }
      }
      catch(IOException e) {
         e.printStackTrace();
      }
   }
%>

<pre>
<%=output %>
</pre>

