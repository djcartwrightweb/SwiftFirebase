//
//  Settingsview.swift
//  FirebaseTutorials
//
//  Created by David Cartwright on 2025-04-27.
//

import SwiftUI

@MainActor
@Observable final class SettingsViewModel {
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
}

struct SettingsView: View {
    
    @State private var viewmodel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List {
            Button("Log out") {
                do {
                    try viewmodel.signOut()
                    showSignInView = true
                } catch {
                    print("Error logging out: \(error)")
                }
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView(showSignInView: .constant(false))
    }
}
