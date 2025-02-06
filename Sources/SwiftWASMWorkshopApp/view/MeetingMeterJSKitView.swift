import Foundation
import SwiftWASMWorkshop
import JavaScriptKit

class MeetingMeterJSKitView: MeetingMeterView {
    
    private let document: JSObject
    private let presenter: MeetingMeterPresenter
    
    init(document: JSObject, presenter: MeetingMeterPresenter) {
        self.document = document
        self.presenter = presenter
    }

    func initialize() {
        debug("Initializing MeetingMeterJSKitView")
        initTitle()
        initStartButton()
        initAvgMeetingCostInput()
        initCostLabel()
        initPauseButton()
        initResetButton()
    }
    
    private func initTitle() {
        var title = self.document.createElement!("h1")
        title.textContent = "⏱️ Meeting Meter ⏱️"
        title.className = "title"
        _ = document.body.append(title)
    }
    
    private func initStartButton() {
        var button = self.document.createElement!("button");
        button.textContent = " Start ⬅️";
        button.className = "button"
        button.disabled = "false"
        let startClickListener = JSClosure { [weak self] _ in
            guard let self else { return .undefined }
            self.presenter.didClickStartButton()
            return .undefined
        }
        _ = button.addEventListener("click", startClickListener)
        _ = document.body.append(button)
    }
    
    private func initPauseButton() {
        var button = self.document.createElement!("button");
        button.textContent = "⏸️ Pause ⏸️";
        button.className = "button"
        button.disabled = "false"
        let pauseClickListener = JSClosure { [weak self] _ in
            guard let self else { return .undefined }
            self.presenter.didClickPauseButton()
            return .undefined
        }
        _ = button.addEventListener("click", pauseClickListener)
        _ = document.body.append(button)
    }
    
    private func initAvgMeetingCostInput() {
        var costInput = self.document.createElement!("input");
        costInput.placeholder = "Annual cost per attendee in €";
        costInput.className = "input"
        costInput.type = "number"
        costInput.min = "0"
        costInput.max = "500000"
        let costChangeListener = JSClosure { [weak self] args in
            guard let event = args.first, let self else { return .undefined }
            self.presenter.didChangeCostValue(event.target.value.string ?? "")
            return .undefined
        }
        _ = costInput.addEventListener("input", costChangeListener)
        _ = document.body.append(costInput)
    }

    private func initCostLabel() {
        var infoLabel = self.document.createElement!("h2");
        infoLabel.textContent = "💵💵💵";
        infoLabel.className = "subtitle"
        _ = document.body.append(infoLabel)
    }
    
    private func initResetButton() {
        var button = self.document.createElement!("button");
        button.textContent = "🔁 Reset 🔁";
        button.className = "button"
        let resetClickListener = JSClosure { [weak self] _ in
            guard let self else { return .undefined }
            self.presenter.didClickResetButton()
            return .undefined
        }
        _ = button.addEventListener("click", resetClickListener)
        _ = document.body.append(button)
    }
}
