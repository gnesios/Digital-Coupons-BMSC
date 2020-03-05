using System;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using System.Collections.Generic;

namespace BMSCDigitalCoupons.Layouts.BMSCDigitalCoupons
{
    public partial class CouponsResult : UnsecuredLayoutsPageBase
    {
        const string COUPONS_LIST = "Cupones Digitales";

        protected override bool AllowAnonymousAccess
        {
            get
            {
                //return base.AllowAnonymousAccess;
                return true;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string ci = Request.QueryString["ci"];

                List<string> couponsList = this.GetUserCoupons(ci);

                if (couponsList.Count == 0)
                {
                    ltrMessage.Text = "No se encontraron resultados. Por favor inténtalo nuevamente.";
                }
                else
                {
                    ltrMessage.Text = string.Format(
                        "<p>Nombre cliente: <strong style='text-transform: uppercase'>{1}</strong></p>" +
                        "<p>Cédula de identidad: <strong>{0}</strong></p>" +
                        "<p>Cupones canjeados: <strong>{2}</strong></p>" +
                        "<p>Fecha de corte: <strong>{3}</strong></p>",
                        couponsList[0], couponsList[1], couponsList[2], couponsList[3]);
                }
            }
            catch (Exception ex)
            {
                ltrMessage.Text = ex.Message;
            }
        }

        private List<string> GetUserCoupons(string ci)
        {
            using (SPSite sps = new SPSite(SPContext.Current.Web.Url))
            using (SPWeb spw = sps.OpenWeb())
            {
                SPQuery queryCoupons = new SPQuery();
                queryCoupons.Query = string.Format(
                    "<Where>" +
                    "<Eq><FieldRef Name='Title' /><Value Type='Text'>{0}</Value></Eq>" +
                    "</Where>",
                    ci);
                SPListItemCollection coupons = spw.Lists[COUPONS_LIST].GetItems(queryCoupons);
                List<string> userCoupons = new List<string>();

                try
                {
                    userCoupons.Add(coupons[0].Title);
                    userCoupons.Add(coupons[0]["Nombre Cliente"].ToString());
                    userCoupons.Add(coupons[0]["Cupones Canjeados"].ToString());
                    userCoupons.Add(String.Format("{0:D}",
                        Convert.ToDateTime(coupons[0]["Fecha Corte"].ToString())));
                }
                catch
                { }

                return userCoupons;
            }
        }
    }
}
