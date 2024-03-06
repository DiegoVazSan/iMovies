//
//  HomeViewModel.swift
//  iMovies
//
//  Created by Diego Vazquez Sanchez on 05/03/24.
//

import UIKit

class HomeViewModel {
    private var router: HomeRouter?
    
    func bind(router: HomeRouter) {
        self.router = router
    }
    
    
    
}
