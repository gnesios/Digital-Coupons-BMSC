using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace BMSCDigitalCoupons.WPCouponsForm
{
    public partial class WPCouponsFormUserControl : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void lnkConfirm_Click(object sender, EventArgs e)
        {
            string ci = txbDocumento.Text.Trim() + ddlDepartamento.SelectedValue;

            string url =
                string.Format("/_layouts/BMSCDigitalCoupons/CouponsResult.aspx?ci={0}",
                ci);
            this.ShowBasicDialog(url, "cupones acumulados");
        }

        private void ShowBasicDialog(string Url, string Title)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.AppendLine(@"<script type=""text/ecmascript"" language=""ecmascript"">");
            sb.AppendLine(@"SP.SOD.executeFunc('sp.js', 'SP.ClientContext', openBasicServerDialog);");
            sb.AppendLine(@"function openBasicServerDialog() {");
            sb.AppendLine(@"var options = {");
            sb.AppendLine(string.Format(@"url: '{0}',", Url));
            sb.AppendLine(string.Format(@"title: '{0}',", Title));
            sb.AppendLine(@"width: 500, height: 200, allowMaximize: false, showClose: true,");
            sb.AppendLine(@"dialogReturnValueCallback: function (dialogResult, value) { window.top.location = window.top.location; }"); //to reload the parent page
            sb.AppendLine(@"};");
            sb.AppendLine(@"SP.UI.ModalDialog.showModalDialog(options);");
            sb.AppendLine(@"}");
            sb.AppendLine(@"</script>");
            ltrScriptLoader.Text = sb.ToString();
        }
    }
}
