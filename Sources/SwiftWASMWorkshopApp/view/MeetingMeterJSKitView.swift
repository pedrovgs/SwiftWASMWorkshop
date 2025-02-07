import Foundation
import SwiftWASMWorkshop
import JavaScriptKit

class MeetingMeterJSKitView: MeetingMeterView {
    
    private let document: JSObject
    private let presenter: MeetingMeterPresenter
    
    private var startButton: JSValue?
    private var pauseButton: JSValue?
    private var resetButton: JSValue?
    private var costInput: JSValue?
    private var infoLabel: JSValue?
    
    init(document: JSObject, presenter: MeetingMeterPresenter) {
        self.document = document
        self.presenter = presenter
    }

    func initialize() {
        debug("Initializing MeetingMeterJSKitView")
        initTitle()
        initStartButton()
        initCostLabel()
        initAvgMeetingCostInput()
        initPauseButton()
        initResetButton()
    }
    
    func meetingCost(_ value: Double) {
        if (value == .zero) {
            infoLabel?.textContent = "💵💵💵"
        } else {
            let currencyFormatter = NumberFormatter()
            currencyFormatter.numberStyle = .currency
            currencyFormatter.locale = Locale(identifier: "es_ES")
            guard let formattedValue = currencyFormatter.string(from: value as NSNumber) else {
                infoLabel?.textContent = "💵💵💵"
                return
            }
            let beautifiedValue = "💵💵💵 \(formattedValue) 💵💵💵"
            infoLabel?.textContent = beautifiedValue.jsValue
        }
    }
    
    func inputCostValue(_ value: Double) {
        if (value == .zero) {
            costInput?.value = "".jsValue
        } else {
            costInput?.value = "\(value)".jsValue
        }
    }
    func startButtonEnabled(_ enabled: Bool) {
        
    }
    func pauseButtonEnabled(_ enabled: Bool) {
        
    }
    
    private func initTitle() {
        var title = self.document.createElement!("h1")
        title.textContent = "⏱️ Meeting Meter ⏱️"
        title.className = "title"
        _ = document.body.append(title)
    }
    
    private func initStartButton() {
        var button = self.document.createElement!("button");
        startButton = button
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
        pauseButton = button
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
        var input = self.document.createElement!("input");
        costInput = input
        input.placeholder = "Annual cost per meeting in €";
        input.className = "input"
        input.type = "number"
        input.min = "0"
        input.max = "500000"
        let costChangeListener = JSClosure { [weak self] args in
            guard let event = args.first, let self else { return .undefined }
            self.presenter.didChangeCostValue(event.target.value.string ?? "")
            return .undefined
        }
        _ = input.addEventListener("input", costChangeListener)
        _ = document.body.append(costInput)
    }

    private func initCostLabel() {
        var label = self.document.createElement!("h2");
        infoLabel = label
        label.textContent = "💵💵💵";
        label.className = "subtitle"
        _ = document.body.append(infoLabel)
    }
    
    private func initResetButton() {
        var button = self.document.createElement!("button");
        resetButton = button
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
