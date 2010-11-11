﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<AnchorModel>>" %>
<%@ Import Namespace="AdminMvc.Models"%>
<%@ Import Namespace="MvcContrib.UI.Pager"%>
<%@ Import Namespace="MvcContrib.Pagination"%>
<%@ Import Namespace="MvcContrib.UI.Grid"%>
<%@ Import Namespace="AdminMvc.Controllers"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Anchors
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% if (ViewData["Domain"] != null) { %>
        <%= Html.Partial("FilterReminder", "anchors") %>
        <div class="action-bar clear">
            <%= Html.ActionLink("Add Anchor", "Add", new { owner = ((DomainModel)ViewData["Domain"]).Name }, new { @class = "action ui-priority-primary" })%>
        </div>
    <% } else { %>
        <%= Html.Partial("AllItemsReminder", "anchors") %>
    <% } %>
    
    <%= Html.Partial("AnchorList", Model, ViewData) %>
    <%= Html.Partial("AnchorDetailsDialog") %>

</asp:Content>
