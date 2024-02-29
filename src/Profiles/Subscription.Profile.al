profile "CSD Subscription"
{
    Caption = 'Subscription RC';
    RoleCenter = "Sales Manager Role Center";
    ProfileDescription = 'Subscription Role Centre';
    Customizations = "CSD MyCustomizations";
}

//pageCustomization "CSD MyCustomizations" customizes "Sales Manager Role Center"
pageCustomization "CSD MyCustomizations" customizes "Customer List"
{
    actions
    {
        modify(PaymentRegistration)
        {
            Visible = false;
        }
        // modify(Campaigns)
        // {
        //     Visible = false;
        // }         
    }
    views
    {
        addfirst
        {
            view(BalanceLCY)
            {
                Caption = 'Balance Outstanding';
                OrderBy = ascending("Balance (LCY)");
                SharedLayout = false;

                layout
                {

                }
            }
        }
    }
}