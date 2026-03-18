<%@ Page Title="Show" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="WebApplication1.Show" %>

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

    .card-header {
        background: #fff;
        border-bottom: 2px solid #e9ecef;
        border-radius: 12px 12px 0 0 !important;
        padding: 16px 24px;
        font-weight: 600;
        font-size: 15px;
        color: #1e3a5f;
    }

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
        background: #2d6a9f; color: #fff;
    }
    #FormView1 a[id*="InsertButton"]:hover,
    #FormView1 a[id*="UpdateButton"]:hover {
        background: #1e3a5f; color: #fff;
    }

    #FormView1 a[id*="CancelButton"] {
        background: #e9ecef; color: #495057;
    }
    #FormView1 a[id*="CancelButton"]:hover {
        background: #ced4da; color: #212529;
    }

    #FormView1 a[id*="EditButton"] {
        background: #e7f1fb; color: #2d6a9f;
        border: 1px solid #b6d4f0;
    }
    #FormView1 a[id*="EditButton"]:hover { background: #2d6a9f; color: #fff; }

    #FormView1 a[id*="DeleteButton"] {
        background: #fdecea; color: #dc3545;
        border: 1px solid #f5c2c7;
    }
    #FormView1 a[id*="DeleteButton"]:hover { background: #dc3545; color: #fff; }

    #FormView1 a[id*="NewButton"] {
        background: #e8f8f0; color: #198754;
        border: 1px solid #b2dfcc;
    }
    #FormView1 a[id*="NewButton"]:hover { background: #198754; color: #fff; }

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
        background: #e7f1fb; color: #2d6a9f;
    }
    .table td:last-child a:first-child:hover {
        background: #2d6a9f; color: #fff;
    }

    .table td:last-child a:last-child {
        background: #fdecea; color: #dc3545;
    }
    .table td:last-child a:last-child:hover {
        background: #dc3545; color: #fff;
    }

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
        width: 32px; height: 32px;
        border-radius: 8px;
        font-size: 13px;
        font-weight: 600;
        text-decoration: none;
        margin: 0 2px;
    }
    .table tfoot a {
        background: #fff; color: #2d6a9f;
        border: 1.5px solid #dee2e6;
    }
    .table tfoot a:hover {
        background: #2d6a9f; color: #fff;
        border-color: #2d6a9f;
    }
    .table tfoot span {
        background: #2d6a9f; color: #fff;
        border: 1.5px solid #2d6a9f;
    }
</style>

