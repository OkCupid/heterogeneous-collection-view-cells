//
//  User.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/16/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import Foundation

struct User {
    let username: String
    let avatarUrl: URL
    let backgroundUrl: URL?
    let type: UserType

    // Test data
    static var all: [User] {
        let backgroundUrl = URL(string: "https://tctechcrunch2011.files.wordpress.com/2015/04/codecode.jpg?w=738")!
        return [
            User(username: "Tongue Twister", avatarUrl: URL(string: "https://pbs.twimg.com/profile_images/541920956449435651/iHq9_qcq.png")!, backgroundUrl: backgroundUrl, type: .featured),
            User(username: "Glasses",avatarUrl: URL(string: "http://cdn.shopify.com/s/files/1/1061/1924/products/Nerd_with_Glasses_Emoji_2a8485bc-f136-4156-9af6-297d8522d8d1_grande.png?v=1483276509")!, backgroundUrl: backgroundUrl, type: .regular),
            User(username: "Sunglasses", avatarUrl: URL(string: "https://i.pinimg.com/736x/25/b9/24/25b924f1d18fea2c7dfcb26a9905c1e8--funny-emoji-emoji-png.jpg")!, backgroundUrl: backgroundUrl, type: .regular),
            User(username: "Cash", avatarUrl: URL(string: "http://d2trtkcohkrm90.cloudfront.net/images/emoji/apple/ios-10/256/money-mouth-face.png")!, backgroundUrl: backgroundUrl, type: .featured),
        ]
    }
}


