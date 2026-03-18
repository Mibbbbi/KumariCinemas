<%@ Page Title="Movie"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Movie.aspx.cs"
    Inherits="WebApplication1.Movie" %>

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
            <i class="bi bi-film fs-3"></i>
        </div>
        <div>
            <h4 class="mb-0 fw-bold">Movie Management</h4>
        </div>
    </div>

    <!-- Form Card -->
    <div class="card mb-4">
        <div class="card-header d-flex align-items-center gap-2">
            <i class="bi bi-camera-reels-fill text-primary"></i>
            Add New Movie
        </div>
        <div class="card-body p-4">

            <asp:FormView ID="FormView1" runat="server" DefaultMode="Insert" DataKeyNames="MOVIEID" DataSourceID="SqlDataSource1" Width="100%">

                <EditItemTemplate>
                    <div class="row g-3">
                        <div class="col-12">
                            <label class="fv-label">Movie ID</label>
                            <asp:Label ID="MOVIEIDLabel1" runat="server" Text='<%# Eval("MOVIEID") %>' CssClass="form-control bg-light" />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Title</label>
                            <asp:TextBox ID="TITLETextBox" runat="server" Text='<%# Bind("TITLE") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Duration</label>
                            <asp:TextBox ID="DURATIONTextBox" runat="server" Text='<%# Bind("DURATION") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Language</label>
                            <asp:TextBox ID="LANGUAGETextBox" runat="server" Text='<%# Bind("LANGUAGE") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Genre</label>
                            <asp:TextBox ID="GENRETextBox" runat="server" Text='<%# Bind("GENRE") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Release Date</label>
                            <asp:TextBox ID="RELEASEDATETextBox" runat="server" Text='<%# Bind("RELEASEDATE") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Rating</label>
                            <asp:TextBox ID="RATINGTextBox" runat="server" Text='<%# Bind("RATING") %>' />
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
                            <label class="fv-label">Movie ID</label>
                            <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Title</label>
                            <asp:TextBox ID="TITLETextBox" runat="server" Text='<%# Bind("TITLE") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Duration</label>
                            <asp:TextBox ID="DURATIONTextBox" runat="server" Text='<%# Bind("DURATION") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Language</label>
                            <asp:TextBox ID="LANGUAGETextBox" runat="server" Text='<%# Bind("LANGUAGE") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Genre</label>
                            <asp:TextBox ID="GENRETextBox" runat="server" Text='<%# Bind("GENRE") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Release Date</label>
                            <asp:TextBox ID="RELEASEDATETextBox" runat="server" Text='<%# Bind("RELEASEDATE") %>' />
                        </div>
                        <div class="col-md-6">
                            <label class="fv-label">Rating</label>
                            <asp:TextBox ID="RATINGTextBox" runat="server" Text='<%# Bind("RATING") %>' />
                        </div>
                    </div>
                    <div class="mt-3">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert Movie" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </div>
                </InsertItemTemplate>

                <ItemTemplate>
                    <div class="row g-3">
                        <div class="col-md-4">
                            <label class="fv-label">Movie ID</label>
                            <asp:Label ID="MOVIEIDLabel" runat="server" Text='<%# Eval("MOVIEID") %>' CssClass="d-block" />
                        </div>
                        <div class="col-md-4">
                            <label class="fv-label">Title</label>
                            <asp:Label ID="TITLELabel" runat="server" Text='<%# Bind("TITLE") %>' CssClass="d-block" />
                        </div>
                        <div class="col-md-4">
                            <label class="fv-label">Duration</label>
                            <asp:Label ID="DURATIONLabel" runat="server" Text='<%# Bind("DURATION") %>' CssClass="d-block" />
                        </div>
                        <div class="col-md-4">
                            <label class="fv-label">Language</label>
                            <asp:Label ID="LANGUAGELabel" runat="server" Text='<%# Bind("LANGUAGE") %>' CssClass="d-block" />
                        </div>
                        <div class="col-md-4">
                            <label class="fv-label">Genre</label>
                            <asp:Label ID="GENRELabel" runat="server" Text='<%# Bind("GENRE") %>' CssClass="d-block" />
                        </div>
                        <div class="col-md-4">
                            <label class="fv-label">Release Date</label>
                            <asp:Label ID="RELEASEDATELabel" runat="server" Text='<%# Bind("RELEASEDATE") %>' CssClass="d-block" />
                        </div>
                        <div class="col-md-4">
                            <label class="fv-label">Rating</label>
                            <asp:Label ID="RATINGLabel" runat="server" Text='<%# Bind("RATING") %>' CssClass="d-block" />
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
            <span><i class="bi bi-table me-2 text-primary"></i>Movies List</span>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">

                <asp:GridView ID="GridView1" runat="server"
                    AllowPaging="True"
                    AutoGenerateColumns="False"
                    DataKeyNames="MOVIEID"
                    DataSourceID="SqlDataSource1"
                    CssClass="table table-striped table-hover mb-0">



                    <Columns>
                        <asp:BoundField DataField="MOVIEID"     HeaderText="Movie ID"     ReadOnly="True" SortExpression="MOVIEID" />
                        <asp:BoundField DataField="TITLE"       HeaderText="Title"        SortExpression="TITLE" />
                        <asp:BoundField DataField="DURATION"    HeaderText="Duration"     SortExpression="DURATION" />
                        <asp:BoundField DataField="LANGUAGE"    HeaderText="Language"     SortExpression="LANGUAGE" />
                        <asp:BoundField DataField="GENRE"       HeaderText="Genre"        SortExpression="GENRE" />
                        <asp:BoundField DataField="RELEASEDATE" HeaderText="Release Date" SortExpression="RELEASEDATE" />
                        <asp:BoundField DataField="RATING"      HeaderText="Rating"       SortExpression="RATING" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Actions" />
                    </Columns>

                </asp:GridView>

            </div>
        </div>
    </div>


    <!-- SQL DATASOURCE — completely untouched -->
    <asp:SqlDataSource
        ID="SqlDataSource1"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
        SelectCommand='SELECT * FROM "MOVIE"'
        InsertCommand='INSERT INTO "MOVIE" ("MOVIEID", "TITLE", "DURATION", "LANGUAGE", "GENRE", "RELEASEDATE", "RATING") VALUES (:MOVIEID, :TITLE, :DURATION, :LANGUAGE, :GENRE, :RELEASEDATE, :RATING)'
        UpdateCommand='UPDATE "MOVIE" SET "TITLE" = :TITLE, "DURATION" = :DURATION, "LANGUAGE" = :LANGUAGE, "GENRE" = :GENRE, "RELEASEDATE" = :RELEASEDATE, "RATING" = :RATING WHERE "MOVIEID" = :MOVIEID'
        DeleteCommand='DELETE FROM "MOVIE" WHERE "MOVIEID" = :MOVIEID'>

        <InsertParameters>
            <asp:Parameter Name="MOVIEID"     Type="Decimal" />
            <asp:Parameter Name="TITLE"       Type="String" />
            <asp:Parameter Name="DURATION"    Type="Decimal" />
            <asp:Parameter Name="LANGUAGE"    Type="String" />
            <asp:Parameter Name="GENRE"       Type="String" />
            <asp:Parameter Name="RELEASEDATE" Type="DateTime" />
            <asp:Parameter Name="RATING"      Type="String" />
        </InsertParameters>

        <UpdateParameters>
            <asp:Parameter Name="TITLE"       Type="String" />
            <asp:Parameter Name="DURATION"    Type="Decimal" />
            <asp:Parameter Name="LANGUAGE"    Type="String" />
            <asp:Parameter Name="GENRE"       Type="String" />
            <asp:Parameter Name="RELEASEDATE" Type="DateTime" />
            <asp:Parameter Name="RATING"      Type="String" />
            <asp:Parameter Name="MOVIEID"     Type="Decimal" />
        </UpdateParameters>

        <DeleteParameters>
            <asp:Parameter Name="MOVIEID" Type="Decimal" />
        </DeleteParameters>

    </asp:SqlDataSource>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
