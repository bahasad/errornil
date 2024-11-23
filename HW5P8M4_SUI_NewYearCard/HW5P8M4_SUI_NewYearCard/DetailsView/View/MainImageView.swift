//
//  MainImageView.swift
//  HW5P8M4_SUI_NewYearCard
//
//  Created by Baha Sadyr on 11/19/24.
//

import SwiftUI




struct MainImageView: View {
    
    var mainImageItems: MainCardModel
    var body: some View {
        ZStack(alignment: .topTrailing){
            Image(mainImageItems.photo)
                .resizable()
                .aspectRatio(282 / 518, contentMode: .fill)
                .frame(height: 518)
                .clipShape(.rect(cornerRadius: 20))
            VStack{
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundStyle(.white)
                    
                        .font(.title)
                }
            }
            .padding(.top, 25)
            .padding(.trailing, 19)
        }
    }
}

