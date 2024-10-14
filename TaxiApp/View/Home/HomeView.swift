//
//  HomeView.swift
//  TaxiApp
//
//  Created by Đoàn Văn Khoan on 14/10/24.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) )
    
    @State private var isOpen = false
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                        .frame(width: 50)
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            Text("GO")
                                .font(.customfont(.semiBold, fontSize: 22))
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 60, height: 60, alignment: .center)
                        .overlay( RoundedRectangle(cornerRadius: 30).stroke(Color.white, lineWidth: 1.5))
                        .cornerRadius(35)
                    }
                    .frame(width: 70, height: 70, alignment: .center)
                    .background(Color.primaryApp)
                    .cornerRadius(35)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image("current_location")
                            .resizable()
                            .frame(width:50, height:50)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                
                VStack {
                    ZStack {
                        HStack {
                            Button {
                                
                            } label: {
                                Image(isOpen
                                      ? "open_btn" : "close_btn")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:15)
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 25)
                        
                        Text("You're offline")
                            .font(.customfont(.extraBold, fontSize: 22))
                            .foregroundColor(Color.primaryText)
                    }
                    .frame(height: 50)
                    .background(Color.white)
                    .cornerRadius(20, corner: [.topLeft, .topRight])
                    .shadow(radius: 3, x: 0, y: -3)
                }
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
