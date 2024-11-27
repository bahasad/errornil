//
//  Untitled.swift
//  HW6P8M4_GeometryReader
//
//  Created by Baha Sadyr on 11/27/24.
//

import SwiftUI

struct TextFieldViewRepresentable: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> some TextFieldView {
        let textFieldView = TextFieldView()
        textFieldView.setDelegate(context.coordinator)
        return textFieldView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.textField.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
  
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: TextFieldViewRepresentable
        
        init(_ parent: TextFieldViewRepresentable) {
            self.parent = parent
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let currentText = textField.text as NSString? {
                let updatedText = currentText.replacingCharacters(in: range, with: string)
                parent.text = updatedText
            }
            return true
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
    }
    
}
