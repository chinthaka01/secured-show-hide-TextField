//
//  ContentView.swift
//  SecuredTextFiled
//
//  Created by Chinthaka Perera on 1/20/23.
//

import SwiftUI

struct ContentView: View, SecuredTextFieldParentProtocol {
    
    /// This is getting assigned to the method in SecuredTextFieldView to
    /// execute hide keyboard.
    @State var hideKeyboard: (() -> Void)?
    
    /// The secured tex the usert inputed in SecuredTextFieldView
    @State private var password = ""
    
    /// State of alert apearance.
    @State private var showingAlert = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Group {
                    VStack {
                        SecuredTextFieldView(text: $password, parent: self)
                            .frame(maxWidth: geometry.size.width * 0.9)

                        Button(action: {
                            showingAlert.toggle()
                            performHideKeyboard()
                        }, label: {
                            HStack {
                                Text("Show Text")
                            }
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .frame(maxWidth: geometry.size.width * 0.6)
                        })
                        .buttonStyle(.borderedProminent)
                        .tint(.black)
                        .alert(password, isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                    }
                }
                .frame(maxHeight: geometry.size.height * 0.33)
            }
        }
        .padding()
    }
    
    /// Execute the clouser and perform hide keyboard in SecuredTextFieldView.
    private func performHideKeyboard() {
        
        guard let hideKeyboard = self.hideKeyboard else {
            return
        }
        
        hideKeyboard()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
