    // Script for navigation bar
const bar = document.getElementById('bar');
const close = document.getElementById('close');
const nav = document.getElementById('navbar');

if(bar)
{
    bar.addEventListener('click', () => {
        nav.classList.add('active');
    })
}

if(close)
{
    close.addEventListener('click', () =>{
        nav.classList.remove('active');
    })
}


//First request to server to create order


const paymentStart = () => {
    console.log("payment started..");
    
    var amount = $("#payment_field").val();
    if(amount==0.0 || amount==null){
        alert("amount is required.");
        return;
    }
    console.log(amount);
    
};