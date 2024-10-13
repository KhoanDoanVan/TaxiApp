//
//  VehicleDocumentView.swift
//  TaxiApp
//
//  Created by Đoàn Văn Khoan on 13/10/24.
//

import SwiftUI

struct VehicleDocumentView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var listArr = [
        [
            "name": "RC Book",
            "detail": "Vehicle Registration",
            "info": "",
            "status": DocumentStatus.uploaded
        ],
        [
            "name": "Insurance policy",
            "detail": "A driving license is an official do ...",
            "info": "",
            "status": DocumentStatus.uploading
        ],
        [
            "name": "Owner certificate",
            "detail": "A passport is a travel document ...",
            "info": "",
            "status": DocumentStatus.upload
        ],
        [
            "name": "PUC",
            "detail": "Incorrect document type",
            "info": "",
            "status": DocumentStatus.upload
        ]
    ]

    
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
                    
                    Text("Vehicle Document")
                        .font(.customfont(.bold, fontSize: 24))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer()
                }
                .padding(.top, .topInsets + 8)
                .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    ForEach(0..<listArr.count, id: \.self) { index in
                        var dObj = listArr[index]
                        
                        DocumentRow(dObj: dObj, type: dObj["status"] as? DocumentStatus ?? .upload)
                    }
                    .padding(.bottom, 15)
                
                    
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
                        SubscriptionPlanView()
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
    VehicleDocumentView()
}
