import Foundation
import JavaScriptKit
import SwiftWASMWorkshop

debug("➡️ Starting app!")

guard let document = JSObject.global.document.object else {
    throw AppError.documentNotAvailable
}

initializeTitle(document)
initializeCSS(document)
initializeApp(document)

debug("✅ Application ready!")


func initializeTitle(_ document: JSObject) {
    document.title = "Swift WASM Workshop"
}

func initializeCSS(_ document: JSObject) {
    var styleElement = document.createElement!("style")
    styleElement.textContent = appCss.jsValue
    _ = document.head.append(styleElement)
    debug("💄 Application style initialized!")
}

func initializeApp(_ document: JSObject) {
    let view = MeetingMeterJSKitView(document: document)
    let presenter = MeetingMeterPresenter(view: view)
    presenter.resume()
}
