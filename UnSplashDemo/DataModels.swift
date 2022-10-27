//
//  DataModels.swift
//  UnSplashDemo
//
//  Created by Manmeet Swach on 2022-10-26.
//

import SwiftUI

struct UnSplashDataModel: Codable {
    let total: Int
    let results: [UnSplashResultDataModel]
}


struct UnSplashResultDataModel: Codable, Identifiable {
    let id: String
    let urls: UnSplashUrlsDataModel
}

struct UnSplashUrlsDataModel: Codable {
    let regular: String
}
