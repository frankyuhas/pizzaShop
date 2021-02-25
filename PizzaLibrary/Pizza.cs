using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaLibrary
{
    public class Pizza
    {
        public string PizzaType{ get; set;}
        public string Size { get; set; }
        public int Quantity { get; set; }
        public double Price { get; set; }
        public double TotalCost { get; set; }


        public Pizza(string pizzaType, string size, int quantity, double price, double totalCost)
        {
            PizzaType = pizzaType;
            Size = size;
            Quantity = quantity;
            Price = price;
            TotalCost = totalCost;

        }

        public Pizza()
        {

        }

        public override string ToString()
        {
            return PizzaType + " " + Size + " " + Quantity + " " + Price.ToString() + " " + TotalCost.ToString();
        }



    }
}
