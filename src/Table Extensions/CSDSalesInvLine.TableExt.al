tableextension 50102 "CSD Sales Invoice Line" extends "Sales Invoice Line"
{
    fields
    {
        field(50100; "CSD Subscription Code"; Code[20])
        {
            Caption = 'Subscription Item';
        }

    }
}