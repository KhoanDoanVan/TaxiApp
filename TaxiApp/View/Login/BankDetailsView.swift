//
//  BankDetailsView.swift
//  TaxiApp
//
//  Created by Đoàn Văn Khoan on 11/10/24.
//

import SwiftUI

struct BankDetailsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    @State private var txtBankName = ""
    @State private var txtAccountHolderName = ""
    @State private var txtAccountNumber = ""
    @State private var txtSwiftCode = ""

    
    var body: some View {
        ZStack {
            ScrollView {
                HStack(alignment: .center) {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    
                    Text("Bank Details")
                        .font(.customfont(.bold, fontSize: 24))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer()
                }
                .padding(.top, .topInsets + 8)
                .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    LineTextField( title: "Bank Name", placeholder: "Ex: SBI" ,txt: $txtBankName)
                        .padding(.bottom, 8)
                    
                    LineTextField( title: "Account Holder", placeholder: "Ex: Simonisdev" ,txt: $txtAccountHolderName)
                        .padding(.bottom, 8)
                    
                    
                    LineTextField( title: "Swift/IFSC Code", placeholder: "Ex: 00000000" ,txt: $txtSwiftCode)
                        .padding(.bottom, 8)
                
                    
                    Text("BY continuing, I confirm that i have read and agree to the")
                        .font(.customfont(.regular, fontSize: 11))
                        .foregroundColor(Color.secondaryText)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    HStack {
                        Text("Terms & conditions")
                            .font(.customfont(.regular, fontSize: 11))
                            .foregroundColor(Color.secondaryText)
                        
                        Text("and")
                            .font(.customfont(.regular, fontSize: 11))
                            .foregroundColor(Color.secondaryText)
                        
                        Text("Privacy policy")
                            .font(.customfont(.regular, fontSize: 11))
                            .foregroundColor(Color.secondaryText)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 15)
                    
                    NavigationLink {
                        DocumentUploadView()
                    } label: {
                        Text("NEXT")
                            .font(.customfont(.regular, fontSize: 16))
                            .foregroundColor(Color.white)
                    }
                    .frame(maxWidth: .infinity, minHeight: 45, alignment: .center)
                    .background(Color.primaryApp)
                    .cornerRadius(25)
                    .padding(.bottom, 30)
                }
                .foregroundColor(Color.primaryText)
                .padding(.horizontal, 15)
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()

    }
}

#Preview {
    BankDetailsView()
}
