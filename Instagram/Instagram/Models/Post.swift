//
//  Post.swift
//  Instagram
//
//  Created by Дмитрий Супрун on 18.10.22.
//

import Foundation

/// Single post info
struct Post {
    var userID = 0
    var images: [String] = []
    var subTitleText = ""
    var isLiked = false
    var isSavedToCollection = false
    var likesCount = 0
    var descriptionText = ""
    var postDate = Date()
}
