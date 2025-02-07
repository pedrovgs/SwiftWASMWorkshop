import Foundation

public protocol MeetingMeterView {
    func initialize()
    
    func costValue(_ value: Double)
    func startButtonEnabled(_ enabled: Bool)
    func pauseButtonEnabled(_ enabled: Bool)
}
