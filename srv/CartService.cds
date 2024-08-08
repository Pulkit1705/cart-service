
using { cuid, managed, Country, Currency } from '@sap/cds/common';

service CartService {

    entity Cart : cuid,managed {
        user  : Association to one user;
        cartItems : Composition of many CartItems on cartItems.cart = $self;
        paymentMode : Association to one PaymentMode;
        billingAddress : String;
        shippingAddress :  String;
        deliveryMode : Association to one DeliveryMode;
        currency : Currency;
        country : Country;
        tax : Decimal;
        subTotal : Decimal;
        Total : Decimal;
    }

    entity DeliveryMode : cuid {
        deliveryCharges : Decimal;
        deliveryType : DeliveryType;
    }
    type DeliveryType : String enum { OneDayDelivery ; NormalDelivery }

    entity PaymentMode : cuid{

    }

    entity CartItems : cuid, managed {
       cart : Association to one Cart; 
       product : Association to one Product;
       quantity : Integer;
       discount: Decimal default 0.0;
       itemPrice : Decimal;
       itemTax : Decimal default 0.0 ;
       subtotal : Decimal;
       total : Decimal;
       sequence : Integer;
    }

    entity user : cuid,managed {
        cart : Composition of one Cart;
        firstName: String;
        middleName: String;
        lastName: String;
    }

    entity Product: cuid,managed {
    name : String;
    description : String;

    }

}