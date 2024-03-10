//
//  HomeVC.swift
//  iMovies
//
//  Created by Diego Vazquez Sanchez on 05/03/24.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searcherBarTF: UITextField!
    
    //MARK: - Properties
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    
    let movies : BehaviorRelay<[Movie]> = BehaviorRelay.init(value: [
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
        setupUI()
        tblView.register(MainMovieCell.self, forCellReuseIdentifier: MainMovieCell.keyID)
        
        //Declaracion de la consulta de peliculas
        /// Creamos un observable que emite el texto actualmente ingresado en el txtField, si este es nil obtenemos una cadena vacia
        let movieQuery = searcherBarTF.rx.text.orEmpty
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)///Limitacion del flujo de eventos. establecemos un margen de tiempo de busquedas de 300 milisegundos
            .distinctUntilChanged()///Aseguramos que se emitan eventos SI la consulta a cambiado al ulitmo valor emitido
            .map({
                query in
                self.movies.value.filter({
                    movie in
                    
                    ///Determinamos si la consulta esta vacia o confirmamos si la consulta tiene coincidencias con algun elemento de movies
                    query.isEmpty || movie.name.lowercased().contains(query.lowercased())
                    
                }) ///Vinculamos los resultados de la busqueda a la table view
            }).bind(to: tblView.rx.items(cellIdentifier: MainMovieCell.keyID, cellType: MainMovieCell.self)){ (row, movie, cell) in
                print("La pelicula que conicide con las busqeudas es: \(movie.name)")
                cell.movieTitle.text = movie.name
                cell.movieImgView.image = UIImage.init(named: movie.img)
                cell.selectionStyle = .none
            }
            .disposed(by: disposeBag)
        
        tblView.rx.modelSelected(Movie.self).subscribe(onNext: {
            movieObject in
            
            let moveDetailVC = DetailMovieVC()
            moveDetailVC.imgName.accept(movieObject.img)
            moveDetailVC.titleMovie.accept(movieObject.name)
            self.navigationController?.pushViewController(moveDetailVC, animated: true)
        })
        .disposed(by: disposeBag)
        
        
        tblView.rx.itemSelected.subscribe({
            idxPath in
            print("You did tap cell number \(idxPath)")
        }).disposed(by: disposeBag)
    }
    //MARK: - Navigation
    
    //MARK: - IBActions
    
    //MARK: - Functions
    func setupUI() {
        title = "iMovies"
        
        searcherBarTF.layer.cornerRadius = 8
        searcherBarTF.clipsToBounds = true
        searcherBarTF.layer.shadowColor = UIColor.black.cgColor
        searcherBarTF.layer.shadowOffset = CGSize(width: 0, height: 2)
        searcherBarTF.layer.shadowOpacity = 0.4
        searcherBarTF.layer.shadowRadius = 3
        searcherBarTF.layer.borderWidth = 1
        searcherBarTF.layer.borderColor = UIColor.gray.cgColor
    }
}
//MARK: - Delegates
