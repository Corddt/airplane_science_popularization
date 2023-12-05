<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2023/12/4
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- 飞机类型信息的模态窗口，默认是隐藏的 -->
<div class="modal fade" id="addOrEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="myModalLabel">飞机类型信息</h3>
            </div>
            <div class="modal-body">
                <form id="manageFeiJiLeiXing">
                    <table class="table table-bordered table-striped" width="800px">
                        <span><input type="hidden" id="leixingid" name="leixingid"></span>
                        <tr>
                            <td>类型名称</td>
                            <td><input class="form-control" name="leixingmingcheng" id="leixingmingcheng"></td>
                        </tr>
                        <tr>
                            <td>描述</td>
                            <td><textarea class="form-control" name="miaoshu" id="miaoshu"></textarea></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" onclick="addOrEditFeiJiLeiXing()">保存</button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>
