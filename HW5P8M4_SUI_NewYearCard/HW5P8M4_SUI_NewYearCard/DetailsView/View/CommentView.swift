//
//  CommentView.swift
//  HW5P8M4_SUI_NewYearCard
//
//  Created by Baha Sadyr on 11/19/24.
//

import SwiftUI

struct CommentView: View {
    
    var comment: CommentsModel
    
    var body: some View {
        VStack(spacing: 14) {
            Text(CardViewModel.formattedDate())
                .font(.system(size: 15))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.white)
            Text(comment.text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 25)
        .padding(.vertical, 25)
        .background(.appColorCardBackground)
        .clipShape(.rect(cornerRadius: 30))
    }
}



