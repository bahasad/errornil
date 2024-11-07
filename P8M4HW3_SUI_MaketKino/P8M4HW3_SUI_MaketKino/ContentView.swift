//
//  ContentView.swift
//  P8M4HW3_SUI_MaketKino
//
//  Created by Baha Sadyr on 11/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(alignment: .top) {
                    Image(._61124Kino)
                    Spacer()
                    Image(._61124Man)
                        .clipShape(Circle())
                }
                .padding(.horizontal, 16)
                
                VStack(spacing: 20) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(vm.featuredMovies, id: \.self) { movie in
                                MoviewHeaderView(movie: movie)
                            }
                        }
                        .padding(.horizontal, 16)
                        
                    }
                    .padding(.top, 23)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(vm.categories, id: \.self) { category in
                                IconsView(categories: category)
                            }
                        }
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity)
                    }
                }
                VStack(spacing: 20) {
                    HeaderTextView(text: "Продолжить просмотр")
                        .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 6) {
                            ForEach(vm.continueWatchingMovies, id: \.self) { movie in
                                MainMoviesView(movie: movie)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
                
                VStack(spacing: 20) {
                    HeaderTextView(text: "Фильмы для вас")
                        .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 6) {
                            ForEach(vm.footerMovies, id: \.self) { movie in
                                FooterMovieView(movie: movie)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
                
            }
            .padding(.vertical, 40)
        }
        .ignoresSafeArea()
        .background(Color.appColorBackground)
        
    }
}

#Preview {
    ContentView()
}

struct MoviewHeaderView: View {
    let movie: Movie
    var body: some View {
        Image(movie.imageName)
            .resizable()
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 20))
            .frame(height: 301)
    }
}

struct IconsView: View {
    let categories: Category
    var body: some View {
        HStack(spacing: 12) {
            Image(categories.icon)
                .resizable()
                .frame(width: 16, height: 16)
            Text(categories.name)
                .font(.system(size: 14))
                .foregroundStyle(.white)
        }
        .frame(height: 44)
        .padding(.horizontal, 16)
        .background(Color.appColorCartoonBack)
        .clipShape(.rect(cornerRadius: 5))
    }
}

struct HeaderTextView: View {
    var text: String
    var body: some View {
        VStack {
            Text(text)
                .font(.system(size: 26))
                .foregroundStyle(.white)
                .bold()
                .frame(alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 24)
        .padding(.trailing, 16)
    }
}

struct MainMoviesView: View {
    let movie: Movie
    var body: some View {
        Image(movie.imageName)
            .resizable()
            .scaledToFit()
            .frame(height: 123)
            .clipShape(.rect(cornerRadius: 5))
    }
}

struct FooterMovieView: View {
    let movie: Movie
    var body: some View {
        Image(movie.imageName)
            .resizable()
            .scaledToFit()
            .frame(height: 128)
            .clipShape(.rect(cornerRadius: 8))
    }
}
