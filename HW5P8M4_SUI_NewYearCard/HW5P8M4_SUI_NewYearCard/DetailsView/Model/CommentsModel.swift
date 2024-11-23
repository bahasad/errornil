//
//  CommentsModel.swift
//  HW5P8M4_SUI_NewYearCard
//
//  Created by Baha Sadyr on 11/20/24.
//

import Foundation

struct CommentsModel: Hashable {
    
    var date:String = CardViewModel.formattedDate()
    var text: String
    
}
