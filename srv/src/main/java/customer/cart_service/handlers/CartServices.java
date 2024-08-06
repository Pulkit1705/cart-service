package customer.cart_service.handlers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.sap.cds.services.cds.CdsCreateEventContext;
import com.sap.cds.services.cds.CdsReadEventContext;
import com.sap.cds.services.cds.CqnService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;

@Component
@ServiceName("CartServices")
public class CartServices implements EventHandler{

    private Map<Object, Map<String, Object>> cartMap = new HashMap<>();

    //TODO: add to cart
    //TODO: view cart
    //TODO: Delete cart entirely
    //TODO: update products in cart and details(add and delete)
    //TODO: update billing and shipping address
    //TODO: Delivery method update


    @On(event = CqnService.EVENT_CREATE, entity = "CartService.Cart")
    public void onCreate(CdsCreateEventContext context) {
        context.getCqn().entries().forEach(e -> cartMap.put(e.get("ID"), e));
        context.setResult(context.getCqn().entries());
    }

    @On(event = CqnService.EVENT_READ, entity = "AdminService.Cart")
    public void onRead(CdsReadEventContext context) {
        context.setResult(cartMap.values());
    }
}
