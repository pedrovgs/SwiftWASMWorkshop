import Foundation

public class MeetingMeterPresenter {
    public var view: MeetingMeterView?
    
    public init() {}
    
    public func resume() {
        view?.initialize()
    }
    
    public func didClickStartButton() {
        print("===> click start button")
    }
    
    public func didClickPauseButton() {
        print("====> pause")
    }
    
    public func didChangeCostValue(_ costValue: String) {
        print("===> did change cost value \(costValue)")
    }

    public func didClickResetButton() {
        guard let view else { return }
        view.meetingCost(.zero)
        view.inputCostValue(.zero)
        view.startButtonEnabled(false)
        view.pauseButtonEnabled(false)
        stopClock()
    }

    private func stopClock() {
        
    }
    
}
