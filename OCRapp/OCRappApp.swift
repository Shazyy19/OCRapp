import SwiftUI

@main
struct OCRappApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView { // Wrap the main content in a NavigationView
            SignUpView()  // Start with Sign Up View
        }
    }
}
}
