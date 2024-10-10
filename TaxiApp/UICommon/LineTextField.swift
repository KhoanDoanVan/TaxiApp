//
//  LineTextField.swift
//  TaxiApp
//
//  Created by Đoàn Văn Khoan on 10/10/24.
//

import SwiftUI

// MARK: - TextField
struct LineTextField: View {
    
    @State var title: String = "Title"
    @State var placeholder = "Placeholder"
    @Binding var txt: String
    @State var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundColor(.placeholder)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField(placeholder, text: $txt)
                .keyboardType(keyboardType)
                .autocapitalization(.none)
                .autocorrectionDisabled()
                .frame(height: 30)
            
            Divider()
        }
    }
}
// MARK: - SecureField
struct LineSecureField: View {
    
    @State var title: String = "Title"
    @State var placeholder = "Placeholder"
    @Binding var txt: String
    @Binding var isShowPassword: Bool
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundColor(.placeholder)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if isShowPassword {
                TextField(placeholder, text: $txt)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .modifier(ShowButton(isShow: $isShowPassword)) // UIExtension
                    .frame(height: 30)
            } else {
                SecureField(placeholder, text: $txt)
                    .autocorrectionDisabled()
                    .modifier(ShowButton(isShow: $isShowPassword)) // UIExtension
                    .frame(height: 30)
            }
            
            Divider()
        }
    }
}

struct LineTextField_Previews: PreviewProvider {
    @State static var txt = ""
    @State static var isShow = false
    static var previews: some View {
        LineTextField(txt: $txt)
    }
}

struct LineSecureField_Previews: PreviewProvider {
    @State static var txt = ""
    @State static var isShow = false
    static var previews: some View {
        LineSecureField(txt: $txt, isShowPassword: $isShow)
    }
}
