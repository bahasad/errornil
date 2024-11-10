//
//  ContentView.swift
//  HW4P8M4SUI_Grids
//
//  Created by Baha Sadyr on 11/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack(spacing: 30) {
                        VStack(spacing: 18) {
                            Image(._81124Restart)
                            
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Image(._81124IPhone15)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .clipShape(.rect(cornerRadius: 20))
                        }
                        .padding(.leading, 18)
                        .padding(.trailing, 24)
                        
                        
                        VStack(spacing: 30) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    MainCard()
                                    MainCard()
                                    MainCard()
                                        
                                }
                                .padding(.leading, 18)
                            }
                            VStack {
                                FooterCard()
                                    
                            }
                            .padding(.leading, 18)
                            .padding(.trailing, 24)
                        }
                    }
                }
                .padding(.top, 50)
                
            }
        }
        .background(.appColorBackgroundMain)
    }
}

#Preview {
    ContentView()
}

struct MainCard: View {
    var body: some View {
        VStack {
//            Spacer()
//                .frame(maxHeight: 68)
            HStack {
                VStack(alignment: .leading,  spacing: 10) {
                    Image(._81124IpadMainView)
                        .resizable()
                        .frame(width: 151, height: 104)
                    VStack {
                        Text("iPad")
                            .font(.system(size: 14, weight: .bold))
                    }
                        .padding(.leading, 13)
                }
            }
            .padding(.bottom, 19)
            .padding(.top, 68)
//            Spacer()
//                .frame(maxHeight: 19)
        }
        .background(Color.appColorCards)
        .clipShape(.rect(cornerRadius: 5))
        
    }
}



struct FooterCard: View {
    var body: some View {
        
        VStack {
            HStack(alignment: .top, spacing: 0) {
                Text("Оплата\nи доставка")
                    .font(.system(size: 24, weight: .bold))
                Image(._81124ABird)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 118)
            }
            .padding(.top, 16)
            
        }
        .padding(.leading, 18)
        .padding(.trailing, 24)
        .background(Color.appColorCards)
        .clipShape(.rect(cornerRadius: 5))
        
    }
}

