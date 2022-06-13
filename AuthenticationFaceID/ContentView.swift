//
//  ContentView.swift
//  AuthenticationFaceID
//
//  Created by Danil Peregorodiev on 14.06.2022.
//

import SwiftUI
import LocalAuthentication


struct ContentView: View {
    
    @State private var unlocked = false
    @State private var text = "Locked"
    
    var body: some View {
        VStack {
            Text(text)
                .bold()
                .padding()
            Button("Authenticate") {
                auth()
            }
        }
    }
    
    func auth() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "For security reasons") { success, authenticationError in
                
                if success {
                    text = "Unlocked"
                } else {
                    text = "Your face is not regognized"
                }
                
            }
        } else {
            text = "Use the passcode"
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
