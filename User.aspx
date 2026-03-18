<%@ Page Title="User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="WebApplication1.User" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />

<style>
    body { background-color: #f5f6fa; }

    .page-header {
        background: linear-gradient(135deg, #1e3a5f 0%, #2d6a9f 100%);
        color: white;
        border-radius: 12px;
        padding: 24px 28px;
        margin-bottom: 24px;
    }

    .card {
        border: none;
        border-radius: 12px;
        box-shadow: 0 2px 12px rgba(0,0,0,0.08);
    }

    .custom-card-header {
        background: #fff;
        border-bottom: 2px solid #e9ecef;
        border-radius: 12px 12px 0 0 !important;
        padding: 16px 24px;
        font-weight: 600;
        font-size: 15px;
        color: #1e3a5f;
    }

    /* FormView field rows */
    #FormView1 br { display: none; }

    #FormView1 input[type="text"],
    #FormView1 input:not([type="submit"]):not([type="button"]) {
        width: 100%;
        padding: 8px 12px;
        border: 1.5px solid #dee2e6;
        border-radius: 8px;
        font-size: 14px;
        transition: border-color .2s, box-shadow .2s;
        background: #f8f9fa;
        display: block;
        margin-bottom: 14px;
    }

    #FormView1 input[type="text"]:focus,
    #FormView1 input:focus {
        border-color: #2d6a9f;
        box-shadow: 0 0 0 3px rgba(45,106,159,0.15);
        background: #fff;
        outline: none;
    }

    .fv-label {
        font-size: 12px;
        font-weight: 600;
        color: #6c757d;
        text-transform: uppercase;
        letter-spacing: .04em;
        padding-bottom: 4px;
        display: block;
    }

    /* FormView link buttons */
    #FormView1 a {
        display: inline-block;
        padding: 8px 20px;
        border-radius: 8px;
        font-size: 13px;
        font-weight: 600;
        text-decoration: none;
        margin-right: 8px;
        margin-top: 8px;
        transition: all .15s;
    }

    #FormView1 a[id*="InsertButton"],
    #FormView1 a[id*="UpdateButton"] {
        background: #2d6a9f;
        color: #fff;
    }
    #FormView1 a[id*="InsertButton"]:hover,
    #FormView1 a[id*="UpdateButton"]:hover {
        background: #1e3a5f;
        color: #fff;
    }

    #FormView1 a[id*="CancelButton"] {
        background: #e9ecef;
        color: #495057;
    }
    #FormView1 a[id*="CancelButton"]:hover {
        background: #ced4da;
        color: #212529;
    }

    #FormView1 a[id*="EditButton"] {
        background: #e7f1fb;
        color: #2d6a9f;
        border: 1px solid #b6d4f0;
    }
    #FormView1 a[id*="EditButton"]:hover {
        background: #2d6a9f;
        color: #fff;
    }

    #FormView1 a[id*="DeleteButton"] {
        background: #fdecea;
        color: #dc3545;
        border: 1px solid #f5c2c7;
    }
    #FormView1 a[id*="DeleteButton"]:hover {
        background: #dc3545;
        color: #fff;
    }

    #FormView1 a[id*="NewButton"] {
        background: #e8f8f0;
        color: #198754;
        border: 1px solid #b2dfcc;
    }
    #FormView1 a[id*="NewButton"]:hover {
        background: #198754;
        color: #fff;
    }

    /* GridView table */
    .table {
        border-collapse: separate;
        border-spacing: 0;
    }

    .table thead th {
        background: #212529 !important;
        color: #ffffff !important;
        font-size: 12px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: .06em;
        border-top: none !important;
        border-bottom: 2px solid #000 !important;
        border-right: 1px solid #343a40 !important;
        padding: 13px 16px;
        white-space: nowrap;
    }

    .table thead th:last-child { border-right: none !important; }

    .table tbody td {
        background: #ffffff;
        padding: 12px 16px;
        vertical-align: middle;
        font-size: 14px;
        color: #343a40;
        border-top: 1px solid #f1f3f5 !important;
        border-right: 1px solid #f1f3f5 !important;
        border-bottom: none !important;
        border-left: none !important;
    }

    .table tbody td:last-child { border-right: none !important; }

    .table tbody tr:hover td {
        background: #f1f3f5 !important;
        transition: background 0.12s;
    }

    /* GridView inline Edit/Delete links */
    .table a {
        font-size: 12px;
        font-weight: 600;
        padding: 4px 12px;
        border-radius: 6px;
        text-decoration: none;
        display: inline-block;
        margin: 1px 2px;
    }

    .table td:last-child a:first-child {
        background: #e7f1fb;
        color: #2d6a9f;
    }
    .table td:last-child a:first-child:hover {
        background: #2d6a9f;
        color: #fff;
    }

    .table td:last-child a:last-child {
        background: #fdecea;
        color: #dc3545;
    }
    .table td:last-child a:last-child:hover {
        background: #dc3545;
        color: #fff;
    }

    /* Pager */
    .table tfoot td {
        background: #f8f9fa;
        padding: 12px 16px;
        border-top: 2px solid #dee2e6 !important;
    }
    .table tfoot a,
    .table tfoot span {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 32px;
        height: 32px;
        border-radius: 8px;
        font-size: 13px;
        font-weight: 600;
        text-decoration: none;
        margin: 0 2px;
    }
    .table tfoot a {
        background: #fff;
        color: #2d6a9f;
        border: 1.5px solid #dee2e6;
    }
    .table tfoot a:hover {
        background: #2d6a9f;
        color: #fff;
        border-color: #2d6a9f;
    }
    .table tfoot span {
        background: #2d6a9f;
        color: #fff;
        border: 1.5px solid #2d6a9f;
    }
