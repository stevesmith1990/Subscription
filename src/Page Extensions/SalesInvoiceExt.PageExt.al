pageextension 50102 "CSD SalesInvoiceExt" extends "Sales Invoice"
{
    layout
    {
        addfirst(factboxes)
        {
            part(CustInfoCardPart; CustInfoCardPart)
            {
                ApplicationArea = all;
                SubPageLink = "No." = field("Bill-to Customer No.");
            }
        }
    }
}