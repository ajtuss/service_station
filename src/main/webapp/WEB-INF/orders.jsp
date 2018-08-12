<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ajtus
  Date: 29.07.18
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Service Station</title>
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">

    <%--jQuery--%>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

    <%--Bootstrap 3--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <%--DataTable, buttons, select--%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/jquery.dataTables.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.2.6/css/select.dataTables.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/select/1.2.6/js/dataTables.select.js"></script>


    <script src="http://momentjs.com/downloads/moment.js"></script>
    <script src="https://cdn.datatables.net/plug-ins/1.10.19/dataRender/datetime.js"></script>
    <script src="js/ordersScript.js"></script>
</head>
<body>

<%@ include file="/WEB-INF/fragments/menu.jsp" %>

<div class="container">


    <h2>Aktualne naprawy:</h2>
    <form class="form-horizontal" action="/" method="get">
        <div class="form-group col-sm-10">
            <label class="control-label col-sm-1" for="employee">Pracownik:</label>
            <div class="col-sm-3">
                <select class="form-control" id="employee" name="employeeId" onchange="this.form.submit()">
                    <option value="">Wybierz pracownika</option>
                    <c:forEach items="${employees}" var="employee" varStatus="loop">
                        <c:choose>
                            <c:when test="${employee.id == employeeId}">
                                <option value="${employee.id}" selected>${employee.name} ${employee.surname}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${employee.id}">${employee.name} ${employee.surname}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="col-sm-2">
            <a href="/orders/add" role="button" class="btn btn-primary btn-sm m-0 btn-block">Dodaj Zlecenie</a>
        </div>
    </form>
    <table id="ordersTab" class="display" style="width:100%">
        <thead>
        <tr>
            <th></th>
            <th>Data przyjęcia<br>do naprawy</th>
            <th>Planowana data<br>rozpoczęcia naprawy</th>
            <th>Data rozpoczecia<br>naprawy</th>
            <th>Pracownik</th>
            <th>Status</th>
            <th>Koszt naprawy</th>
            <th class="col-sm-1">
            </th>
            <th class="col-sm-1"></th>
        </tr>
        </thead>
        <tbody>
        <%--<c:forEach items="${orders}" var="order" varStatus="loop">--%>
        <%--<tr>--%>
            <%--<td>${loop.count}</td>--%>
            <%--<td>${order.arrivalDate}</td>--%>
            <%--<td>${order.plannedRepairDate}</td>--%>
            <%--<td>${order.realRepairDate}</td>--%>
            <%--<td>${order.employee.name} ${order.employee.surname}</td>--%>
            <%--<td>${order.status.name}</td>--%>
            <%--<td>${order.totalCost}</td>--%>
            <%--<td>--%>
                <%--<a href="/orders/edit?id=${order.id}" role="button"--%>
                   <%--class="btn btn-primary btn-sm m-0 btn-block">Edytuj</a>--%>
            <%--</td>--%>
            <%--<td>--%>
                <%--<a href="/orders/delete?id=${order.id}" role="button"--%>
                   <%--class="btn btn-primary btn-sm m-0 btn-block">Usuń</a>--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--</c:forEach>--%>
        </tbody>
    </table>
</div>

<%@ include file="/WEB-INF/fragments/footer.jsp" %>

</body>
</html>
