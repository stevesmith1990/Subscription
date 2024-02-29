permissionset 50100 GeneratedPermission
{
    Assignable = true;
    Permissions = tabledata "CSD Customer Subscription"=RIMD,
        tabledata "CSD Subscription"=RIMD,
        table "CSD Customer Subscription"=X,
        table "CSD Subscription"=X,
        report "CSD Customer Subscriptions"=X,
        codeunit "CSD Event Subscriptions"=X,
        page "CSD Customer Subscriptions"=X,
        page "CSD Subscription Card"=X,
        page "CSD Subscription FactBox"=X,
        page "CSD Subscription List"=X;
}