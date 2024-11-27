//
//  ContentView.swift
//  HW6P8M4_GeometryReader
//
//  Created by Baha Sadyr on 11/27/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                GeometryReader { proxy in
                    let minY = proxy.frame(in: .global).minY
                    VStack {
                        Image("colin")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: 300 + (minY > 0 ? minY: 0))
                            .clipped()
                            .offset(y: (minY > 0 ? -minY : 0))
                    }
                }
                .frame(height: 300)
                
                VStack {
                    CollectionViewPerresentable(viewModel: viewModel)
                        .frame(height: 350)
                }
                .padding(.top, 0)
                    .background(.white)
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(.horizontal)
                VStack (spacing: 10) {
                    VStack {
                        TextFieldViewRepresentable(text: $viewModel.userInput)
                            .frame(maxWidth: .infinity)
                            .frame( height: 50)
                            .padding()
                    }
                    .padding(.top, 50)
                    .padding(.horizontal)
                }
                .padding(.horizontal, 20)
                Spacer()
            }
        }
        .onAppear {
            Task {
                await viewModel.getItems()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
