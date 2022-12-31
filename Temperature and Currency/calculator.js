// Temp Convertor
function conTemp(cel)
{
    let res=((9/5)*cel)+32;
    alert("The converted Temp :" +res);
}

function conCurrency(fromCountry,toCountry,currency){
    switch(fromCountry){
        case "INR": if(toCountry=="AUD"){
            return currency*0.018;
        }
        if(toCountry=="EURO"){
            return currency*0.011;
        }
        if(toCountry=="USD"){
            return currency*0.012;
        }
        break;
        case "AUD":if(toCountry=="INR"){
            return currency*56;
        }
        if(toCountry=="EURO"){
            return currency*0.64;
        }
        if(toCountry=="USD"){
            return currency*0.68;
        }
        break;
        case "EURO":
            if(toCountry=="INR")return currency*88.76;
            if(toCountry=="USD")return currency*1.07;
            if(toCountry=="AUD")return currency*1.57;
            break;
        case "USD":  
            if(toCountry=="INR")return currency*82.75;
            if(toCountry=="EURO")return currency*0.93;
            if(toCountry=="AUD") return currency*1.47;
            break; 
    }
}
//Fav Book
function fvBook(){
    let book=[];
    const ol=document.getElementById("lstItems");
    book.push(document.getElementById("favBook").value);
    for(const item of book){
        const value="<li>"+item+"</li>"
        ol.innerHTML+=value;
    }
}