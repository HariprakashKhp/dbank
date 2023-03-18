import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
actor {
  var currentValue = 100;
  currentValue := 150;
  
  let id = 387593874534534;

  // Debug.print(debug_show(id));

  public func topUP(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Nat) {
    let tempVal: Int = currentValue - amount;
    if(tempVal >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Not enough balance to withdraw!!!")
    }
    
  };
}