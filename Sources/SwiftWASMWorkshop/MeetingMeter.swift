import Foundation

public class MeetingMeter {
    private var startTime: Date?
    private var timerTask: Task<Void, Never>?
    
    public init() {}
    
    func start(annualCost: Double, _ callback: @escaping (Double) -> Void) {
        guard timerTask == nil else { return }
        let costPerSecond = annualCost / 3.154e+7
        startTime = Date()
        timerTask = Task {
            while (!Task.isCancelled) {
                guard let startTime else { continue }
                let elapsedSeconds = Date().timeIntervalSince(startTime)
                let accumulatedCost = costPerSecond * elapsedSeconds
                callback(accumulatedCost)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
            }
        }
    }
    
    func stop() {
        guard let startTime else { return }
        self.startTime = nil
        timerTask?.cancel()
        timerTask = nil
    }

}
