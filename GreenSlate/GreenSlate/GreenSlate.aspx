<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GreenSlate.aspx.cs" Inherits="GreenSlate.GreenSlate" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css"
        href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />
    <script type= "text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                url: 'UserProjectService.asmx/GetProjects',
                method: 'post',
                dataType: 'json',
                success: function (data) {
                    $('#datatable').dataTable({
                        paging: true,
                        sort: true,
                        searching: true,
                        scrollY: 200,
                        data: data,
                        columns: [
                            { 'data': 'ProjectID' },
                            { 'data': 'StartDate' },
                            { 'data': 'TimeToStart' },
                            { 'data': 'EndDate' },
                            { 'data': 'Credits' },
                            { 'data': 'CurrentStatus' }
                        ]
                    });
                }
            });
        });
    </script>
</head>
<body style="font-family: Arial">
    <form id="form1" runat="server">
        <div style="width: 900px; border: 1px solid black; padding: 3px">
            <table id="datatable">
                <thead>
                    <tr>
                        <th>ProjectId</th>
                        <th>Start Date</th>
                        <th>Time To Start</th>
                        <th>End Date</th>
                        <th>Credites</th>
                        <th>Current Status</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>ProjectId</th>
                        <th>Start Date</th>
                        <th>Time To Start</th>
                        <th>End Date</th>
                        <th>Credites</th>
                        <th>Current Status</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </form>
</body>
</html>