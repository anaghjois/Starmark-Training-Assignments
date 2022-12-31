function onClick(){
    const first=parseFloat(document.getElementById("txtFirst").value);
    if(Number.isNaN(first)){
        alert("Not a Number");
    return;
    }
    const second=parseFloat(document.getElementById("txtSecond").value);
    const operator=document.getElementById("Operator").value;
    let result=0.0;
    switch(operator){
        case "+":
            result=first+second;
            break;
        case "-":
            result=first-second;
            break;
        case "*":
            result=first*second;
            break;
        case "/":
            if(second==0)alert("cannod divide by zero")
            else result=first/second;
            break;            
    }
    document.getElementById("res").innerText=result;
    window.localStorage.setItem(operator,result)
}