<div class="container-lg py-4">

    <!-- Page Header -->
    <div class="page-header d-flex align-items-center gap-3 mb-4">
        <div class="bg-white bg-opacity-25 rounded-3 p-2">
            <i class="bi bi-play-circle-fill fs-3"></i>
        </div>
        <div>
            <h4 class="mb-0 fw-bold">Show Management</h4>
        </div>
    </div>

    <!-- Form Card -->
    <div class="card mb-4">
        <div class="card-header d-flex align-items-center gap-2">
            <i class="bi bi-calendar-plus-fill text-primary"></i>
            Add Show Info
        </div>
        <div class="card-body p-4">

            <asp:FormView ID="FormView1" runat="server" DefaultMode="Insert" DataKeyNames="SHOWID" DataSourceID="SqlDataSource1" Width="100%">

                <EditItemTemplate>
                    <div class="row g-3">
                        <div class="col-12">
                            <label class="fv-label">Show ID</label>
                            <asp:Label ID="SHOWIDLabel1" runat="server" Text='<%# Eval("SHOWID") %>' CssClass="form-control bg-light" />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Movie ID</label>
                            <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Hall ID</label>
                            <asp:TextBox ID="HALLIDTextBox" runat="server" Text='<%# Bind("HALLID") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Show Date</label>
                            <asp:TextBox ID="SHOWDATETextBox" runat="server" Text='<%# Bind("SHOWDATE") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Show Time</label>
                            <asp:TextBox ID="SHOWTIMETextBox" runat="server" Text='<%# Bind("SHOWTIME") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Ticket Price</label>
                            <asp:TextBox ID="TICKETPRICETextBox" runat="server" Text='<%# Bind("TICKETPRICE") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Available Seats</label>
                            <asp:TextBox ID="AVAILABLESEATSTextBox" runat="server" Text='<%# Bind("AVAILABLESEATS") %>' />
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
                            <label class="fv-label">Show ID</label>
                            <asp:TextBox ID="SHOWIDTextBox" runat="server" Text='<%# Bind("SHOWID") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Movie ID</label>
                            <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Hall ID</label>
                            <asp:TextBox ID="HALLIDTextBox" runat="server" Text='<%# Bind("HALLID") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Show Date</label>
                            <asp:TextBox ID="SHOWDATETextBox" runat="server" Text='<%# Bind("SHOWDATE") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Show Time</label>
                            <asp:TextBox ID="SHOWTIMETextBox" runat="server" Text='<%# Bind("SHOWTIME") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Ticket Price</label>
                            <asp:TextBox ID="TICKETPRICETextBox" runat="server" Text='<%# Bind("TICKETPRICE") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Available Seats</label>
                            <asp:TextBox ID="AVAILABLESEATSTextBox" runat="server" Text='<%# Bind("AVAILABLESEATS") %>' />
                        </div>
                    </div>
                    <div class="mt-3">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert Show" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </div>
                </InsertItemTemplate>

                <ItemTemplate>
                    <div class="row g-3">
                        <div class="col-md-4">
                            <label class="fv-label">Show ID</label>
                            <asp:Label ID="SHOWIDLabel" runat="server" Text='<%# Eval("SHOWID") %>' CssClass="d-block" />
                        </div>
                        <div class="col-md-4">
                            <label class="fv-label">Movie ID</label>
                            <asp:Label ID="MOVIEIDLabel" runat="server" Text='<%# Bind("MOVIEID") %>' CssClass="d-block" />
                        </div>
                        <div class="col-md-4">
                            <label class="fv-label">Hall ID</label>
                            <asp:Label ID="HALLIDLabel" runat="server" Text='<%# Bind("HALLID") %>' CssClass="d-block" />
                        </div>
                        <div class="col-md-4">
                            <label class="fv-label">Show Date</label>
                            <asp:Label ID="SHOWDATELabel" runat="server" Text='<%# Bind("SHOWDATE") %>' CssClass="d-block" />
                        </div>
                        <div class="col-md-4">
                            <label class="fv-label">Show Time</label>
                            <asp:Label ID="SHOWTIMELabel" runat="server" Text='<%# Bind("SHOWTIME") %>' CssClass="d-block" />
                        </div>
                        <div class="col-md-4">
                            <label class="fv-label">Ticket Price</label>
                            <asp:Label ID="TICKETPRICELabel" runat="server" Text='<%# Bind("TICKETPRICE") %>' CssClass="d-block" />
                        </div>
                        <div class="col-md-4">
                            <label class="fv-label">Available Seats</label>
                            <asp:Label ID="AVAILABLESEATSLabel" runat="server" Text='<%# Bind("AVAILABLESEATS") %>' CssClass="d-block" />
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

    <!-- Grid Card -->
    <div class="card">
        <div class="card-header d-flex align-items-center justify-content-between">
            <span><i class="bi bi-table me-2 text-primary"></i>Shows List</span>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">

                <asp:GridView ID="GridView1" runat="server"
                    AutoGenerateColumns="False"
                    DataKeyNames="SHOWID"
                    DataSourceID="SqlDataSource1"
                    CssClass="table table-hover mb-0" AllowPaging="True">

                    <Columns>
                        <asp:BoundField DataField="SHOWID"          HeaderText="Show ID"         ReadOnly="True" SortExpression="SHOWID" />
                        <asp:BoundField DataField="MOVIEID"         HeaderText="Movie ID"        SortExpression="MOVIEID" />
                        <asp:BoundField DataField="HALLID"          HeaderText="Hall ID"         SortExpression="HALLID" />
                        <asp:BoundField DataField="SHOWDATE"        HeaderText="Show Date"       SortExpression="SHOWDATE" />
                        <asp:BoundField DataField="SHOWTIME"        HeaderText="Show Time"       SortExpression="SHOWTIME" />
                        <asp:BoundField DataField="TICKETPRICE"     HeaderText="Ticket Price"    SortExpression="TICKETPRICE" />
                        <asp:BoundField DataField="AVAILABLESEATS"  HeaderText="Avail. Seats"    SortExpression="AVAILABLESEATS" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Actions" />
                    </Columns>

                </asp:GridView>

            </div>
        </div>
    </div>

    <!-- SQL DATASOURCE — completely untouched -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
        SelectCommand="SELECT * FROM &quot;SHOWS&quot;"
        DeleteCommand="DELETE FROM &quot;SHOWS&quot; WHERE &quot;SHOWID&quot; = :SHOWID"
        InsertCommand="INSERT INTO &quot;SHOWS&quot; (&quot;SHOWID&quot;, &quot;MOVIEID&quot;, &quot;HALLID&quot;, &quot;SHOWDATE&quot;, &quot;SHOWTIME&quot;, &quot;TICKETPRICE&quot;, &quot;AVAILABLESEATS&quot;) VALUES (:SHOWID, :MOVIEID, :HALLID, :SHOWDATE, :SHOWTIME, :TICKETPRICE, :AVAILABLESEATS)"
        UpdateCommand="UPDATE &quot;SHOWS&quot; SET &quot;MOVIEID&quot; = :MOVIEID, &quot;HALLID&quot; = :HALLID, &quot;SHOWDATE&quot; = :SHOWDATE, &quot;SHOWTIME&quot; = :SHOWTIME, &quot;TICKETPRICE&quot; = :TICKETPRICE, &quot;AVAILABLESEATS&quot; = :AVAILABLESEATS WHERE &quot;SHOWID&quot; = :SHOWID">
        <DeleteParameters>
            <asp:Parameter Name="SHOWID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SHOWID"         Type="Decimal" />
            <asp:Parameter Name="MOVIEID"        Type="Decimal" />
            <asp:Parameter Name="HALLID"         Type="Decimal" />
            <asp:Parameter Name="SHOWDATE"       Type="DateTime" />
            <asp:Parameter Name="SHOWTIME"       Type="String" />
            <asp:Parameter Name="TICKETPRICE"    Type="Decimal" />
            <asp:Parameter Name="AVAILABLESEATS" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MOVIEID"        Type="Decimal" />
            <asp:Parameter Name="HALLID"         Type="Decimal" />
            <asp:Parameter Name="SHOWDATE"       Type="DateTime" />
            <asp:Parameter Name="SHOWTIME"       Type="String" />
            <asp:Parameter Name="TICKETPRICE"    Type="Decimal" />
            <asp:Parameter Name="AVAILABLESEATS" Type="Decimal" />
            <asp:Parameter Name="SHOWID"         Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
