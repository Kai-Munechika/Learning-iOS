import PlaygroundSupport

//: Delegation: https://medium.com/@jamesrochabrun/implementing-delegates-in-swift-step-by-step-d3211cbac3ef

/*
 Steps:
 
 First, we create a protocol that defines the set of requirements our delegate must adhere to.
 
 Next, we add a delegate property to our class. The type of this property must be the protocol we just defined.
 Since a delegate isn't required in all cases, we make this an optional variable property.
 
 Also because an object and its delegate can both reference each other the delegate property needs to be marked weak.
 This means that we have to also make our protocol class bound since only classes can have weak relationships.
 
 To act as a delegate, all objects need to do is conform to our delegate protocol and provide implementations for the requirements.
 
 */
