codeunit 50100 "CSD Event Subscriptions"
{
    Subtype = Normal;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterPostSalesDoc, '', false, false)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean; PreviewMode: Boolean);
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
        CustomerSubscription: Record "CSD Customer Subscription";
        Subscription: Record "CSD Subscription";
    begin
        SalesInvoiceLine.SetLoadFields("No.", "Sell-to Customer No.", "Posting Date");
        SalesInvoiceLine.SetRange("Document No.", SalesInvHdrNo);
        SalesInvoiceLine.SetRange(Type, SalesInvoiceLine.Type::Item);
        if SalesInvoiceLine.FindSet() then
            repeat
                CustomerSubscription.SetRange("Customer No.", SalesInvoiceLine."Sell-to Customer No.");
                CustomerSubscription.SetRange("Item No.", SalesInvoiceLine."No.");
                CustomerSubscription.SetRange("Subscription Code", SalesInvoiceLine."CSD Subscription Code");
                if CustomerSubscription.FindFirst() then begin
                    Subscription.Get(CustomerSubscription."Subscription Code");
                    CustomerSubscription."Last Invoice Date" := SalesInvoiceLine."Posting Date";
                    CustomerSubscription."Next Invoicing Date" := CalcDate(Subscription."Invoicing Frequency");
                    if CustomerSubscription.Modify() then;
                end;

            until SalesInvoiceLine.Next() = 0;

    end;

}