import Foundation
import SwiftWASMWorkshop
import JavaScriptKit

class MeetingMeterJSKitView: MeetingMeterView {
    
    private let document: JSObject
    private let presenter: MeetingMeterPresenter
    
    private var startButton: JSValue?
    private var stopButton: JSValue?
    private var resetButton: JSValue?
    private var costInput: JSValue?
    private var infoLabel: JSValue?
    
    init(document: JSObject, presenter: MeetingMeterPresenter) {
        self.document = document
        self.presenter = presenter
    }

    func initialize() {
        initTitle()
        initCostLabel()
        initAvgMeetingCostInput()
        initButtons()
        debug("MeetingMeterJSKitView ready!")
    }
    
    func meetingCost(_ value: Double) {
        if (value == .zero) {
            debug("Meeting cost value reset")
            infoLabel?.textContent = "💵💵💵"
        } else {
            let currencyFormatter = NumberFormatter()
            currencyFormatter.numberStyle = .currency
            currencyFormatter.locale = Locale(identifier: "es_ES")
            guard let formattedValue = currencyFormatter.string(from: value as NSNumber) else {
                infoLabel?.textContent = "💵💵💵"
                return
            }
            debug("Meeting cost value udpated: \(formattedValue)")
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
        startButton?.disabled = (!enabled).jsValue
    }

    func stopButtonEnabled(_ enabled: Bool) {
        stopButton?.disabled = (!enabled).jsValue
    }
    
    func costInputEnabled(_ enabled: Bool) {
        costInput?.disabled = (!enabled).jsValue
    }
    
    private func initTitle() {
        var title = self.document.createElement!("h1")
        title.textContent = "⏱️ MeetingMeter ⏱️"
        title.className = "title"
        _ = document.body.append(title)
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
    
    private func initButtons() {
        var buttonsContainer = self.document.createElement!("div");
        buttonsContainer.className = "buttons-container"
        _ = document.body.append(buttonsContainer)
        initStartButton(buttonsContainer)
        initStopButton(buttonsContainer)
        initResetButton(buttonsContainer)
    }
    
    private func initStartButton(_ parent: JSValue) {
        var button = self.document.createElement!("button");
        startButton = button
        button.textContent = " Start ⬅️";
        button.className = "button"
        button.disabled = "false"
        let startClickListener = JSClosure { [weak self] _ in
            guard let self else { return .undefined }
            debug("➡️ Start button clicked")
            self.presenter.didClickStartButton()
            return .undefined
        }
        _ = button.addEventListener("click", startClickListener)
        _ = parent.append(button)
    }
    
    private func initStopButton(_ parent: JSValue) {
        var button = self.document.createElement!("button");
        stopButton = button
        button.textContent = "⏸️ Stop ⏸️";
        button.className = "button"
        button.disabled = "false"
        let stopClickListener = JSClosure { [weak self] _ in
            guard let self else { return .undefined }
            debug("⏸️ Stop button clicked")
            self.presenter.didClickStopButton()
            return .undefined
        }
        _ = button.addEventListener("click", stopClickListener)
        _ = parent.append(button)
    }
    
    private func initResetButton(_ parent: JSValue) {
        var button = self.document.createElement!("button");
        resetButton = button
        button.textContent = "🔁 Reset 🔁";
        button.className = "button"
        let resetClickListener = JSClosure { [weak self] _ in
            guard let self else { return .undefined }
            debug("🔁 Reset button clicked")
            self.presenter.didClickResetButton()
            return .undefined
        }
        _ = button.addEventListener("click", resetClickListener)
        _ = parent.append(button)
    }
}
