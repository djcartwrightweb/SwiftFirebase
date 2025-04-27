//
//  SignInEmailView.swift
//  FirebaseTutorials
//
//  Created by David Cartwright on 2025-04-27.
//

import SwiftUI

@MainActor @Observable final class SignInEmailViewModel {
    
    var email: String = ""
    var password: String = ""
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("Email and password cannot be empty")
            return
        }
        
        Task {
            let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
            print("success")
            print(returnedUserData)
        }
    }
    
    
    
}

struct SignInEmailView: View {
    
    @State var viewModel = SignInEmailViewModel()
    
    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
            
            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
            
            Button {
                viewModel.signIn()
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding()
            }

            Spacer()
            
        }
        .padding()
        .navigationTitle("Sign in with email")
    }
}

#Preview {
    NavigationStack {
        SignInEmailView()
    }
        
}
