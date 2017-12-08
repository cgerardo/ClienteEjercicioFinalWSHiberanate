<%-- 
    Document   : index
    Created on : 6/12/2017, 03:15:22 PM
    Author     : gerar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion de Productos</title>
    </head>
    <body>
            <%-- start web service invocation --%><hr/>
    <%
    try {
	utng.pcamacho.services.webservices.LibrosWS_Service service = new utng.pcamacho.services.webservices.LibrosWS_Service();
	utng.pcamacho.services.webservices.LibrosWS port = service.getLibrosWSPort();
	 // TODO initialize WS operation arguments here
	int codigo = Integer.parseInt(request.getParameter("codigo"));
	java.lang.String titulo = request.getParameter("titulo");
	java.lang.String autor = request.getParameter("autor");
	java.lang.String editorial = request.getParameter("editorial");
	java.lang.String edicion = request.getParameter("edicion");;
	// TODO process result here
	java.lang.String result = port.ingresarLibros(codigo, titulo, autor, editorial, edicion);
	out.println("Result = "+result);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
        out.println("No se ingreso correctamente");
    }
    %>
    <%-- end web service invocation --%><hr/>
    <%-- start web service invocation --%><hr/>
    <%
    try {
	utng.pcamacho.services.webservices.LibrosWS_Service service = new utng.pcamacho.services.webservices.LibrosWS_Service();
	utng.pcamacho.services.webservices.LibrosWS port = service.getLibrosWSPort();
	 // TODO initialize WS operation arguments here
	int codigo = Integer.parseInt(request.getParameter("codigo"));
	// TODO process result here
	java.lang.String result = port.buscarLibros(codigo);
	out.println("Result = "+result);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>
    <h1>Ingresar Libro</h1>
    <form action="index.jsp" method="post">
        <table>
            <tr>
                <th>Codigo</th>
                <td><input type="text" name="codigo" size="10" required></td>
            </tr>
            <tr>
                <th>Titulo</th>
                <td><input type="text" name="titulo" size="20" required></td>
            </tr>
            <tr>
                <th>Autor</th>
                <td><input type="text" name="autor" size="20" required></td>
            </tr>
            <tr>
                <th>Editorial</th>
                <td><input type="text" name="editorial" size="20" required></td>
            </tr>
            <tr>
                <th>Edicion</th>
                <td><input type="text" name="edicion" size="20" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Enviar"</td>
            </tr>
        </table>
    </form>
    <h1>Buscar Libro</h1>
    <form action="index.jsp" method="post">
        <table>
            <tr>
                <th>Codigo</th>
                <td><input type="text" name="codigo" size="10" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Buscar"</td>
            </tr>
        </table>
    </form>
    </body>
</html>
