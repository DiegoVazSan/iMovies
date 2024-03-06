//
//  HomeVC.swift
//  iMovies
//
//  Created by Diego Vazquez Sanchez on 05/03/24.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: UIViewController, UITableViewDelegate {
    //MARK: - Outlets
    
    @IBOutlet weak var tblView: UITableView!
    
    //MARK: - Properties
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    
    let movies : Observable<[Movie]> = Observable.just([
        Movie.init(name: "Avatar, the way of water", img: "avatar"),
        Movie.init(name: "The Batman", img: "batman"),
        Movie.init(name: "Forest Gump", img: "forest"),
        Movie.init(name: "Gladiator", img: "gladiator"),
        Movie.init(name: "Pulp Fiction by Quentin Tarantino", img: "pulpF")
    ])
    let disposeBag = DisposeBag()
    
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        movies
            .bind(to: tblView.rx.items(cellIdentifier: "myCell", cellType: UITableViewCell.self)){ (row, movie, cell) in
                cell.textLabel?.text = movie.name
            }
            .disposed(by: disposeBag)
        
    }
    //MARK: - Navigation
    
    //MARK: - IBActions
    
    //MARK: - Functions
}
//MARK: - Delegates
