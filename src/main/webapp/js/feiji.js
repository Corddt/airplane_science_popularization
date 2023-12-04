// 重置添加和编辑窗口中输入框的内容
function resetForm() {
    $("#addOrEditFeiJiLeiXing input").val("");
}

// 查询id对应的飞机类型信息，并将信息回显到编辑窗口中
function findTypeById(id) {
    var url = getProjectPath() + "/feiji/findById?id=" + id;
    $.get(url, function (response) {
        if (response.success) {
            $("#leixingid").val(response.data.leixingid);
            $("#leixingmingcheng").val(response.data.leixingmingcheng);
            $("#miaoshu").val(response.data.miaoshu);
        } else {
            alert("数据加载失败：" + response.message);
        }
    });
}

// 点击添加或编辑窗口的确认按钮时，提交飞机类型信息
function addOrEditFeiJiLeiXing() {
    var data = {
        leixingid: $("#leixingid").val(),
        leixingmingcheng: $("#leixingmingcheng").val(),
        miaoshu: $("#miaoshu").val()
    };
    var url = data.leixingid ? getProjectPath() + "/feiji/editFeiJiLeiXing" : getProjectPath() + "/feiji/addFeiJiLeiXing";
    $.post(url, data, function (response) {
        alert(response.message);
        if (response.success) {
            window.location.reload();
        }
    });
}

// 删除飞机类型
function deleteType(id) {
    var r = confirm("Are you sure you want to delete this aircraft type?");
    if (r) {
        var url = getProjectPath() + "/feiji/deleteFeiJiLeiXing?id=" + id;
        $.get(url, function (response) {
            alert(response.message);
            if (response.success) {
                window.location.reload();
            }
        });
    }
}


// 获取当前项目的路径
function getProjectPath() {
    var pathName = window.document.location.pathname;
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    return projectName;
}
