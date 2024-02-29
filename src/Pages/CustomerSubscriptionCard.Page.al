page 50100 "CSD Subscription Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Subscription";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Code';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Name';
                }
                field("Item Number"; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Item Number';
                }
                field("Invoicing Schedule"; Rec."Invoicing Schedule")
                {
                    ApplicationArea = All;
                    ToolTip = 'Invoicing Schedule';
                }
                field("Invoicing Frequence"; Rec."Invoicing Frequency")
                {
                    ApplicationArea = All;
                    ToolTip = 'Invoicing Frequency';
                }
                field("Invoicing Price"; Rec."Invoicing Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Invoicing Price';
                }
            }
        }
    }
}