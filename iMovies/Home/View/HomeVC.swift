//
//  HomeVC.swift
//  iMovies
//
//  Created by Diego Vazquez Sanchez on 05/03/24.
//

import UIKit

class HomeVC: UIViewController {
    //MARK: - Outlets
    
    //MARK: - Properties
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
    }
    
    //MARK: - Navigation
    
    //MARK: - IBActions
    
    //MARK: - Functions
    
    
}
//MARK: - Delegates
