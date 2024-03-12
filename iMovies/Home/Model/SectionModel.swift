//
//  SectionModel.swift
//  iMovies
//
//  Created by Diego Vazquez Sanchez on 12/03/24.
//

import RxDataSources

struct SectionModel {
    var header: String
    var items: [Movie]
}

extension SectionModel: SectionModelType {
    init(original: SectionModel, items: [Movie]) {
        self = original
        self.items = items
    }
    
    
}
