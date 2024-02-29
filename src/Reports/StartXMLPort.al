report 50130 "CSD Start XMLPort"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    trigger OnPreReport()
    begin
        XMLport.Run(50100);
    end;

}