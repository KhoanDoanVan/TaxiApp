//
//  SignInView.swift
//  TaxiApp
//
//  Created by Đoàn Văn Khoan on 10/10/24.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var countryObj: Country?
    @State private var showCountryPicker: Bool = false
    @State private var txtMobile = ""
    @State private var showPassword = false
    @State private var txtPassword = ""
    
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
                    Text("Sign In")
                        .font(.customfont(.bold, fontSize: 24))
                        .padding(.bottom, 30)
                    
                    Text("Mobile")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(.placeholder)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Button {
                            showCountryPicker = true
                        } label: {
                            if let countryObj = countryObj {
                                Text("\(countryObj.isoCode.getFlag())")
                                    .font(.customfont(.medium, fontSize: 35))
                                
                                Text("+\(countryObj.phoneCode)")
                                    .font(.customfont(.medium, fontSize: 16))
                            }
                        }
                        
                        TextField("Enter Mobile", text: $txtMobile)
                            .font(.customfont(.medium, fontSize: 16))
                            .frame(maxWidth: .infinity)
                    }
                    
                    Divider()
                        .padding(.bottom, 15)
                    
                    LineSecureField(title: "Password", placeholder: "*******",txt: $txtPassword, isShowPassword: $showPassword)
                        .padding(.bottom, 15)
                    
                    
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
                        Text("FORGOT PASSWORD")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(Color.primaryApp)
                    }
                    .frame(maxWidth: .infinity, minHeight: 45, alignment: .center)
                }
                .foregroundColor(Color.primaryText)
                .padding(.horizontal, 15)
            }
        }
        .onAppear {
            self.countryObj = Country(phoneCode: "84", isoCode: "VN")
        }
        .sheet(isPresented: $showCountryPicker){
            CountryPickerUI(country: $countryObj)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

#Preview {
    SignInView()
}
