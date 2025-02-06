import Foundation
import SwiftWASMWorkshop
import JavaScriptKit

class MeetingMeterJSKitView: MeetingMeterView {
    
    private let document: JSObject
    
    init(document: JSObject) {
        self.document = document
    }

    func initialize() {
        debug("Initializing MeetingMeterJSKitView")
        initTitle()
        initStartButton()
        initAvgMeetingCostInput()
        initCostLabel()
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
        button.textContent = "➡️ Start ⬅️";
        button.className = "button"
        button.disabled = "false"
        _ = document.body.append(button)
    }
    
    private func initAvgMeetingCostInput() {
        var costInput = self.document.createElement!("input");
        costInput.placeholder = "Annual cost per employee";
        costInput.className = "input"
        costInput.type = "number"
        costInput.min = "0"
        costInput.max = "500000"
        costInput.pattern = "^\\$?\\d+(,\\d{3})*(\\.\\d{0,2})?$"
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
        _ = document.body.append(button)
    }
}
