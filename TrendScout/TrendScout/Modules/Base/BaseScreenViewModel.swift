//
//  BaseScreenViewModel.swift
//  TrendScout
//
//  Created by Abhishek Dogra on 23/07/24.
//

import Foundation

struct BaseDataModel: Equatable {
    let tabTitle: String
}

class BaseScreenViewModel: ObservableObject {
    @Published var baseModel: [BaseDataModel] = []
    
    
    func fetchData(for tab: MenuOptions) {
        switch tab {
        case .clothes:
            baseModel = [BaseDataModel(tabTitle: "Men"), BaseDataModel(tabTitle: "Women"),
                         BaseDataModel(tabTitle: "Kids"), BaseDataModel(tabTitle: "Plus Size"),
                         BaseDataModel(tabTitle: "Teens")]
        case .jewellery:
            baseModel = [BaseDataModel(tabTitle: "Rings"), BaseDataModel(tabTitle: "Bracelets"),
                         BaseDataModel(tabTitle: "Necklace"), BaseDataModel(tabTitle: "Earrings")]
        case .accessories:
            baseModel = [BaseDataModel(tabTitle: "Gadgets"), BaseDataModel(tabTitle: "Handbags"),
                         BaseDataModel(tabTitle: "Sunglasses"), BaseDataModel(tabTitle: "Mobile"),
                         BaseDataModel(tabTitle: "Luggages")]
        case .premium:
            baseModel = [BaseDataModel(tabTitle: "Dolec & Gabta"), BaseDataModel(tabTitle: "Edel"),
                         BaseDataModel(tabTitle: "Jacod Dohem"), BaseDataModel(tabTitle: "Frula"),
                         BaseDataModel(tabTitle: "Lacosde")]
        default:
            break
        }
    }
}
