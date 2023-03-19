import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Float "mo:base/Float";
import Time "mo:base/Time";
actor {
  stable var currentValue: Float = 100;
  //currentValue := 150;
  
  let id = 387593874534534;

  var startTime = Time.now();

  // Debug.print(debug_show(id));

  public func topUP(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {
    let tempVal: Float = currentValue - amount;
    if(tempVal >= 0) {
      currentValue -= amount; 
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Not enough balance to withdraw!!!")
    }
    
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    var currentTime = Time.now();
    var time = (currentTime - startTime) / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(time));
    startTime := currentTime;
  };
}