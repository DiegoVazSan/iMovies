//
//  HomeViewModel.swift
//  iMovies
//
//  Created by Diego Vazquez Sanchez on 05/03/24.
//

import UIKit

class HomeViewModel {
    private weak var view:HomeVC?
    private var router: HomeRouter?
    
    func bind(view: HomeVC, router: HomeRouter) {
        self.view = view
        self.router = router
        ///Bindear router con la vista
        self.router?.setThisSourceView(view)
    }
    
    
    
}
