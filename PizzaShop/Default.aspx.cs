using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Utilities;
using PizzaLibrary;
using System.Data;
using System.Collections;

namespace PizzaShop
{
    public partial class Default : System.Web.UI.Page
    {
        DBConnect dbConnect = new DBConnect();
       

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowInput(true);
                ShowOutput(false);
                displayInputData();
                
            }
        }

        public void ShowInput(Boolean tf)
        {
            lblHint.Visible = tf;
            gvInput.Visible = tf;
        }

        public void ShowOutput(Boolean tf)
        {
            gvOutput.Visible = tf;
            userDataOutput.Visible = tf;
        }

        //need two more for reports

        public void displayInputData()
        {
            String str = "SELECT * FROM Pizza";
            DataSet myData = dbConnect.GetDataSet(str);

            gvInput.DataSource = myData;
            gvInput.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //store data for checking if filled in
            
            String username = txtUsername.Text;
            String address = txtAddress.Text;
            String phone = txtPhone.Text;
            if(!validateOrder(username, address, phone))
            {
                Response.Write("<alert>All fields must be completed!</alert>");
            }
            else {
                ArrayList arrPizza = new ArrayList();



                for (int row = 0; row < gvInput.Rows.Count; row++)
                {
                    //initialize new pizza variable
                    Pizza newPizza = new Pizza();
                    string pizzaType;
                    string size;
                    int quantity;
                    double price;


                    //see if pizza is selected
                    CheckBox cbox;
                    cbox = (CheckBox)gvInput.Rows[row].FindControl("cbSelect");

                    if (cbox.Checked)
                    {
                       
                        //Get Type
                        pizzaType = gvInput.Rows[row].Cells[1].Text;

                        //Get Size
                        DropDownList ddlSize = (DropDownList)gvInput.Rows[row].FindControl("ddlSize");
                        size = ddlSize.Text;  
                        
                        //Quantity
                        TextBox txtQuantity = (TextBox)gvInput.Rows[row].FindControl("txtQuantity");
                        quantity = Int32.Parse(txtQuantity.Text);

                        //initialize calculations class
                        Order calc = new Order();
                        //get price of current selection
                        price = calc.getPrice(pizzaType, size);


                        //add data to pizza variable and then add to arraylist
                        newPizza.PizzaType = pizzaType;
                        newPizza.Size = size;
                        newPizza.Quantity = quantity;
                        newPizza.Price = price;
                        newPizza.TotalCost = price * quantity;
                        calc.updateTotalQuantityAndSales(pizzaType, quantity, price);
                        arrPizza.Add(newPizza);
                        
                    }
                    

                }

                //get user input data and display the order info
                userInput.Visible = false;
                pickupOrDeliv.Visible = false;
                userDataOutput.Visible = true;
                lblHint.Text = "Your order:";
                lblUserName.Text = username;
                lblAddress.Text = address;
                lblPhone.Text = phone;




                //bind arrayList as datasource for output gridview and add footer data
                gvOutput.DataSource = arrPizza;
                gvOutput.DataBind();

                int totalQuantity = 0;
                double finalCost = 0;

                //for loop to iterate through the gridview and calculate totals for footer data
                for (int i = 0; i < arrPizza.Count; i++)
                {
                    totalQuantity = totalQuantity + int.Parse(gvOutput.Rows[i].Cells[2].Text);
                    finalCost = finalCost + double.Parse(gvOutput.Rows[i].Cells[4].Text, System.Globalization.NumberStyles.Currency);

                }

                //add footers
                gvOutput.Columns[0].FooterText = "Total: ";
                gvOutput.Columns[2].FooterText = Convert.ToString(totalQuantity);
                gvOutput.Columns[4].FooterText = finalCost.ToString("C2");
                gvOutput.DataBind();

                gvInput.Visible = false;
                btnSubmit.Visible = false;
                gvOutput.Visible = true;

            }
        }

        public Boolean validateOrder(String username, String address, String phone)
        {
            Boolean isGVValid = validateGridView();

            Boolean orderValid = false;
            if (username == "" || address == "" || phone == "")
            {
                orderValid = false;
            }
            else if (rdoPickup.SelectedValue == "")
            {
                orderValid = false;
            }
            else if (isGVValid == false)
            {
                orderValid = false;
            }

            return orderValid;
        }


        public Boolean validateGridView()
        {
            Boolean isSelected = false;
            Boolean hasQuantity = false;
            CheckBox cbox;
            TextBox txtQuantity;
            String quantity;
            


            for (int row = 0; row < gvInput.Rows.Count; row++)
            {
                
                cbox = (CheckBox)gvInput.Rows[row].FindControl("cbSelect");
                txtQuantity = (TextBox)gvInput.Rows[row].FindControl("txtQuantity");
                quantity = txtQuantity.ToString();

                if (cbox.Checked)
                {
                    isSelected = true;
                }

                if(quantity != "")
                {
                    hasQuantity = true;
                }


            }

            if(isSelected && hasQuantity == true)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        }

        protected void btnReport_Click(object sender, EventArgs e)
        {
            lblHint.Visible = false;
            userInput.Visible = false;
            pickupOrDeliv.Visible = false;
            btnSubmit.Visible = false;
            gvInput.Visible = false;
            gvOutput.Visible = false;
            gvTotalSales.Visible = true;

            DBConnect dbObj = new DBConnect();
            string sqlStatement = "SELECT * FROM Pizza";
            DataSet reportData = dbObj.GetDataSet(sqlStatement);

            gvTotalSales.DataSource = reportData;
            gvTotalSales.DataBind();


        }

        protected void btnSalesReport_Click(object sender, EventArgs e)
        {
            lblHint.Visible = false;
            userInput.Visible = false;
            pickupOrDeliv.Visible = false;
            btnSubmit.Visible = false;
            gvInput.Visible = false;
            gvOutput.Visible = false;
            gvTotalSales.Visible = true;
            gvTotalQty.Visible = false;

            DBConnect dbObj = new DBConnect();
            string sqlStatement = "SELECT * FROM Pizza Order by TotalSales Desc";
            DataSet reportData = dbObj.GetDataSet(sqlStatement);

            gvTotalSales.DataSource = reportData;
            gvTotalSales.DataBind();
        }

        protected void btnQuantityReport_Click(object sender, EventArgs e)
        {
            lblHint.Visible = false;
            userInput.Visible = false;
            pickupOrDeliv.Visible = false;
            btnSubmit.Visible = false;
            gvInput.Visible = false;
            gvOutput.Visible = false;
            gvTotalSales.Visible = false;
            gvTotalQty.Visible = true;

            DBConnect dbObj = new DBConnect();
            string sqlStatement = "SELECT * FROM Pizza Order by TotaQuantityOrdered Desc";
            DataSet reportData = dbObj.GetDataSet(sqlStatement);

            gvTotalQty.DataSource = reportData;
            gvTotalQty.DataBind();
        }
    }
}