//
//  OTPView.swift
//  TaxiApp
//
//  Created by Đoàn Văn Khoan on 10/10/24.
//

import SwiftUI

struct OTPView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var txtOTP = ""
        
    var body: some View {
        ZStack {
            ScrollView {
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    
                    Spacer()
                }
                .padding(.top, .topInsets + 8)
                .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Enter mobile number")
                        .font(.customfont(.bold, fontSize: 24))
                        .padding(.bottom, 15)
                    
                    Text("Enter the 4-digit code sent to you at")
                        .font(.customfont(.bold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .padding(.bottom, 1)
                    
                    HStack {
                        Text("+91 8135351231")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .padding(.bottom, 1)
                        Button {
                            
                        } label: {
                            Text("Edit")
                                .font(.customfont(.regular, fontSize: 16))
                                .foregroundColor(.secondaryApp)
                        }
                    }
                    .padding(.bottom, 30)
                    
                    
                    OTPTextField(txtOTP: $txtOTP)
                        .padding(.bottom, 30)
                    
                    
                    NavigationLink {
                        
                    } label: {
                        Text("CONTINUE")
                            .font(.customfont(.regular, fontSize: 16))
                            .foregroundColor(Color.white)
                    }
                    .frame(maxWidth: .infinity, minHeight: 45, alignment: .center)
                    .background(Color.primaryApp)
                    .cornerRadius(25)
                    
                    Button {
                        
                    } label: {
                        Text("Resend Code")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(Color.primaryApp)
                    }
                    .frame(maxWidth: .infinity, minHeight: 45, alignment: .center)
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
    OTPView()
}
