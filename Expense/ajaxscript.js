function GetIncomeData() {
    var request = new XMLHttpRequest();
    var url = "ajaxreturntodayincome.aspx";
    request.open("GET", url, true);
    request.onreadystatechange = function () { setincomedata(request); };
    request.send();
}
function setincomedata(request) {
    if (request.readyState != 4)
        return;
    else {
        income = (request.responseText);
        document.getElementById("ContentPlaceHolder1_spntodayincome").innerHTML = "Rs." + income + "/-";
        GetExpenseData();
    }
}

function GetExpenseData() {
    var request = new XMLHttpRequest();
    var url = "ajaxreturntodayexpense.aspx";
    request.open("GET", url, true);
    request.onreadystatechange = function () { setexpensedata(request); };
    request.send();
}
function setexpensedata(request) {
    if (request.readyState != 4)
        return;
    else {
        var expense = request.responseText;
        document.getElementById("ContentPlaceHolder1_spantodayexpense").innerHTML = "Rs." + expense + "/-";
        var saving = income - expense;
        document.getElementById("ContentPlaceHolder1_spantodaysaving").innerHTML = "Rs." + saving + "/-";
    }
}

window.setInterval(GetIncomeData, 30000);