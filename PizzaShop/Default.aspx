<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PizzaShop.Default" %>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="userInput" runat="server">
            <p>Please enter your name: <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox></p>
            <p>Please enter your address: <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox></p>
            <p>Please enter your phone number: <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></p>
        </div>

        <div id="userDataOutput" runat="server">
            <asp:Label ID="lblUserName" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblAddress" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblPhone" runat="server"></asp:Label>
        </div>
        <div id="pickupOrDeliv" runat="server">
            <p><b>Please select pickup or delivery:</b></p>
            <p>
                <asp:RadioButtonList ID="rdoPickup" runat="server">
                    <asp:ListItem>Delivery</asp:ListItem>
                    <asp:ListItem>Pickup</asp:ListItem>
                </asp:RadioButtonList>

            </p>
        </div>

        <h3>
            <asp:Label ID="lblHint" runat="server" Text="Please select at least one pizza."></asp:Label>
        </h3>

        <div>
            <asp:GridView ID="gvInput" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="Select">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbSelect" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="PizzaType" HeaderText="Pizza Type" />
                    <asp:TemplateField HeaderText="Size">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlSize" runat="server">
                                <asp:ListItem>Small</asp:ListItem>
                                <asp:ListItem>Medium</asp:ListItem>
                                <asp:ListItem>Large</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div> 
        
        <div>
            <asp:GridView ID="gvOutput" runat="server" AutoGenerateColumns="False" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="PizzaType" HeaderText="PizzaType" />
                    <asp:BoundField DataField="Size" HeaderText="Size" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="Price" DataFormatString="{0:C}" HeaderText="Price" />
                    <asp:BoundField DataField="TotalCost" DataFormatString="{0:C}" HeaderText="Total Cost" />
                </Columns>
            </asp:GridView>
        </div>

        <div>
            <asp:GridView ID="gvTotalSales" runat="server" AutoGenerateColumns="False"></asp:GridView>
        </div>

        <div>
            <asp:GridView ID="gvTotalQty" runat="server" AutoGenerateColumns="False"></asp:GridView>
        </div>

        <div>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        </div>

        <div>
            <asp:Button ID="btnReport" runat="server" Text="Get Report" OnClick="btnReport_Click" style="height: 26px" />
        </div>
    </form>
</body>
</html>--%>



<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous"/>

    <title>Pizza Perfect</title>

      <style>
          #form1{
              padding: 100px;
              
          }

          #background{
              background-color:#FF1736;
              height:100%;
          }

          #header{
              text-align:center;
              background-color: #F7F7F7;
          }

          .table-condensed{
              color: white;
              border: 0px solid;
          }

          tr:nth-child(even) {
            background: white;
            color: black;
          }

          tr:nth-child(odd) {
            background: gray;
            color: black;
          }

      </style>
  </head>
  <body>

      <%--<form>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Email address</label>
            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Password</label>
            <input type="password" class="form-control" id="exampleInputPassword1">
        </div>
        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" id="exampleCheck1">
            <label class="form-check-label" for="exampleCheck1">Check me out</label>
        </div>
    <%--<button type="submit" class="btn btn-primary">Submit</button>
    </form>--%>

    <div id="header" class="mx-auto" style="width: 100%;">
        <img src="/images/logo.jpg" alt="Pizza Perfect Logo" width="300" height="300"/> 
    </div>

    <div id="background">
        <div id="formSection">
            <form id="form1" runat="server">
                <div id="userInput" runat="server" cssclass="mb-3">
                    <p class="form-label h5">Please enter your name: <asp:TextBox ID="txtUsername" runat="server"  cssclass="form-control"></asp:TextBox></p>
                    <p class="form-label h5">Please enter your address: <asp:TextBox ID="txtAddress" runat="server"  cssclass="form-control"></asp:TextBox></p>
                    <p class="form-label h5">Please enter your phone number: <asp:TextBox ID="txtPhone" runat="server"  cssclass="form-control"></asp:TextBox></p>
                </div>

                <div id="userDataOutput" runat="server">
                    <asp:Label ID="lblUserName" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="lblAddress" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="lblPhone" runat="server"></asp:Label>
                </div>
                <div id="pickupOrDeliv" runat="server">
                    <p><b class="form-label h5">Please select pickup or delivery:</b></p>
                    <p>
                        <asp:RadioButtonList ID="rdoPickup" runat="server" CssClass="form-check">
                            <asp:ListItem>Delivery</asp:ListItem>
                            <asp:ListItem>Pickup</asp:ListItem>
                        </asp:RadioButtonList>

                    </p>
                </div>

                <h3>
                    <asp:Label ID="lblHint" runat="server" Text="Please select at least one pizza." ></asp:Label>
                </h3>

                <div>
                    <asp:GridView ID="gvInput" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-hover">
                        <Columns>
                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbSelect" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="PizzaType" HeaderText="Pizza Type" />
                            <asp:TemplateField HeaderText="Size">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlSize" runat="server">
                                        <asp:ListItem>Small</asp:ListItem>
                                        <asp:ListItem>Medium</asp:ListItem>
                                        <asp:ListItem>Large</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div> 
        
                <div>
                    <asp:GridView ID="gvOutput" runat="server" AutoGenerateColumns="False" ShowFooter="True">
                        <Columns>
                            <asp:BoundField DataField="PizzaType" HeaderText="PizzaType" />
                            <asp:BoundField DataField="Size" HeaderText="Size" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                            <asp:BoundField DataField="Price" DataFormatString="{0:C}" HeaderText="Price" />
                            <asp:BoundField DataField="TotalCost" DataFormatString="{0:C}" HeaderText="Total Cost" />
                        </Columns>
                    </asp:GridView>
                </div>

                <div>
                    <asp:GridView ID="gvTotalSales" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-hover">
                        <Columns>
                            <asp:BoundField DataField="PizzaType" HeaderText="Pizza Type" />
                            <asp:BoundField DataField="TotalSales" DataFormatString="{0:c}" HeaderText="Total Sales" />
                           
                        </Columns>
                    </asp:GridView>
                </div>

                <div>
                    <asp:GridView ID="gvTotalQty" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-hover">
                        <Columns>
                            <asp:BoundField DataField="PizzaType" HeaderText="Pizza Type" />
                            <asp:BoundField DataField="TotaQuantityOrdered" HeaderText="Total Quantity Ordered" />
                        </Columns>
                    </asp:GridView>
                </div>
                <br />
                <div>
                    <asp:Button ID="btnSubmit" runat="server" class="btn btn-dark" Text="Submit" OnClick="btnSubmit_Click" />
                </div>
                <br />
                <div>
                    <asp:Button ID="btnSalesReport" runat="server"  class="btn btn-dark" Text="Get Sales Report" OnClick="btnSalesReport_Click" />
                </div>
                <br />
                <div>
                    <asp:Button ID="btnQuantityReport" runat="server" class="btn btn-dark" Text="Get Quantity Report" OnClick="btnQuantityReport_Click" />
                </div>
            </form>
        </div>
    </div>
</body>
</html>
