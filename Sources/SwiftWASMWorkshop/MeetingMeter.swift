import Foundation

public class MeetingMeter {
    
    public init() {}
    
    func start(annualCost: Double, _ callback: @escaping (Double) -> Void) {
        // Exercise 7: Once this function is invoked, you'll have to start a timer that will call the callback every second with the accumulated cost.

        /* Exercise 8: Once the meeting meter is running, you can extend the implementation and show one alert if the meeting cost
           exceeds any given value. 
        
           In Javascript you'd do something like this: window.alert("Meeting cost exceeded $10K€!");
        */
    }
    
    func stop() {
        // Exercise 7: Remember you have to stop the timer at some point!
    }

}
