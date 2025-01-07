<%@ page import="controller.StudentController, model.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection connection = (Connection) application.getAttribute("dbConnection");
    StudentController controller = new StudentController(connection);
    List<Student> students = controller.getAllStudents();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance Management</title>
</head>
<body>
    <h1>Students</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Roll Number</th>
        </tr>
        <% for (Student student : students) { %>
        <tr>
            <td><%= student.getId() %></td>
            <td><%= student.getName() %></td>
            <td><%= student.getRollNumber() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
```

#### Step 6: Deployment Configuration
**web.xml**
```xml
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee" version="4.0">
    <context-param>
        <param-name>dbURL</param-name>
        <param-value>jdbc:mysql://localhost:3306/attendance</param-value>
    </context-param>
    <context-param>
        <param-name>dbUser</param-name>
        <param-value>root</param-value>
    </context-param>
    <context-param>
        <param-name>dbPassword</param-name>
        <param-value>password</param-value>
    </context-param>

    <listener>
        <listener-class>utils.DBConnectionListener</listener-class>
    </listener>

    <servlet>
        <servlet-name>AttendanceServlet</servlet-name>
        <servlet-class>controller.AttendanceServlet</servlet-class>
    </servlet>

    <servlet-mapping>
        <servlet-name>AttendanceServlet</servlet-name>
        <url-pattern>/attendance</url-pattern>
    </servlet-mapping>
</web-app>