<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <title>Gold Ninja</title>
    </head>
    <body class="bg-dark">
        <main>
            <div class="container py-5">
                <div class="card">
                    <div class="card-header">
                        <div class="row justify-content-between">
                            <div class="col-md-auto mr-auto">
                                <h3>Your Gold <span><c:out value="${gold}"></c:out></span></h3>
                            </div>
                            <div class="col-auto">
                                <a href="/reset">
                                    <button type="button" class="btn btn-danger">Reset</button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row text-center">
                            <!--- 4 card with 4 columns -->
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-header">
                                        <h3>Farm</h3>
                                    </div>
                                    <div class="card-body">
                                        <form action="/processGold" method="post">
                                            <input type="hidden" name="building" value="farm">
                                            <p>Earns 10-20 golds </p>
                                            <button type="submit" class="btn btn-warning">Find Gold </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-header">
                                        <h3>Cave</h3>
                                    </div>
                                    <div class="card-body">
                                        <form action="/processGold" method="post">
                                            <input type="hidden" name="building" value="cave">
                                            <p>Earns 5-10 golds </p>
                                            <button type="submit" class="btn btn-warning">Find Gold </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-header">
                                        <h3>House</h3>
                                    </div>
                                    <div class="card-body">
                                        <form action="/processGold" method="post">
                                            <input type="hidden" name="building" value="house">
                                            <p>Earns 2-5 golds </p>
                                            <button type="submit" class="btn btn-warning">Find Gold </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-header">
                                        <h3>Casino</h3>
                                    </div>
                                    <div class="card-body">
                                        <form action="/processGold" method="post">
                                            <input type="hidden" name="building" value="casino">
                                            <p>Earns or Loses 0-50 golds </p>
                                            <button type="submit" class="btn btn-warning">Find Gold </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Activity Log-->
                        <div class="row py-2">
                            <div class="col-md-12">
                                <h4>Activities: </h4>
                                <div class="border px-5 border">
                                    <ul class="list-group list-group-flush">
                                        <c:forEach items="${activities}" var="activity">
                                            <c:choose>
                                                <c:when test="${activity.getWinorLose() == 'green'}">
                                                    <li class="list-group-item text-success">
                                                        ${activity.getMessage(activity.getWinorLose())}
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="list-group-item text-danger">
                                                        ${activity.getMessage(activity.getWinorLose())}
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