</style>

<div class="container-lg py-4">

    <!-- Page Header -->
    <div class="page-header d-flex align-items-center gap-3 mb-4">
        <div class="bg-white bg-opacity-25 rounded-3 p-2">
            <i class="bi bi-people-fill fs-3"></i>
        </div>
        <div>
            <h4 class="mb-0 fw-bold">User Management</h4>
        </div>
    </div>

    <!-- Insert / Edit Form Card -->
    <div class="card mb-4">
        <div class="custom-card-header d-flex align-items-center gap-2">
            <i class="bi bi-person-plus-fill text-primary"></i>
            Add New User
        </div>
        <div class="card-body p-4">

            <asp:FormView ID="FormView1" runat="server"
                DefaultMode="Insert"
                DataKeyNames="USERID"
                DataSourceID="SqlDataSource2"
                Width="100%">

                <EditItemTemplate>
                    <div class="row g-3">
                        <div class="col-12">
                            <label class="fv-label">User ID</label>
                            <asp:Label ID="USERIDLabel1" runat="server" Text='<%# Eval("USERID") %>' CssClass="form-control bg-light" />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Username</label>
                            <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Email</label>
                            <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Phone Number</label>
                            <asp:TextBox ID="PHONENUMBERTextBox" runat="server" Text='<%# Bind("PHONENUMBER") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Address</label>
                            <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Created At</label>
                            <asp:TextBox ID="CREATEDATTextBox" runat="server" Text='<%# Bind("CREATEDAT") %>' />
                        </div>
                    </div>
                    <div class="mt-3">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="💾 Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </div>
                </EditItemTemplate>

                <InsertItemTemplate>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="fv-label">User ID</label>
                            <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Username</label>
                            <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Email</label>
                            <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Phone Number</label>
                            <asp:TextBox ID="PHONENUMBERTextBox" runat="server" Text='<%# Bind("PHONENUMBER") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Address</label>
                            <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Created At</label>
                            <asp:TextBox ID="CREATEDATTextBox" runat="server" Text='<%# Bind("CREATEDAT") %>' />
                        </div>
                    </div>
                    <div class="mt-3">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert User" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </div>
                </InsertItemTemplate>

                <ItemTemplate>
                    <div class="row g-3">
                        <div class="col-md-4">
                            <label class="fv-label">User ID</label>
                            <asp:Label ID="USERIDLabel" runat="server" Text='<%# Eval("USERID") %>' CssClass="d-block" />
                        </div>
                        <div class="col-md-4">
                            <label class="fv-label">Username</label>
                            <asp:Label ID="USERNAMELabel" runat="server" Text='<%# Bind("USERNAME") %>' CssClass="d-block" />
                        </div>
                        <div class="col-md-4">
                            <label class="fv-label">Email</label>
                            <asp:Label ID="EMAILLabel" runat="server" Text='<%# Bind("EMAIL") %>' CssClass="d-block" />
                        </div>
                        <div class="col-md-4">
                            <label class="fv-label">Phone Number</label>
                            <asp:Label ID="PHONENUMBERLabel" runat="server" Text='<%# Bind("PHONENUMBER") %>' CssClass="d-block" />
                        </div>
                        <div class="col-md-4">
                            <label class="fv-label">Address</label>
                            <asp:Label ID="ADDRESSLabel" runat="server" Text='<%# Bind("ADDRESS") %>' CssClass="d-block" />
                        </div>
                        <div class="col-md-4">
                            <label class="fv-label">Created At</label>
                            <asp:Label ID="CREATEDATLabel" runat="server" Text='<%# Bind("CREATEDAT") %>' CssClass="d-block" />
                        </div>
                    </div>
                    <div class="mt-3">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="✏️ Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="🗑 Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="＋ New" />
                    </div>
                </ItemTemplate>

            </asp:FormView>

        </div>
    </div>

    <!-- Users Grid Card -->
    <div class="card">
        <div class="custom-card-header d-flex align-items-center justify-content-between">
            <span><i class="bi bi-table me-2 text-primary"></i>Users List</span>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">

                <asp:GridView ID="GridView1"
                    runat="server"
                    AutoGenerateColumns="False"
                    DataKeyNames="USERID"
                    DataSourceID="SqlDataSource2"
                    CssClass="table table-striped table-hover mb-0"
                    AllowPaging="True">



                    <Columns>
                        <asp:BoundField DataField="USERID"      HeaderText="User ID"     ReadOnly="True" SortExpression="USERID" />
                        <asp:BoundField DataField="USERNAME"    HeaderText="Username"    SortExpression="USERNAME" />
                        <asp:BoundField DataField="EMAIL"       HeaderText="Email"       SortExpression="EMAIL" />
                        <asp:BoundField DataField="PHONENUMBER" HeaderText="Phone"       SortExpression="PHONENUMBER" />
                        <asp:BoundField DataField="ADDRESS"     HeaderText="Address"     SortExpression="ADDRESS" />
                        <asp:BoundField DataField="CREATEDAT"   HeaderText="Created At"  SortExpression="CREATEDAT" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Actions" />
                    </Columns>

                </asp:GridView>

            </div>
        </div>
    </div>


    <!-- SQL DATASOURCE — completely untouched -->
    <asp:SqlDataSource ID="SqlDataSource2"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
        SelectCommand="SELECT * FROM &quot;USERS&quot;"
        DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USERID&quot; = :USERID"
        InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USERID&quot;, &quot;USERNAME&quot;, &quot;EMAIL&quot;, &quot;PHONENUMBER&quot;, &quot;ADDRESS&quot;, &quot;CREATEDAT&quot;) VALUES (:USERID, :USERNAME, :EMAIL, :PHONENUMBER, :ADDRESS, :CREATEDAT)"
        UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;USERNAME&quot; = :USERNAME, &quot;EMAIL&quot; = :EMAIL, &quot;PHONENUMBER&quot; = :PHONENUMBER, &quot;ADDRESS&quot; = :ADDRESS, &quot;CREATEDAT&quot; = :CREATEDAT WHERE &quot;USERID&quot; = :USERID">
        <DeleteParameters>
            <asp:Parameter Name="USERID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="USERID"      Type="Decimal" />
            <asp:Parameter Name="USERNAME"    Type="String" />
            <asp:Parameter Name="EMAIL"       Type="String" />
            <asp:Parameter Name="PHONENUMBER" Type="String" />
            <asp:Parameter Name="ADDRESS"     Type="String" />
            <asp:Parameter Name="CREATEDAT"   Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="USERNAME"    Type="String" />
            <asp:Parameter Name="EMAIL"       Type="String" />
            <asp:Parameter Name="PHONENUMBER" Type="String" />
            <asp:Parameter Name="ADDRESS"     Type="String" />
            <asp:Parameter Name="CREATEDAT"   Type="DateTime" />
            <asp:Parameter Name="USERID"      Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
