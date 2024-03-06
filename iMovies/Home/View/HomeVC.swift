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
    let movies : Observable<[String]> = Observable.just([
        "El Padrino",
        "El Señor de los Anillos: El retorno del Rey",
        "Titanic",
        "Star Wars: Episodio IV - Una nueva esperanza",
        "El Rey León",
        "Forrest Gump",
        "La lista de Schindler",
        "Matrix",
        "El Caballero de la Noche",
        "El Resplandor",
        "Parásitos",
        "Jurassic Park",
        "Avatar",
        "El Señor de los Anillos: La Comunidad del Anillo",
        "Gladiador",
        "Pulp Fiction",
        "La Guerra de las Galaxias: Episodio V - El Imperio Contraataca",
        "Volver al Futuro",
        "Mujer Maravilla",
        "Toy Story"
    ])
    let disposeBag = DisposeBag()
    
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        movies
            .bind(to: tblView.rx.items(cellIdentifier: "myCell", cellType: UITableViewCell.self)){ (row, movie, cell) in
                cell.textLabel?.text = movie
            }
            .disposed(by: disposeBag)
        //MARK: - Navigation
        
        //MARK: - IBActions
        
        //MARK: - Functions
        
    }
}
//MARK: - Delegates
