// 删除飞机类型
function deleteType(id) {
    var r = confirm("Delete this?");
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

// 删除飞机详情
function deleteDetail(id) {
    var r = confirm("Delete this?");
    if (r) {
        var url = getProjectPath() + "/feiji/deleteFeiJiXiangQing?id=" + id;
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


