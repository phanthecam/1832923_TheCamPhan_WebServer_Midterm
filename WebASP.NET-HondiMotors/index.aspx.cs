using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace WebASP.NET_HondiMotors
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            panPrice.Visible = panInfor.Visible = false;

            if (!Page.IsPostBack)
            {
                txtPhoneNumber.Visible = lblPhoneNumber.Visible = false;
                cboCarModel.Items.Add(new ListItem("Civoc (+ $25000)", "25000"));
                cboCarModel.Items.Add(new ListItem("DR-V (+ $30000)", "30000"));
                cboCarModel.Items.Add(new ListItem("Appord (+ $33000)", "33000"));
                cboCarModel.Items.Add(new ListItem("Cilot (+ $45000)", "45000"));
                cboCarModel.Items.Add(new ListItem("Odyrrey (+ $54000)", "54000"));

                lstColor.Items.Add(new ListItem("White (Free)", "0"));
                lstColor.Items.Add(new ListItem("Dark (+ $300)", "300"));

                lstColor.Items.Add(new ListItem("Pearl (+ $900)", "900"));
                lstColor.SelectedIndex = 0;

                chklstAccessories.Items.Add(new ListItem("Aero Kit (+ $1300)", "1300"));
                chklstAccessories.Items.Add(new ListItem("Film (+ $600)", "600"));
                chklstAccessories.Items.Add(new ListItem("Cold Weather (+ $900)", "900"));
                chklstAccessories.Items.Add(new ListItem("Hondi Emblem (+ $150)", "150"));
                chklstAccessories.Items.Add(new ListItem("Snow Tire Packge (+ $1800)", "1800"));

                radlstWarranty.Items.Add(new ListItem("3 Years (Include)", "0"));
                radlstWarranty.Items.Add(new ListItem("5 Years (+ $1000)", "1000"));
                radlstWarranty.Items.Add(new ListItem("7 Years (+ 1500)", "1500"));
                
                radlstWarranty.SelectedIndex = 0;
            }

            if (cboCarModel.SelectedIndex > 0)
            {
                calculatePrice();
            }
        }

        private void calculatePrice()
        {
            decimal baseP = 0, colorP = 0, acessoruesP = 0, warrantyP = 0, totalNoTax = 0, totalWithTax = 0;

            baseP = Convert.ToDecimal(cboCarModel.SelectedItem.Value);
            litPricing.Text = "Car prrice: $" + baseP + "</br>";

            colorP = Convert.ToDecimal(lstColor.SelectedItem.Value);
            litPricing.Text += "Interior Color: $" + colorP + "</br>";

            foreach (ListItem item in chklstAccessories.Items)
            {
                acessoruesP += (item.Selected) ? Convert.ToDecimal(item.Value) : 0;
            }

            litPricing.Text += "Acessories: $" + acessoruesP + "</br>";

            warrantyP = Convert.ToDecimal(radlstWarranty.SelectedItem.Value);
            litPricing.Text += "Waranty: $" + warrantyP + "</br></br></br>";

            totalNoTax = baseP + colorP + acessoruesP + warrantyP;

            litPricing.Text += "Total without taxes: $" + totalNoTax + "</br>";

            totalWithTax = totalNoTax * Convert.ToDecimal(1.15);

            litPricing.Text += "Total with taxes(15%): $" + totalWithTax + "</br> </ br > ";

            panPrice.Visible = true;
        }

        protected void cboCarModel_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void chkContact_CheckedChanged(object sender, EventArgs e)
        {
             txtPhoneNumber.Visible = lblPhoneNumber.Visible = chkContact.Checked;
        }

        protected void btnConclude_Click(object sender, EventArgs e)
        {
            panInfor.Visible = true;
            if (txtCity.Text == "")
            {
                litInfor.Text = "Please Enter Your City!";
            }else if (IsValidZipCode(txtZipCode.Text) == false)
            {
                litInfor.Text = "Please Enter a Valid ZipCode";
            }
            else
            {
                int count = 0;
                litInfor.Text = "Conratulation in obtain your new Hondi " + cboCarModel.SelectedItem.Text.Split('(')[0];


                litInfor.Text += " in " + txtCity.Text + ", " + txtZipCode.Text + "." + "</br></br>";


                litInfor.Text += "Your car comes with " + lstColor.SelectedItem.Text.Split('(')[0] + "Interior Color";

                foreach (ListItem item in chklstAccessories.Items)
                {

                    if (item.Selected)
                    {
                        litInfor.Text += ", " + item.Text.Split('(')[0].Trim();
                        count++;
                    }
                }

                if (count == 0)
                {
                    litInfor.Text += ".</br></br>";
                }
                else
                {
                    litInfor.Text += " accessories.</br></br>";
                }

                litInfor.Text += "You choesed " + radlstWarranty.SelectedItem.Text.Split('(')[0] + "of warranty";

                if (chkContact.Checked)
                {
                    litInfor.Text += " and our dealar you contact you by the phone number " + txtPhoneNumber.Text + ".";
                }
                else
                {
                    litInfor.Text += ".";
                }

            }
        }

        protected void lstColor_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private bool IsValidZipCode(string zipCode)
        {
            bool isValidZip = false;
            string pattern = @"^\d{5}-\d{4}|\d{5}|[A-Z]\d[A-Z] \d[A-Z]\d$";
            Regex regex = new Regex(pattern);
            return isValidZip = regex.IsMatch(zipCode);
        }
    }
}