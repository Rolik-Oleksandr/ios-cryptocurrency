import SwiftUI

@main
struct ios_cryptocurrencyApp: App {
    
    @StateObject private var vm = StartViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                StartView()
            }
            .environmentObject(vm)
        }
    }
}
