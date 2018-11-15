import ballerina/grpc;

endpoint grpc:Listener gRPClistener {
    host: "localhost",
    port: 6061
};


// Type definition for an order.
type Item record {
    string id;
    int quantity;
};

@grpc:ServiceConfig
service InventoryService bind gRPClistener {
    getItem(endpoint caller, string id) {

        // Sample inventory data 
        Item inventoryItem;
        inventoryItem.id = "100105";
        inventoryItem.quantity = 124;

        // Send response to the caller.
        _ = caller->send(inventoryItem);
        _ = caller->complete();
    }
}
