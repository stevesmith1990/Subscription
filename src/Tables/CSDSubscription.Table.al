table 50100 "CSD Subscription"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }

        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = ToBeClassified;
            TableRelation = Item;

            trigger OnValidate()
            var
                Item: Record Item;
            begin
                if Item.Get("Item No.") then
                    Rec."Deferral Code" := Item."Default Deferral Template Code"
                else
                    Rec."Deferral Code" := '';
                if "Invoicing Price" = 0 then
                    "Invoicing Price" := Item."Unit Price";
            end;
        }
        field(4; "Invoicing Schedule"; Option)
        {
            Caption = 'Invoicing Schedule';
            DataClassification = ToBeClassified;
            OptionMembers = "Posting Date","Beginning of Period","End of Period","Beginning of Next Period";
            OptionCaption = 'Posting Date,Beginning of Period,End of Period,Beginning of Next Period';
        }
        field(5; "Invoicing Frequency"; DateFormula)
        {
            Caption = 'Invoicing Frequency';
            DataClassification = ToBeClassified;
        }

        field(6; "Invoicing Price"; Decimal)
        {
            Caption = 'Invoicing Price';
            DataClassification = ToBeClassified;
        }
        field(7; "Deferral Code"; Code[10])
        {
            Caption = 'Deferral Code';
            DataClassification = ToBeClassified;
            TableRelation = "Deferral Template";
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

}