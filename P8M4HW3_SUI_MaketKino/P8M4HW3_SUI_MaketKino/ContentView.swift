//
//  ContentView.swift
//  P8M4HW3_SUI_MaketKino
//
//  Created by Baha Sadyr on 11/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(._61124Kino)
                Spacer()
                Image(._61124Man)
                    .clipShape(Circle())
            }
            .padding(.trailing, 16)
            .padding(.top, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    Image(._61124Alive301)
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 20))
                        .frame(height: 301)
                        //.frame(width: 345, height: 301)
                    
                    Image(._61124Ice)
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 20))
                        .frame(height: 301)
                        //.frame(width: 345, height: 301)
                }
                .padding(.trailing, 0)
                
            }
            .padding(.top, 23)
            .padding(.trailing, 0)
            
            HStack {
                HStack(spacing: 12) {
                    Image(._61124MovieIcon)
                        .resizable()
                        .frame(width: 16, height: 16)
                    Text("Фильмы")
                        .font(.system(size: 14))
                        .foregroundStyle(.white)
                }
                .frame(height: 44)
                .frame(maxWidth: .infinity)
                .background(Color.appColorCartoonBack)
                .clipShape(.rect(cornerRadius: 5))
                
                HStack(spacing: 12) {
                    Image(._61124TVShowIcon)
                        .resizable()
                        .frame(width: 16, height: 16)
                    Text("Сериалы")
                        .font(.system(size: 14))
                        .foregroundStyle(.white)
                }
                .frame(height: 44)
                .frame(maxWidth: .infinity)
                .background(Color.appColorCartoonBack)
                .clipShape(.rect(cornerRadius: 5))
                
                HStack(spacing: 12) {
                    Image(._61124CartoonIcon)
                        .resizable()
                        .frame(width: 16, height: 16)
                    Text("Мультфильмы")
                        .font(.system(size: 14))
                        .foregroundStyle(.white)
                }
                
                .frame(height: 44)
                .frame(maxWidth: .infinity)
                .background(Color.appColorCartoonBack)
                .clipShape(.rect(cornerRadius: 5))
                
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 24)
            .padding(.trailing, 16)
            
            VStack {
                Text("Продолжить просмотр")
                    .font(.system(size: 26))
                    .foregroundStyle(.white)
                    .bold()
                    .frame(alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 24)
            .padding(.trailing, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    Image(._61124FrechRouletteMovie)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 123)
                        .clipShape(.rect(cornerRadius: 5))
                    Image(._61124SprinterMovie)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 123)
                        .clipShape(.rect(cornerRadius: 5))
                }
            }
            VStack {
                Text("Фильмы для вас")
                    .font(.system(size: 26))
                    .foregroundStyle(.white)
                    .bold()
                    .frame(alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 24)
            .padding(.trailing, 16)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    Image(._61124TheSonMovie)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 128)
                        .clipShape(.rect(cornerRadius: 8))
                    Image(._61124MasterAndMargarita)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 128)
                        .clipShape(.rect(cornerRadius: 8))
                    Image(._61124ArturTheKing)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 128)
                        .clipShape(.rect(cornerRadius: 8))
                    Image(._61124ChikatiloShadow)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 128)
                        .clipShape(.rect(cornerRadius: 8))
                }
            }
            
            
            
            
        }
        .padding(.leading, 16)
        .background(Color.appColorBackground)
    }
}

#Preview {
    ContentView()
}
