//
//  ItemCardView.swift
//  HW4P8M4SUI_Grids
//
//  Created by Baha Sadyr on 11/9/24.
//

import SwiftUI


struct ItemCardView: View {
    
    @State var card : ItemCard
    var body: some View {
        VStack (spacing: 10){
            Image(card.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 15)
            VStack {
                VStack(spacing: 4) {
                    HStack {
                        Text("\(card.price) ₽")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(.appText)
                        Spacer()
                        Button {
                            card.isBookmarked.toggle()
                        } label: {
                            Image(card.isBookmarked ? "81124-bookmark" : "apple-logo").resizable()
                                .frame(width: 15, height: 15)
                        }
                        
                    }
                    .padding(.horizontal, 15)
                }
                VStack(spacing: 10) {
                    VStack(alignment: .leading) {
                        Text(card.description)
                            .font(.system(size: 14))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal,15)
                }
                VStack {
                    Button {
                        print("Buy btn clicked!")
                    } label: {
                        ZStack {
                            Color.appBtnColorGreen
                            Text("Купить")
                                .font(.system(size: 8))
                                .foregroundStyle(.white)
                        }
                    }
                    .frame(height: 22)
                    .clipShape(Capsule())
                    
                }
                .padding(.horizontal, 6)
                .padding(.bottom, 3)
            }
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

