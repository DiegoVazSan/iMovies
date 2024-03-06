//
//  HomeVC.swift
//  iMovies
//
//  Created by Diego Vazquez Sanchez on 05/03/24.
//

import UIKit

class HomeVC: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var tblView: UITableView!
    
    //MARK: - Properties
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    let movies : [String] = [
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
    ]

    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        //viewModel.bind(router: router)
    }
    
    //MARK: - Navigation
    
    //MARK: - IBActions
    
    //MARK: - Functions
    
    
}
//MARK: - Delegates
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        cell?.textLabel?.text = movies[indexPath.row]
        return cell ?? UITableViewCell()
    }
}
