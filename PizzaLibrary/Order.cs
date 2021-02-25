using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace PizzaLibrary
{
    public class Order
    {

        public double getPrice(string pizzaType, string size)
        {
            //create db object
            DBConnect objDB = new DBConnect();
            double totalPrice = 0;

            //get a data set of the selected pizza type so we can get the price
            String sqlCommand = "SELECT * From Pizza WHERE PizzaType = '" + pizzaType + "'";
            DataSet myData = objDB.GetDataSet(sqlCommand);

            //for loop to iterate through data set and get base price and then we modify based on selected size
            for(int i = 0; i < myData.Tables[0].Rows.Count; i++)
            {
                DataRow row = myData.Tables[0].Rows[i];
                double price = (double)float.Parse(row["BasePrice"].ToString());

                if(size == "Small")
                {
                    totalPrice += price;
                }else if(size == "Medium"){
                    totalPrice += price + 1;
                }
                else
                {
                    totalPrice += price + 2;
                }
            }

            return totalPrice;
        }

        public void updateTotalQuantityAndSales(string pizzaType, int quantityOrdered, double price)
        {
            //create DB connection object
            DBConnect dbObj = new DBConnect();
            //need total price of pizzas sold
            double totalPrice = price * quantityOrdered;

            //update Total sales with price of order
            string sqlTotalSalesUpdate = "UPDATE Pizza SET TotalSales = TotalSales + " + totalPrice + " WHERE PizzaType = '" + pizzaType + "'";
            dbObj.DoUpdate(sqlTotalSalesUpdate);

            //update quantity with num of pizzas ordered
            string sqlTotalQuantityUpdate = "UPDATE Pizza SET TotaQuantityOrdered = TotaQuantityOrdered + " + quantityOrdered + " WHERE PizzaType = '" + pizzaType + "'";
             dbObj.DoUpdate(sqlTotalQuantityUpdate);



        }

        public double getTotalSales(string pizzaType)
        {
            return 0.0;
        }

        public int getTotalQuantityOrdered(string pizzaType)
        {
            return 0;
        }
    }

}
