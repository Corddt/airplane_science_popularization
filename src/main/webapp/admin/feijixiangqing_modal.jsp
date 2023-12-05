<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2023/12/5
  Time: 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- 飞机详情信息的模态窗口，默认是隐藏的 -->
<div class="modal fade" id="addOrEditDetailModal" tabindex="-1" role="dialog" aria-labelledby="DetailModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="DetailModalLabel">飞机详情信息</h3>
            </div>
            <div class="modal-body">
                <form id="manageFeiJiXiangQing">
                    <table class="table table-bordered table-striped" width="800px">
                        <tr>
                            <td>详情ID</td>
                            <td><input type="hidden" class="form-control" id="xiangqingid" name="xiangqingid"></td>
                        </tr>
                        <tr>
                            <td>类型ID</td>
                            <td><input class="form-control" id="leixingid" name="leixingid"></td>
                        </tr>
                        <tr>
                            <td>名称</td>
                            <td><input class="form-control" id="mingcheng" name="mingcheng"></td>
                        </tr>
                        <tr>
                            <td>简介</td>
                            <td><textarea class="form-control" id="jianjie" name="jianjie"></textarea></td>
                        </tr>
                        <tr>
                            <td>图片</td>
                            <td><input class="form-control" id="tupian" name="tupian"></td>
                        </tr>
                        <tr>
                            <td>制造商</td>
                            <td><input class="form-control" id="zhizaoshang" name="zhizaoshang"></td>
                        </tr>
                        <tr>
                            <td>使用年限</td>
                            <td><input class="form-control" id="shiyongnianxian" name="shiyongnianxian"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" onclick="addOrEditFeiJiXiangQing()">保存</button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>

