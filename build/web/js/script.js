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

$.ajax({
    url:'AddressOrder',
    data:JSON.stringify({amount:amount,info:'order_request'}),
    contentType: 'application/json',
    type: 'POST',
    dataType: 'json',
    success:function(response){
        //invoke when success
        console.log(response)
    },
    error:function(error){
       //invoke when error
       console.log(error)
       alert("Somethong went wrong!!")
    }
})



 function SendEmail() {

                Email.send({
                    Host: "smtp.elasticemail.com",
                    Username: "jayrajsinhvaghela446@gmail.com",
                    Password: "8A08A91E358CE0E70A552E56D712ED7B7CE6",
                    To: 'jayrajsinhvaghela1108@gmail.com',
                    From: 'jayrajsinhvaghela446@gmail.com',
                    Subject: "This is the subject",
                    Body: "Email : " + (document.getElementById("email").value) + ("\n<br>Name : " + document.getElementById("name").value) + ("\n<br>Subject : " + document.getElementById("subject").value) + ("\n<br>Message : " + document.getElementById("msg").value)
                }).then(
                        message => alert("Thank you for Contacting with me.")
                );
            }

