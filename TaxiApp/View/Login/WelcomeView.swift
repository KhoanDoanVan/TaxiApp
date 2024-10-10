//
//  WelcomeView.swift
//  TaxiApp
//
//  Created by Đoàn Văn Khoan on 9/10/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image("welcome_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
                .overlay(
                    Rectangle().fill(Color.black.opacity(0.9))
                )
            
            VStack(alignment: .center, spacing: 15) {
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .screenWidth * 0.3)
                
                Spacer()
                
                NavigationLink {
//                    MobileNumberView()
                    SignInView()
                } label: {
                    Text("SIGN IN")
                        .font(.customfont(.regular, fontSize: 16))
                        .foregroundColor(Color.white)
                }
                .frame(maxWidth: .infinity, minHeight: 45, alignment: .center)
                .background(Color.primaryApp)
                .cornerRadius(25)
                
                NavigationLink {
                    SignUpView()
                } label: {
                    Text("SIGN UP")
                        .font(.customfont(.regular, fontSize: 16))
                        .foregroundColor(Color.white)
                }
            }
            .foregroundColor(Color.primaryText)
            .padding(.top, .topInsets + 8)
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets + 8)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        WelcomeView()
    }
}
