page 50101 "CSD Subscription List"
{
    Caption = 'Subscriptions';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CSD Subscription";
    Editable = false;
    CardPageID = "CSD Subscription Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Code';
                }
                field("Name"; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Name';
                }
                field("Item No"; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Item No.';
                }
                field("Invoicing Schedule"; Rec."Invoicing Schedule")
                {
                    ApplicationArea = All;
                    ToolTip = 'Invoicing Schedule';
                }
                field("Invoicing Frequency"; Rec."Invoicing Frequency")
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