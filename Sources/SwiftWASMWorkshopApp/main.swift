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
    // Exercise 1: Change the title of the document to "⏱️ MeetingMeter ⏱️"
}

private func initializeCSS(_ document: JSObject) {
    /* Exercise 2: Apply the CSS styles from the CSS:swift file to the document
        - Remember you can create HTML elements using the `document.createElement` function.
        - Once you have the element, you can add fill it with the app CSS using the `textContent` property.
        - Once it is ready you can add it to the head tag of the document using the `append` function.

        In javascript you'd do something like this:

        const style = document.createElement("style");
        style.textContent = CSS STYLE HERE;`;
        document.head.append(style);
    */
}

private func initializeApp(_ document: JSObject) {
    // Exercise 3: The app is quite simple, theere is only 1 view implemented MVP. Initialize the dependency tree here and get the app running.
}
