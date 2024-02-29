function GetCustomerInfo(custInfo)
{
    controlAddIn = $("#controlAddIn");
    controlAddIn.empty();
    controlAddIn.append("Customer name: " + custInfo.name);
    controlAddIn.append("<br>Customer Email: " + custInfo.email);
    controlAddIn.append("<br>Customer Phone: " + custInfo.phone);
}