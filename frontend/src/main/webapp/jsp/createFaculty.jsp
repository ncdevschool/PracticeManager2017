<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Create faculty</title>
        <jsp:include page="/jsp/blocks/siteresourceslinks.jsp"/>
        <script src="../resources/js/custom/registration/faculty/registrationFacultyActions.js"></script>
        <script src="../resources/js/custom/registration/faculty/registrationFacultyListeners.js"></script>
    </head>
    <body>
        <jsp:include page="/jsp/blocks/sitenavbar.jsp"/>

        <jsp:include page="/jsp/blocks/jumbotronblock.jsp">
            <jsp:param name="pageTitle" value="Creation page"/>
            <jsp:param name="titleDescription" value="Choose necessary tab to continue registration in right way."/>
        </jsp:include>

        <div class="container">
            <ul class="nav nav-tabs" role="tablist">
                <li class="active"><a href="#faculty_tab" role="tab" data-toggle="tab">Faculty</a></li>
                <li><a href="#speciality_tab" role="tab" data-toggle="tab">Speciality</a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane active fade in" role="tab" id="faculty_tab">
                    <h2 class="text-center">Creation information:</h2>
                    <form class="form-horizontal">

                        <div class="form-group">
                            <label class="control-label col-md-4">Name of faculty:</label>
                            <div class="col-md-4">
                                <input id="name_faculty" type="text" class="form-control" placeholder="Enter faculty...">
                            </div>
                        </div>

                        <div class="col-md-4 col-md-offset-4">
                            <button id="submit_faculty_btn" type="button" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-plus"></span> Create faculty</button>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" role="tab" id="speciality_tab">
                    <h2 class="text-center">Creation information:</h2>
                    <form class="form-horizontal">

                        <div class="form-group">
                            <label class="control-label col-md-4">Choose faculty:</label>
                            <div class="col-md-4">
                                <select id="faculties" class="form-control">

                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">Name of speciality:</label>
                            <div class="col-md-4">
                                <input id="name_speciality" type="text" class="form-control" placeholder="Enter speciality...">
                            </div>
                        </div>
                        <div class="col-md-4 col-md-offset-4">
                            <button id="submit_speciality_btn" type="button" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-plus"></span> Create speciality</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <jsp:include page="/jsp/blocks/sitefooter.jsp"/>
    </body>
</html>