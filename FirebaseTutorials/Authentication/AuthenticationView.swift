//
//  AuthenticationView.swift
//  FirebaseTutorials
//
//  Created by David Cartwright on 2025-04-27.
//

import SwiftUI

struct AuthenticationView: View {
    
    @Binding var showSignIn: Bool
    
    var body: some View {
        VStack {
            NavigationLink {
                SignInEmailView(showSignInView: $showSignIn)
            } label: {
                Text("Sign In with Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding()
            }
            Spacer()
        }.navigationTitle("Sign In")
    }
}

#Preview {
    NavigationStack {
        AuthenticationView(showSignIn: .constant(true))
    }
}
