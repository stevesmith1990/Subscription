pageextension 50100 "CSD Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("CSD Subscription Customer"; Rec."CSD Subscription Customer")
            {
                Caption = 'Subscription Customer';
                ApplicationArea = All;
                ToolTip = 'Subscription Customer';
            }
        }
        addfirst(factboxes)
        {
            part("CSD Subscription FactBox"; "CSD Subscription FactBox")
            {
                SubPageLink = "Customer No." = field("No.");
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addfirst(processing)
        {
            action(Subscriptions)
            {
                ApplicationArea = All;
                Caption = 'Subscriptions';
                Image = InsuranceRegisters;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "CSD Customer Subscriptions";
                RunPageLink = "Customer No." = field("No.");
                ToolTip = 'Subscriptions';
            }
        }
    }
}