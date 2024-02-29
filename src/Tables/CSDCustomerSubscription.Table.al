table 50101 "CSD Customer Subscription"
{
    Caption = 'Customer Subscription';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
        field(2; "Subscription Code"; Code[20])
        {
            Caption = 'Subscription Code';
            DataClassification = CustomerContent;
            TableRelation = "CSD Subscription";

            trigger OnValidate()
            var
                Subscription: Record "CSD Subscription";
                Item: Record Item;
            begin
                if Rec."Subscription Code" <> xRec."Subscription Code" then
                    TestField("Last Invoice Date", 0D);

                if Subscription.Get("Subscription Code") then begin
                    Subscription.TestField("Item No.");
                    Subscription.TestField("Invoicing Frequency");

                    "Item No." := Subscription."Item No.";

                    if Subscription."Invoicing Price" <> 0 then
                        "Invoicing Price" := Subscription."Invoicing Price"
                    else
                        if Item.Get("Item No.") then
                            "Invoicing Price" := Item."Unit Price"
                        else
                            "Invoicing Price" := 0;

                    case Subscription."Invoicing Schedule" of
                        Subscription."Invoicing Schedule"::"Beginning of Next Period":
                            "Start Date" := CalcDate('<CM+1D>', WorkDate());
                        Subscription."Invoicing Schedule"::"Beginning of Period":
                            "Start Date" := CalcDate('<-CM>', WorkDate());
                        Subscription."Invoicing Schedule"::"End of Period":
                            "Start Date" := CalcDate('<CM>', WorkDate());
                        Subscription."Invoicing Schedule"::"Posting Date":
                            "Start Date" := WorkDate();
                    end
                end else
                    "Start Date" := 0D;

                if "Next Invoicing Date" = 0D then
                    "Next Invoicing Date" := "Start Date";

            end;
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            TableRelation = Item;
        }
        field(4; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = CustomerContent;
        }
        field(5; "Last Invoice Date"; Date)
        {
            Caption = 'Last Invoice Date';
            DataClassification = ToBeClassified;
        }
        field(6; "Next Invoicing Date"; Date)
        {
            Caption = 'Next Invoicing Date';
            DataClassification = ToBeClassified;
        }
        field(7; "Cancelled Date"; Date)
        {
            Caption = 'Cancelled Date';
            DataClassification = ToBeClassified;
        }
        field(8; Active; Boolean)
        {
            Caption = 'Active';
            DataClassification = CustomerContent;
        }
        field(9; "Invoicing Price"; Decimal)
        {
            Caption = 'Invoicing Price';
            DataClassification = CustomerContent;
        }
        field(10; "Allow Line Discount"; Boolean)
        {
            Caption = 'Allow Line Discount';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Customer No.", "Subscription Code", "Item No.")
        {
            Clustered = true;
        }
    }
}