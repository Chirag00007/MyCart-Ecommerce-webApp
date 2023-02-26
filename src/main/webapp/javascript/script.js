/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


function add_to_cart(pid,pname,price){
    
    let cart = localStorage.getItem("cart");
;    if(cart==null)
    {
        //no cart yet
        let products=[];
        let product ={ productId: pid, productName:pname, productQuantity:1, productPrice:price };
        products.push(product);
        localStorage.setItem("cart",JSON.stringify(products));
        console.log("product is added for the first time");
        showToast("new Item is added to cart");
    }
    else{
        // cart is already present
        let pcart = JSON.parse(cart);
    let oldProduct =  pcart.find((item)=>item.productId==pid);
    if(oldProduct){
        // we have to increase the quantity
      oldProduct.productQuantity =  oldProduct.productQuantity+1
      pcart.map((item)=>{
          if(item.productId==oldProduct.productId){
              item.productQuantity = oldProduct.productQuantity; 
          }
      })
        localStorage.setItem("cart",JSON.stringify(pcart));
        console.log("product quantity is increased")
        showToast(oldProduct.productName + "product quantity is increased");
       
    }
    else{
        // we have to add the product
         let product ={ productId: pid, productName:pname, productQuantity:1, productPrice:price };
         pcart.push(product);
         localStorage.setItem("cart",JSON.stringify(pcart));
         console.log("product is added");
         showToast("Item is added to cart");
    }
    }
    updateCart();
  
}

//update cart

function updateCart()
{ 
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if(cart==null || cart.length==0){
        console.log("cart is emptyv!")
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3> cart does not have any items </h3>");
        $(".checkout-btn").addClass('disabled');
    }
    else{
        // there is something to show
        console.log(cart);
        $(".cart-items").html(`(${cart.length}`);
        let table = `
            <table class='table'>
            <thead class = 'thead-light'>
            <tr>
            <th>Item name</th>
            <th>Price</th>
            <th> Quantity</th>
            <th>Total Price</th>
            <th> Action </th>
        
        
        
            <tr>
            </thead>
       
        

`;
        let totalPrice = 0;
        cart.map((item)=>{
            table+=`
            <tr>
            <td> ${item.productName} </td>
            <td> ${item.productPrice} </td>
            <td> ${item.productQuantity} </td>
            <td> ${item.productQuantity * item.productPrice} </td>
            <td> <button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'> Remove </button> </td>
            </tr>
            
          
           

`;
             totalPrice+=item.productPrice * item.productQuantity 
        });
        
         table = table +  `
 <tr><td colspan='5' class='text-right font-weight-bold m-5'>Total Price : ${totalPrice}</td?</tr>
</table`;
                 $(".cart-body").html(table);
                 $(".checkout-btn").removeClass('disabled');
    }
}

//remove button function
function deleteItemFromCart(pid)
{
   let cart = JSON.parse(localStorage.getItem('cart'));
   let newcart= cart.filter((item)=>item.productId != pid);
   localStorage.setItem('cart',JSON.stringify(newcart))
   showToast("Item is removed from cart");
   updateCart();
}

function showToast(content){
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(()=>{
        $("#toast").removeClass("display");
    },2000);
}
function goToCheckOut(){
    window.location = "checkOut.jsp";
}

$(document).ready(function(){
    updateCart()
})