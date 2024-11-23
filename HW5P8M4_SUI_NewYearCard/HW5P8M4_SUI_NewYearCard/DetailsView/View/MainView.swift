//
//  MainView.swift
//  HW5P8M4_SUI_NewYearCard
//
//  Created by Baha Sadyr on 11/19/24.
//

import SwiftUI

struct MainView: View {
    
    var mainViewModel: [MainCardModel]
    
    @StateObject private var viewModel = CardViewModel()
    @State private var textInTextField:String = ""
    
    var body: some View {
        ZStack {
            Color.appColorBackground.ignoresSafeArea(.all)
            ScrollView {
                VStack {
                    HStack {
                        HStack(spacing: 45) {
                            Button {
                            } label: {
                                Image(._111924ChevronLeft)
                                    .frame(width: 33, height: 33)
                            }
                            VStack(alignment: .leading ) {
                                if let dateItem = viewModel.headerDateItems.first {
                                    Text(dateItem.month)
                                        .font(.system(size: 30))
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                    Text(dateItem.year)
                                        .font(.system(size: 14))
                                        .fontWeight(.light)
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                        Spacer()
                        Button {
                        } label: {
                            Image(._111924BurgerMenu)
                                .frame(width: 25, height: 25)
                        }
                    }
                    .padding(.top, 10)
                    .padding(.horizontal, 25)
                    
                    VStack(spacing: 40) {
                        VStack(spacing: 32) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    LazyHStack(spacing: 30) {
                                        ForEach(mainViewModel, id: \.self) { item in
                                            MainImageView(mainImageItems: item)
                                        }
                                    }
                                }
                                .padding(.top, 63)
                                .padding(.leading, 25)
                            }
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 13) {
                                    if let firstItem = mainViewModel.first {
                                        ForEach(firstItem.tags, id: \.self) { tag in
                                            MainGridItemView(tag: tag)
                                        }
                                    }
                                }
                                .padding(.leading, 25)
                            }
                        }
                        VStack {
                                Text(mainViewModel.first?.desc ?? "")
                                .font(.system(size: 15))
                                .foregroundStyle(.white)
                        }
                        .padding(25)
                        .background(.appColorCardBackground)
                        .clipShape(.rect(cornerRadius: 30))
                        
                        VStack(spacing: 14) {
                            if !viewModel.comments.isEmpty {
                                ForEach(viewModel.comments, id: \.self) { comment in
                                    CommentView(comment: comment)
                                }
                            }
                        }
                        .padding(.horizontal, 25)
                    }
                    TextField("Добавить комментарий", text: $textInTextField)
                        .onSubmit {
                            addComment()
                        }
                    .font(.system(size: 15))
                    .frame(height: 48)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 25)
                    .background(.white)
                    .clipShape(Capsule())
                    .padding(.horizontal, 25)
                    .padding(.top, 25)
                }
            }
        }
    }
    
    func addComment() {
        if !textInTextField.isEmpty {
            let newComment = CommentsModel(text: textInTextField)
            viewModel.comments.append(newComment)
            textInTextField = ""
        }
    }
}

