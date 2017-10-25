<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Request list</title>
        <jsp:include page="/jsp/blocks/siteresourceslinks.jsp"/>
    </head>
    <body>
        <jsp:include page="/jsp/blocks/sitenavbar.jsp"/>

        <jsp:include page="/jsp/blocks/jumbotronblock.jsp">
            <jsp:param name="pageTitle" value="Requests page"/>
            <jsp:param name="titleDescription" value="Actual information about all practice requests."/>
        </jsp:include>


        <div class="container">
            <div class="btn-toolbar">
                <div class="btn-group ">
                    <a href="createRequest.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Create request</a>
                    <button type="submit" class="btn btn-danger"> Delete request  <span class="glyphicon glyphicon-trash"></span></button>
                </div>
            </div>
        </div>


        <br/>
        <div class="container table-responsive">
            <table class="table table-condensed table-striped">
                <thead>
                    <tr>
                        <th>Choice</th>
                        <th>Head of practice</th>
                        <th>Company name</th>
                        <th>Start date</th>
                        <th>Finish date</th>
                        <th>Status</th>
                        <th>Faculty</th>
                        <th>Speciality</th>
                        <th>Average mark</th>
                        <th>Total quantity</th>
                        <th>Available quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><div class="checkbox"><label><input type="checkbox"></label></div></td>
                        <td>Surkov K.A.</td>
                        <td>Netcrakcer</td>
                        <td>01.09.2017</td>
                        <td>01.10.2017</td>
                        <td>Available</td>
                        <td>FSCAN</td>
                        <td>ITS</td>
                        <td>8</td>
                        <td>10</td>
                        <td>9</td>
                        <td><button href="#" class="btn btn-default btn-block" data-toggle="modal" data-target="#myModal">Edit <span class="glyphicon glyphicon-pencil"></span></button></td>
                    </tr>
                    <tr>
                        <td><div class="checkbox"><label><input type="checkbox"></label></div></td>
                        <td>Smolykova A.A.</td>
                        <td>EPAM</td>
                        <td>01.09.2017</td>
                        <td>01.10.2017</td>
                        <td>Available</td>
                        <td>-</td>
                        <td>-</td>
                        <td>7</td>
                        <td>100</td>
                        <td>80</td>
                        <td><a href="#" class="btn btn-default btn-block" data-toggle="modal" data-target="#myModal">Edit <span class="glyphicon glyphicon-pencil"></span></a></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="modal fade" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">x</button>
                        <h4 class="modal-title">Edit request</h4>
                    </div>
                    <div class="modal-body">
                        <h2 class="text-center">Edit request information:</h2>
                        <form>
                            <div class="form-group">
                                <label class="control-label">Choose head of practice:</label>
                                <div>
                                    <select class="form-control">
                                        <option>Surkov K.A.</option>
                                        <option>Smolykova A.A</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Company name:</label>
                                <div>
                                    <input type="text" class="form-control" placeholder="Enter name...">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Start date:</label>
                                <div >
                                    <input type="date" class="form-control" placeholder="Choose date...">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Finish date:</label>
                                <div>
                                    <input type="date" class="form-control" placeholder="Choose date...">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Choose faculty:</label>
                                <div>
                                    <select class="form-control">
                                        <option>-</option>
                                        <option>FSCAN</option>
                                        <option>FCP</option>
                                        <option>FTC</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Choose speciality:</label>
                                <div>
                                    <select class="form-control">
                                        <option>-</option>
                                        <option>ITS</option>
                                        <option>VMSIS</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Average mark:</label>
                                <div>
                                    <input type="text" class="form-control" placeholder="Enter minimum mark...">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Total quantity:</label>
                                <div>
                                    <input type="text" class="form-control" placeholder="*20...">
                                </div>
                            </div>

                            <div>
                                <button type="submit" class="btn btn-primary btn-block">Edit practice request</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/jsp/blocks/sitefooter.jsp"/>
    </body>
</html>