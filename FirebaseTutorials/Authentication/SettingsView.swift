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
    
    func resetPassword() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.badServerResponse)
        }
        
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
    
    func updateEmail() async throws {
        let email = "hello123@gmail.com"
        try await AuthenticationManager.shared.updateEmail(withEmail: email)
    }
    
    func updatePassword() async throws {
        let password = "hello123"
        try await AuthenticationManager.shared.updatePassword(newPassword: password)
    }
}

struct SettingsView: View {
    
    @State private var viewmodel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List {
            Button("Log Out") {
                do {
                    try viewmodel.signOut()
                    showSignInView = true
                } catch {
                    print("Error logging out: \(error)")
                }
            }
            
            emailSection
            
        }
        .navigationTitle("Settings")
    }
    
    private var emailSection: some View {
        Section("Email Functions") {
            Button("Reset Password") {
                Task {
                    do {
                        try await viewmodel.resetPassword()
                        print("password reset")
                    } catch {
                        print("Error logging out: \(error)")
                    }
                }
            }
            
            Button("Update Password") {
                Task {
                    do {
                        try await viewmodel.updatePassword()
                        print("update password")
                    } catch {
                        print("Error logging out: \(error)")
                    }
                }
            }
            
            Button("Update Email") {
                Task {
                    do {
                        try await viewmodel.updateEmail()
                        print("update email")
                    } catch {
                        print("Error logging out: \(error)")
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView(showSignInView: .constant(false))
    }
}
