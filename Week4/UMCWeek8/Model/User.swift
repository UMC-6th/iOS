//
//  User.swift
//  UMCWeek8
//
//  Created by 이승민 on 12/1/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let nickname: String
    let email: String
    
    var initials: String { // 계산속성
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: nickname) {
            formatter.style = .abbreviated // 이름 축약
            return formatter.string(from: components)
        }
        return ""
    }
}

extension User { // 모의 사용자
    static var MOCK_USER = User(id: NSUUID().uuidString, nickname: "모이치", email: "test@gmail.com")
}
