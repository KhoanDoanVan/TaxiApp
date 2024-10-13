//
//  AddVehicleView.swift
//  TaxiApp
//
//  Created by Đoàn Văn Khoan on 13/10/24.
//

import SwiftUI

struct AddVehicleView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    @State private var txtServiceType = ""
    @State private var txtBrandName = ""
    @State private var txtModelName = ""
    @State private var txtManufacturer = ""
    @State private var txtNumberPlat = ""
    @State private var txtColor = ""

    
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
                    
                    Text("Add Vehicle")
                        .font(.customfont(.bold, fontSize: 24))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer()
                }
                .padding(.top, .topInsets + 8)
                .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    LineTextField( title: "Service Type", placeholder: "Ex: Micro" ,txt: $txtServiceType)
                        .padding(.bottom, 8)
                    
                    LineTextField( title: "Brand (Auto Suggestion)", placeholder: "Ex: BMW" ,txt: $txtBrandName)
                        .padding(.bottom, 8)
                    
                    
                    LineTextField( title: "Model (Auto Suggestion)", placeholder: "Ex: ABC" ,txt: $txtModelName)
                        .padding(.bottom, 8)
                    
                    LineTextField( title: "Manufacturer (Auto Suggestion)", placeholder: "BMW" ,txt: $txtManufacturer)
                        .padding(.bottom, 8)
                    
                    LineTextField( title: "Number Plat", placeholder: "Ex: YT123456" ,txt: $txtNumberPlat)
                        .padding(.bottom, 8)
                    
                    LineTextField( title: "Color", placeholder: "Ex: Red" ,txt: $txtColor)
                        .padding(.bottom, 8)
                    
                    NavigationLink {
                        VehicleDocumentView()
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
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()

    }
}

#Preview {
    AddVehicleView()
}
