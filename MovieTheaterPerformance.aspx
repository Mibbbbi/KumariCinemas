<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="MovieTheaterPerformance.aspx.cs" Inherits="WebApplication1.MovieTheaterPerformance" %>

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

    .filter-label {
        font-size: 12px;
        font-weight: 600;
        color: #6c757d;
        text-transform: uppercase;
        letter-spacing: .04em;
        display: block;
        margin-bottom: 6px;
    }

    #DropDownList1 {
        padding: 9px 14px;
        border: 1.5px solid #dee2e6;
        border-radius: 8px;
        font-size: 14px;
        background: #f8f9fa;
        color: #343a40;
        min-width: 260px;
        transition: border-color .2s, box-shadow .2s;
        outline: none;
        appearance: auto;
    }

    #DropDownList1:focus {
        border-color: #2d6a9f;
        box-shadow: 0 0 0 3px rgba(45,106,159,0.15);
        background: #fff;
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
            <i class="bi bi-bar-chart-fill fs-3"></i>
        </div>
        <div>
            <h4 class="mb-0 fw-bold">Movie Theater Performance</h4>
        </div>
    </div>

    <!-- Filter Card -->
    <div class="card mb-4">
        <div class="custom-card-header d-flex align-items-center gap-2">
            <i class="bi bi-funnel-fill text-primary"></i>
            Filter by Movie
        </div>
        <div class="card-body p-4">
            <label class="filter-label">Select Movie</label>
            <asp:DropDownList ID="DropDownList1" runat="server"
                AutoPostBack="True"
                DataSourceID="SqlDataSource1"
                DataTextField="TITLE"
                DataValueField="MOVIEID">
            </asp:DropDownList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
                SelectCommand="SELECT * FROM &quot;MOVIE&quot;">
            </asp:SqlDataSource>
        </div>
    </div>

    <!-- Results Grid Card -->
    <div class="card">
        <div class="custom-card-header d-flex align-items-center justify-content-between">
            <span><i class="bi bi-trophy-fill me-2 text-warning"></i>Top 3 Theaters by Occupancy</span>
            <span class="badge bg-primary rounded-pill">Results</span>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">

                <asp:GridView ID="GridView1" runat="server"
                    AllowPaging="True"
                    DataSourceID="SqlDataSource2"
                    CssClass="table table-hover mb-0">
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
                    ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
                    SelectCommand="SELECT *
FROM
(
    SELECT 
        th.TheaterName,
        th.HallName,
        th.Location AS City,
        th.HallCapacity,
        COUNT(t.TicketID) AS PaidTickets,
        ROUND(
            (COUNT(t.TicketID) / th.HallCapacity) * 100,
            2
        ) AS OccupancyPercentage
    FROM Shows s
    JOIN TheaterHall th 
        ON s.HallID = th.HallID
    LEFT JOIN Ticket t 
        ON s.ShowID = t.ShowID
        AND UPPER(t.Status) = 'PAID'
    WHERE s.MovieID = :MovieID
    GROUP BY 
        th.TheaterName,
        th.HallName,
        th.Location,
        th.HallCapacity
    ORDER BY 
        ROUND((COUNT(t.TicketID) / th.HallCapacity) * 100, 2) DESC
)
WHERE ROWNUM &lt;= 3">
                    <SelectParameters>
                        <asp:ControlParameter
                            ControlID="DropDownList1"
                            Name="MovieID"
                            PropertyName="SelectedValue"
                            DefaultValue="0" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
