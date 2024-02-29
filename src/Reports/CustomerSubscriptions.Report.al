report 50100 "CSD Customer Subscriptions"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem(Customer; Customer)
        {
            PrintOnlyIfDetail = true;
            column(No_Customer; "No.")
            {
                IncludeCaption = true;
            }
            column(Name_Customer; Name)
            {
                IncludeCaption = true;
            }
            dataitem("CSD Customer Subscription"; "CSD Customer Subscription")
            {
                DataItemLink = "Customer No." = field("No.");
                DataItemTableView = sorting("Customer No.", "Subscription Code") where("Active" = const(true));

                column(ItemNo_CSDCustomerSubscription; "Item No.")
                {
                    IncludeCaption = true;
                }
                column(SubScriptionCode_CSDCustomerSubscription; "Subscription Code")
                {
                    IncludeCaption = true;
                }
                column(StartDate_CSDCustomerSubscription; "Start Date")
                {
                    IncludeCaption = true;
                }
                column(LastInvoiceDate_CSDCustomerSubscription; "Last Invoice Date")
                {
                    IncludeCaption = true;
                }
                column(NextInvoiceDate_CSDCustomerSubscription; "Next Invoicing Date")
                {
                    IncludeCaption = true;
                }
                column(InvoicingPrice_CSDCustomerSubscription; "Invoicing Price")
                {
                    IncludeCaption = true;
                }
                column(Active_CSDCustomerSubscription; Active)
                {
                    IncludeCaption = true;
                }
            }
        }

        dataitem("Company Information"; "Company Information")
        {
            column(Picture_CompanyInformation; Picture)
            {
            }
            column(CompanyName; CompanyName())
            {
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './Layouts/CustomerSubscriptions.rdl';
        }
    }
    labels
    {
        ReportNameCap = 'Customer Subscriptions';
        TotalCap = 'Total';
    }
}