var checkedRows=[];

function setDeleteButtonEnable() {
    var checked = false;

    if(checkedRows.length>0){
        checked= true;
    }

    if(checked){
        $('#delete_practices_btn').prop("disabled", false);
    }else{
        $('#delete_practices_btn').prop("disabled", "disabled");
    }
}

function deletePracticeAjaxRequest(){
    $.ajax({
        type: "DELETE",
        contentType: "application/json; charset=UTF-8",
        url:"/practices",
        data:JSON.stringify(getCheckedPracticesId()),
        success: function (data) {
            checkedRows = [];
            $('#table1').bootstrapTable('refresh');
            $('#delete_practices_btn').prop("disabled", "disabled");
        }
    });
}

function getCheckedPracticesId() {
    var selections = [];
    for(var i in checkedRows){
        selections.push(checkedRows[i].id);
    }
    return selections;
}

function selectionManager(e, rows) {

    var datas = $.map(!$.isArray(rows) ? [rows] : rows, function (row) {
            return {id: row.id};
        }),
        func2 = $.inArray(e.type, ['check', 'check-all']) > -1 ? 'union' : 'differenceBy';

    if($.inArray(e.type, ['check', 'check-all']) > -1) {
        checkedRows = _[func2](checkedRows, datas);
    }else{
        checkedRows = _[func2](checkedRows, datas, 'id');
    }
    console.log(checkedRows);
}

function responseHandler(res) {

    var selections = [];
    for(var i in checkedRows){
        selections.push(checkedRows[i].id);
    }

    $.each(res.rows, function (i, row) {
        row.state = $.inArray(row.id, selections) !== -1;
    });
    return res;
}