import Foundation

public class MeetingMeterPresenter {
    private let view: MeetingMeterView
    
    public init(view: MeetingMeterView) {
        self.view = view
    }
    
    public func resume() {
        view.initialize()
    }
}
