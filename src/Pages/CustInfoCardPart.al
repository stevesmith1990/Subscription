page 50104 CustInfoCardPart
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            usercontrol(CustInfoCtrl; CustInfoCtrl)
            {

            }
        }
    }
    local procedure GetCustomerInfo()
    var
        custInfo: JsonObject;

    begin
        custInfo.Add('name', Rec.Name);
        custInfo.Add('email', Rec."E-Mail");
        custInfo.Add('phone', Rec."Phone No.");
        CurrPage.CustInfoCtrl.GetCustomerInfo(custInfo);
    end;

    trigger OnAfterGetCurrRecord()
    begin
        GetCustomerInfo();
    end;
}