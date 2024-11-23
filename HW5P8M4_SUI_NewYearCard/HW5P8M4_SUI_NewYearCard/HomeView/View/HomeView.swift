//
//  HomeView.swift
//  HW5P8M4_SUI_NewYearCard
//
//  Created by Baha Sadyr on 11/22/24.
//

import SwiftUI

enum Pages: Hashable {
    case profile([MainCardModel])
}

struct HomeView: View {
    
    @Binding var path: NavigationPath
    @StateObject var viewModel = HomeViewModel()
    let column = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            VStack() {
                VStack(alignment: .leading, spacing: 38) {
                    HStack {
                        Text("instaPocket")
                            .foregroundStyle(.white)
                            .font(.system(size: 30, weight: .bold))
                        Spacer()
                        Button {
                        } label: {
                            Image(._112324Gear)
                                .resizable()
                                .foregroundStyle(.white)
                                .frame(width: 25, height: 25)
                        }
                    }
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.top, 30)
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                        HStack {
                            Text(viewModel.HomeModelDateItems.first?.date ?? "")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold))
                            Spacer()
                        }
                    }
                    
                    //here the card starts code
                    LazyVGrid(columns: column, spacing: 38) {
                        ForEach(viewModel.mainCardItems) { item in
                            NavigationLink(value: Pages.profile(viewModel.mainCardItems)) {
                                CardView(viewModel: item)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 30)
        }
        .background(.black)
    }
}

#Preview {
    HomeView(path: .constant(NavigationPath()))
}

struct CardView: View {
    
    var viewModel: MainCardModel
    
    var body: some View {
        ZStack {
            Image(viewModel.photo)
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 370)
                .clipped()
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.99), Color.clear]),
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(height: 120)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding(.top, 250)
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "heart")
                            .resizable()
                            .foregroundStyle(.black)
                            .frame(width: 25, height: 25)
                    }
                }
                .padding(.top, 30)
                .padding(.trailing, 15)
                
                Spacer()
                VStack(alignment: .leading, spacing: 15) {
                    
                    HStack(spacing: 20) {
                        Text(viewModel.photoCount)
                        Text(viewModel.commentCount)
                    }
                    .foregroundStyle(.white)
                    
                    HStack(spacing: 6) {
                        ForEach(viewModel.tags, id: \.self) { tag in
                            CardTagView(tag: tag)
                        }
                    }
                    Text(viewModel.desc)
                        .foregroundStyle(.white)
                        .font(.system(size: 12))
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity)
            .frame(alignment: .leading)
            .frame(height: 370)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .clipShape(.rect(cornerRadius: 30))
        }
        .frame(height: 370)
        .clipShape(.rect(cornerRadius: 30))
    }
}

struct CardTagView: View {
    
    var tag: String
    var body: some View {
        Text(tag)
            .foregroundStyle(.white)
            .padding(.horizontal, 10)
            .frame(height: 27)
            .background(.gray.opacity(0.7))
            .clipShape(Capsule())
    }
}
