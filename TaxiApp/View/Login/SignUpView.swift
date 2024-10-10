//
//  SignUpView.swift
//  TaxiApp
//
//  Created by Đoàn Văn Khoan on 10/10/24.
//

import SwiftUI
import CountryPicker

struct SignUpView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var countryObj: Country?
    @State private var showCountryPicker: Bool = false
    @State private var txtAddress = ""
    @State private var txtFirst = ""
    @State private var txtLast = ""
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
                    Text("Create profile")
                        .font(.customfont(.bold, fontSize: 24))
                        .padding(.bottom, 30)
                    
                    LineTextField( title: "First name", placeholder: "Ex: Simon" ,txt: $txtFirst)
                        .padding(.bottom, 8)
                    
                    LineTextField( title: "Last name", placeholder: "Ex: IsDev" ,txt: $txtLast)
                        .padding(.bottom, 8)
                    
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
                    
                    LineTextField( title: "Home Address", placeholder: "Ex: Home No, City, State, ZipCode" ,txt: $txtAddress)
                        .padding(.bottom, 8)
                    
                    LineSecureField(title: "Password", placeholder: "*******",txt: $txtPassword, isShowPassword: $showPassword)
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
                        
                    } label: {
                        Text("REGISTER")
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
    SignUpView()
}
