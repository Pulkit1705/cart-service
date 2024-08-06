
using { cuid, managed, Country, Currency } from '@sap/cds/common';

service CartService {

    entity Cart : cuid,managed {
        user  : Association to one user;
        cartItems : Composition of many CartItems on cartItems.cart = $self;
        createdDate : DateTime;
        modifiedDate : DateTime;
        paymentMode : Association to one PaymentMode;
        promo : String;
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

    entity CartItems : cuid {
       cart : Association to one Cart; 
       product : Association to one Product;
       quantity : Integer;
       itemPrice : Decimal;
       itemTax : Decimal default 0.0 ;
       subtotal : Decimal;
       total : Decimal;
    }

    entity user : cuid,managed {
        cart : Composition of one Cart;
    }

    entity Product: cuid,managed {
    
    }

}