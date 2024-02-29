xmlport 50100 "CSD Export Cust Subscription"
{
    Direction = Export;

    schema
    {
        textelement(NodeName1)
        {
            tableelement(Cust; Customer)
            {
                MinOccurs = Zero;
                SourceTableView = where("CSD Subscription Customer" = const(true));
                // fieldattribute(No; Cust."No.")
                // {
                // }
                // fieldattribute(Name; Cust."Name")
                // {
                // }
                fieldelement(No; Cust."No.")
                {
                }
                fieldelement(Name; Cust."Name")
                {
                }

                tableelement(CSDCustomerSubscription; "CSD Customer Subscription")
                {
                    LinkTable = Cust;
                    LinkFields = "Customer No." = field("No.");
                    SourceTableView = sorting("Customer No.", "Subscription Code", "Item No.");

                    fieldelement(ItemNo; CSDCustomerSubscription."Item No.")
                    {
                    }
                    fieldelement(SubscriptionCode; CSDCustomerSubscription."Subscription Code")
                    {
                    }
                    fieldelement(StartDate; CSDCustomerSubscription."Start Date")
                    {
                    }
                    fieldelement(LastInvoiceDate; CSDCustomerSubscription."Last Invoice Date")
                    {
                    }
                    fieldelement(NextInvoicingDate; CSDCustomerSubscription."Next Invoicing Date")
                    {
                    }
                    fieldelement(Active; CSDCustomerSubscription.Active)
                    {
                    }
                    fieldelement(InvoicingPrice; CSDCustomerSubscription."Invoicing Price")
                    {
                    }
                }
            }
        }
    }

}