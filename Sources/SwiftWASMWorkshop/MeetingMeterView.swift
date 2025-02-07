import Foundation

public protocol MeetingMeterView {
    func initialize()
    
    func inputCostValue(_ value: Double)
    func meetingCost(_ value: Double)
    func startButtonEnabled(_ enabled: Bool)
    func stopButtonEnabled(_ enabled: Bool)
}
