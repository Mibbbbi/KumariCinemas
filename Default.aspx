<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

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
        margin-bottom: 28px;
    }

    .stat-card {
        background: #fff;
        border: none;
        border-radius: 12px;
        padding: 22px 24px;
        box-shadow: 0 2px 12px rgba(0,0,0,0.07);
        display: flex;
        align-items: center;
        gap: 18px;
        transition: transform .15s, box-shadow .15s;
        height: 100%;
    }
    .stat-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 20px rgba(0,0,0,0.11);
    }
    .stat-icon {
        width: 56px;
        height: 56px;
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 24px;
        flex-shrink: 0;
    }
    .stat-label {
        font-size: 12px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: .05em;
        color: #6c757d;
        margin-bottom: 4px;
    }
    .stat-value {
        font-size: 32px;
        font-weight: 800;
        color: #1a1d2e;
        line-height: 1;
    }

    /* Strip FormView table wrapper */
    .stat-value table, .stat-value tr, .stat-value td {
        display: inline !important;
        border: none !important;
        padding: 0 !important;
    }

    .card {
        border: none;
        border-radius: 12px;
        box-shadow: 0 2px 12px rgba(0,0,0,0.07);
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

    .chart-wrap {
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 16px;
    }
</style>

<div class="container-lg py-4">

    <!-- Page Header -->
    <div class="page-header d-flex align-items-center gap-3 mb-4">
        <div class="bg-white bg-opacity-25 rounded-3 p-2">
            <i class="bi bi-speedometer2 fs-3"></i>
        </div>
        <div>
            <h4 class="mb-0 fw-bold">Dashboard</h4>
            <small class="opacity-75">Cinema management overview</small>
        </div>
        <div class="ms-auto text-end">
            <small class="opacity-75">Last updated</small><br />
            <strong><%= DateTime.Now.ToString("dd MMM yyyy, HH:mm") %></strong>
        </div>
    </div>

    <!-- Stat Cards -->
    <div class="row g-3 mb-4">

        <div class="col-md-4">
            <div class="stat-card">
                <div class="stat-icon" style="background:#fce7f3;">
                    <i class="bi bi-film" style="color:#db2777;"></i>
                </div>
                <div>
                    <div class="stat-label">Total Movies</div>
                    <div class="stat-value">
                        <asp:FormView ID="fvMovies" runat="server" DataSourceID="dsCountMovies">
                            <ItemTemplate><%# Eval("TOTAL") %></ItemTemplate>
                        </asp:FormView>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="stat-card">
                <div class="stat-icon" style="background:#dbeafe;">
                    <i class="bi bi-people-fill" style="color:#2d6a9f;"></i>
                </div>
                <div>
                    <div class="stat-label">Total Users</div>
                    <div class="stat-value">
                        <asp:FormView ID="fvUsers" runat="server" DataSourceID="dsCountUsers">
                            <ItemTemplate><%# Eval("TOTAL") %></ItemTemplate>
                        </asp:FormView>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="stat-card">
                <div class="stat-icon" style="background:#d1fae5;">
                    <i class="bi bi-building" style="color:#059669;"></i>
                </div>
                <div>
                    <div class="stat-label">Theatre Halls</div>
                    <div class="stat-value">
                        <asp:FormView ID="fvTheaters" runat="server" DataSourceID="dsCountTheaters">
                            <ItemTemplate><%# Eval("TOTAL") %></ItemTemplate>
                        </asp:FormView>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Charts -->
    <div class="row g-4">

        <div class="col-12">
            <div class="card">
                <div class="custom-card-header d-flex align-items-center gap-2">
                    <i class="bi bi-bar-chart-fill text-primary"></i>
                    Paid vs Cancelled Tickets per Show
                </div>
                <div class="chart-wrap">
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="dsTicketSales"
                        Height="450px" Width="960px"
                        BackColor="Transparent">
                        <series>
                            <asp:Series ChartType="Column" Name="Paid"
                                XValueMember="SHOW_LABEL" YValueMembers="PAID_COUNT"
                                IsValueShownAsLabel="false"
                                Color="16, 185, 129" LegendText="Paid">
                            </asp:Series>
                            <asp:Series ChartType="Column" Name="Cancelled"
                                XValueMember="SHOW_LABEL" YValueMembers="CANCELLED_COUNT"
                                IsValueShownAsLabel="false"
                                Color="220, 53, 69" LegendText="Cancelled">
                            </asp:Series>
                        </series>
                        <chartareas>
                            <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                                <AxisX Title="Movie / Show" Interval="1" IsMarginVisible="True">
                                    <LabelStyle Font="Segoe UI, 9pt" ForeColor="60, 60, 60"
                                        Angle="-30" />
                                    <MajorGrid LineColor="230, 230, 230" />
                                </AxisX>
                                <AxisY Title="Ticket Count">
                                    <LabelStyle Font="Segoe UI, 9pt" ForeColor="60, 60, 60" />
                                    <MajorGrid LineColor="230, 230, 230" />
                                </AxisY>
                            </asp:ChartArea>
                        </chartareas>
                        <Legends>
                            <asp:Legend Name="Legend1" Docking="Bottom" Alignment="Center"
                                BackColor="Transparent" Font="Segoe UI, 11pt">
                            </asp:Legend>
                        </Legends>
                    </asp:Chart>
                </div>
            </div>
        </div>

    </div>

    <!-- Pie Chart Row -->
    <div class="row g-4 mt-2">

        <div class="col-lg-6 mx-auto">
            <div class="card">
                <div class="custom-card-header d-flex align-items-center gap-2">
                    <i class="bi bi-pie-chart-fill text-primary"></i>
                    Movies Hosted per Hall
                </div>
                <div class="chart-wrap">
                    <asp:Chart ID="Chart2" runat="server" DataSourceID="dsHallMovies"
                        Height="400px" Width="480px" Palette="Pastel"
                        BackColor="Transparent">
                        <series>
                            <asp:Series ChartType="Pie" Name="Series1"
                                XValueMember="HALLNAME" YValueMembers="MOVIE_COUNT"
                                IsValueShownAsLabel="true" Legend="Legend1"
                                Font="Segoe UI, 11pt, style=Bold"
                                LabelForeColor="50, 50, 50"
                                LabelBackColor="Transparent">
                            </asp:Series>
                        </series>
                        <chartareas>
                            <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                            </asp:ChartArea>
                        </chartareas>
                        <Legends>
                            <asp:Legend Name="Legend1" Docking="Bottom" Alignment="Center"
                                BackColor="Transparent" Font="Segoe UI, 12pt">
                            </asp:Legend>
                        </Legends>
                    </asp:Chart>
                </div>
            </div>
        </div>

    </div>

    <!-- ── SQL DataSources — ProviderName added to all ── -->
    <asp:SqlDataSource ID="dsCountMovies" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
        SelectCommand="SELECT COUNT(*) AS TOTAL FROM &quot;MOVIE&quot;">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsCountUsers" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
        SelectCommand="SELECT COUNT(*) AS TOTAL FROM &quot;USERS&quot;">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsCountTheaters" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
        SelectCommand="SELECT COUNT(*) AS TOTAL FROM &quot;THEATERHALL&quot;">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsTicketSales" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
        SelectCommand="SELECT t.&quot;SHOWID&quot;, m.&quot;TITLE&quot; || ' (Show ' || t.&quot;SHOWID&quot; || ')' AS SHOW_LABEL, SUM(CASE WHEN UPPER(t.&quot;STATUS&quot;) = 'PAID' THEN 1 ELSE 0 END) AS PAID_COUNT, SUM(CASE WHEN UPPER(t.&quot;STATUS&quot;) = 'CANCELLED' THEN 1 ELSE 0 END) AS CANCELLED_COUNT FROM &quot;TICKET&quot; t JOIN &quot;SHOWS&quot; s ON t.&quot;SHOWID&quot; = s.&quot;SHOWID&quot; JOIN &quot;MOVIE&quot; m ON s.&quot;MOVIEID&quot; = m.&quot;MOVIEID&quot; GROUP BY t.&quot;SHOWID&quot;, m.&quot;TITLE&quot; ORDER BY t.&quot;SHOWID&quot;">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsHallMovies" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
        SelectCommand="SELECT h.HALLNAME, COUNT(s.MOVIEID) AS MOVIE_COUNT FROM &quot;SHOWS&quot; s JOIN &quot;THEATERHALL&quot; h ON s.HALLID = h.HALLID GROUP BY h.HALLNAME">
    </asp:SqlDataSource>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
