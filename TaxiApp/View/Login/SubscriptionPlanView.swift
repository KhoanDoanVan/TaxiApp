//
//  SubscriptionPlanView.swift
//  TaxiApp
//
//  Created by Đoàn Văn Khoan on 13/10/24.
//

import SwiftUI

struct SubscriptionPlanView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    @State var planArr = [
        [
            "name": "Basic plan",
            "time": "1 Month",
            "rides": " - 10 rides Everyday",
            "cash_rides": " - 2 Cash Rides",
            "km": " - 50 km travel rides",
            "price": "TRY FREE"
        ],
        [
            "name": "Class plan",
            "time": "3 Month",
            "rides": " - 10 rides Everyday",
            "cash_rides": " - 2 Cash rides",
            "km": " - 50 km travel rides",
            "price": "BUY AT $20.50"
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
                    
                    Text("Subscription Plan")
                        .font(.customfont(.bold, fontSize: 24))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer()
                }
                .padding(.top, .topInsets + 8)
                .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    ForEach(0..<planArr.count, id: \.self) { index in
                        let pObj = planArr[index]
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(pObj["name"] ?? "")
                                .font(.customfont(.regular, fontSize:  18))
                                .foregroundColor(.primaryText)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text(pObj["time"] ?? "")
                                .font(.customfont(.regular, fontSize:  15))
                                .foregroundColor(.secondaryText)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text(pObj["rides"] ?? "")
                                .font(.customfont(.regular, fontSize:  16))
                                .foregroundColor(.secondaryText)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text(pObj["cash_rides"] ?? "")
                                .font(.customfont(.regular, fontSize:  16))
                                .foregroundColor(.secondaryText)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text(pObj["km"] ?? "")
                                .font(.customfont(.regular, fontSize:  16))
                                .foregroundColor(.secondaryText)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Button {
                                
                            } label: {
                                Text(pObj["price"] ?? "")
                                    .font(.customfont(.bold, fontSize: 16))
                                    .foregroundColor(.primaryApp)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                        .padding(15)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.white).shadow(radius: 5))
                        .padding(.vertical, 5)
                    }
                    .padding(.bottom, 15)
                    
                    NavigationLink {
                        
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
    SubscriptionPlanView()
}
