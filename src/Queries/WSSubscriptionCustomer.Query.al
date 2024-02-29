query 50100 "CSD WS Subscript Cust"
{
    QueryType = Normal; // If API then a lot more properties

    elements
    {
        dataitem(Customer; Customer)
        {
            column(Name; Name)
            {
            }
            column(No; "No.")
            {
            }
            dataitem(SubscriptionCustomer; "CSD Customer Subscription")
            {
                DataItemLink = "Customer No." = Customer."No.";
                SqlJoinType = InnerJoin;
                column(Active; Active)
                {
                }
                column(InvoicingPrice; "Invoicing Price")
                {
                }
                column(LastInvoiceDate; "Last Invoice Date")
                {
                }
                column(NextInvoicingDate; "Next Invoicing Date")
                {
                }
                column(StartDate; "Start Date")
                {
                }
                column(SubscriptionCode; "Subscription Code")
                {
                }
                column(CustomerNo; "Customer No.")
                {
                }
                dataitem(SalespersonPurchaser; "Salesperson/Purchaser")
                {
                    Dataitemlink = code = Customer."SalesPerson Code";
                    column(SalesPersonName; Name)
                    {
                    }
                    dataitem(Country_Region; "Country/Region")
                    {
                        DataItemLink = Code = Customer."Country/Region Code";
                        column(County_Name; "County Name")
                        {
                        }
                    }
                }
            }
            // filter(FilterName; SourceFieldName)
            // {

            // }
        }
    }
}