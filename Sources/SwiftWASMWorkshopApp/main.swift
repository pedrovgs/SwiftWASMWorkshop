import Foundation
import JavaScriptKit
import JavaScriptEventLoop
import SwiftWASMWorkshop

debug("➡️ Starting app!")

guard let document = JSObject.global.document.object else {
    throw AppError.documentNotAvailable
}

initializeJSKit()
initializeTitle(document)
initializeCSS(document)
initializeApp(document)

debug("✅ Application ready!")

private func initializeJSKit() {
    JavaScriptEventLoop.installGlobalExecutor()
}

private func initializeTitle(_ document: JSObject) {
    document.title = "⏱️ MeetingMeter ⏱️"
}

private func initializeCSS(_ document: JSObject) {
    var styleElement = document.createElement!("style")
    styleElement.textContent = appCss.jsValue
    _ = document.head.append(styleElement)
    debug("💄 Application style initialized!")
}

private func initializeApp(_ document: JSObject) {
    let meetingMeter = MeetingMeter()
    let presenter = MeetingMeterPresenter(meetingMeter: meetingMeter)
    let view = MeetingMeterJSKitView(document: document, presenter: presenter)
    presenter.view = view
    presenter.resume()
}
