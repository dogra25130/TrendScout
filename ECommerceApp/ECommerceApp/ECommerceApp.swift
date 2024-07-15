//
//  ECommerceApp.swift
//  ECommerceApp
//
//  Created by Abhishek Dogra on 14/07/24.
//

import SwiftUI
import Combine

@main
struct ECommerceApp: App {
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}

@MainActor
class KeyboardHandler {
    static let shared = KeyboardHandler()
    private var cancellables = Set<AnyCancellable>()
    private init() { }
    
    public func listenForKeyboardNotifications() -> AsyncStream<CGFloat> {
        return AsyncStream(CGFloat.self) { continuation in
            NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
                .sink { notification in
                    guard let userInfo = notification.userInfo,
                          let keyboardRect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                    continuation.yield(keyboardRect.height)
                }
                .store(in: &cancellables)
        }
    }
}
