//
//  Item.swift
//  ShareSpaceU
//
//  Created by Nicole on 4/17/24.
//

import Foundation
import SwiftData

enum Layout: String {
    case twoBOneB = "2B1B"
    case twoBTwoB = "2B2B"
    case threeBOneB = "3B1B"
    case threeBTwoB = "3B2B"
    case fourBOneB = "4B1B"
    case fourBTwoB = "4B2B"
    case fourBThreeB = "4B3B"
    case fourBFourB = "4B4B"
}

@Model
final class Item: Identifiable {
    
    var id: String
    var nickName: String
    var gender: String
    var idealRentalArea: String
    var idealRentalPrice: Int
    var idealLayout: Layout
    var restTime: String
    var selfDescription: String
    var hopeRoommatesAre: String
    
    init(nickName: String, gender: String, idealRentalArea: String, idealRentalPrice: Int,
         idealRentalLayOut: Layout, restTime: String, selfDescription: String, hopeRoommatesAre: String) {
        self.id = UUID().uuidString
        self.gender = gender
        self.idealRentalArea = idealRentalArea
        self.idealRentalPrice = idealRentalPrice
        self.idealLayout = idealLayout
        self.restTime = restTime
        self.selfDescription = selfDescription
        self.hopeRoommatesAre = hopeRoommatesAre
    }
}
