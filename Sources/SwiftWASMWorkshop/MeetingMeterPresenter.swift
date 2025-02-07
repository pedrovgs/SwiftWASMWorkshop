import Foundation

public class MeetingMeterPresenter {
    public var view: MeetingMeterView?
    
    private var annualCost: Double = .zero

    private let meetingMeter: MeetingMeter
    
    public init(meetingMeter: MeetingMeter) {
        self.meetingMeter = meetingMeter
    }
    
    public func resume() {
        view?.initialize()
    }
    
    public func didClickStartButton() {
        guard let view = view else { return }
        meetingMeter.start(annualCost: self.annualCost) { accumulatedCost in
            view.meetingCost(accumulatedCost)
        }
        view.startButtonEnabled(false)
        view.stopButtonEnabled(true)
    }
    
    public func didClickStopButton() {
        guard let view = view else { return }
        meetingMeter.stop()
        view.stopButtonEnabled(false)
        view.startButtonEnabled(true)
    }
    
    public func didChangeCostValue(_ costValue: String) {
        guard let view = view else { return }
        let cost: Double = Double(costValue) ?? 0.0
        if (cost == .zero) {
            view.startButtonEnabled(false)
            view.stopButtonEnabled(false)
            annualCost = .zero
        } else {
            annualCost = cost
            view.startButtonEnabled(true)
        }
    }

    public func didClickResetButton() {
        guard let view else { return }
        view.meetingCost(.zero)
        view.inputCostValue(.zero)
        view.startButtonEnabled(false)
        view.stopButtonEnabled(false)
        meetingMeter.stop()
    }
    
}
