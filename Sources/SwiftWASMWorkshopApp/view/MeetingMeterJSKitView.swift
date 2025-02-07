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
        /* Exercise 6: Once you get here, format the value using Swift "NumberFormatter" and ".currency" style and 
           update the infosLabel content with the formatted value. If the meeting cost is 0, you can reset the label to "💵💵💵".

           In Javascript you'd do something like this: infoLabel.textContent = "💵💵💵";
        */
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
    
    // Exercise 9: Modify the UI so the user has now 2 inputs, one for the number of attendees and another one for the average cost per attendee.
    private func initAvgMeetingCostInput() {
        var input = self.document.createElement!("input");
        costInput = input
        input.placeholder = "Annual cost per meeting in €";
        input.className = "input"
        input.type = "number"
        input.min = "0"
        input.max = "500000"
        /* Exercise 5: React to the input changes!
            From javascript, given any HTML element you clan use a function named
            addEventListener("input", () => { ... }); to react to the input events.
            Using JSKIt you can do the same by creating a JSClosure and adding it to the
            element using the addEventListener function.
        */
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
        /* Exercise 4: React to the reset button clicks!
            From javascript, given any HTML element you clan use a function named
            addEventListener("click", () => { ... }); to react to the click event.
            Using JSKIt you can do the same by creating a JSClosure and adding it to the
            element using the addEventListener function.
        */
        _ = parent.append(button)
    }
    
    private func initStopButton(_ parent: JSValue) {
        var button = self.document.createElement!("button");
        stopButton = button
        button.textContent = "⏸️ Stop ⏸️";
        button.className = "button"
        button.disabled = "false"
        /* Exercise 4: React to the button clicks!
            From javascript, given any HTML element you clan use a function named
            addEventListener("click", () => { ... }); to react to the click event.
            Using JSKIt you can do the same by creating a JSClosure and adding it to the
            element using the addEventListener function.
        */
        _ = parent.append(button)
    }
    
    private func initResetButton(_ parent: JSValue) {
        var button = self.document.createElement!("button");
        resetButton = button
        button.textContent = "🔁 Reset 🔁";
        button.className = "button"
        /* Exercise 4: React to the button clicks!
            From javascript, given any HTML element you clan use a function named
            addEventListener("click", () => { ... }); to react to the click event.
            Using JSKIt you can do the same by creating a JSClosure and adding it to the
            element using the addEventListener function.
        */
        _ = parent.append(button)
    }
}
