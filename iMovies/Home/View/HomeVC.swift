//
//  HomeVC.swift
//  iMovies
//
//  Created by Diego Vazquez Sanchez on 05/03/24.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class HomeVC: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searcherBarTF: UITextField!
    
    //MARK: - Properties
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    
    
    let tblViewItemsSectioned = BehaviorRelay.init(value: [
        SectionModel(header: "Disney Movies", items: [Movie.init(name: "Avatar, the way of water", img: "avatar"),
                                                      Movie.init(name: "Thor", img: "thor"),
                                                      Movie.init(name: "Capitan America", img: "ca"),
                                                      Movie.init(name: "Spiderman", img: "spider"),
                                                      Movie.init(name: "Guardians Of The Galaxy", img: "guardians"),
                                                      Movie.init(name: "dardevil", img: "Daredevil"),
                                                      Movie.init(name: "Punisher", img: "punisher")]),
        SectionModel(header: "Adventure", items: [Movie.init(name: "The Batman", img: "batman"),
                                                  Movie.init(name: "Forest Gump", img: "forest"),
                                                  Movie.init(name: "Gladiator", img: "gladiator"),
                                                  Movie.init(name: "Pulp Fiction by Quentin Tarantino", img: "pulpF"),
                                                  Movie.init(name: "Terminator", img: "terminator"),
                                                  Movie.init(name: "Rambo", img: "Rambo")])
    ])
    
    let disposeBag = DisposeBag()
    
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel>(configureCell: {
        ds, tv, ip, item in
        let cell : MainMovieCell = tv.dequeueReusableCell(withIdentifier: MainMovieCell.keyID, for: ip) as! MainMovieCell
        cell.movieTitle.text = item.name
        cell.movieImgView.image = UIImage(named: item.img)
        cell.selectionStyle = .none
        return cell
    },
       titleForHeaderInSection: {
        ds, idx in
        return ds.sectionModels[idx].header
    })
    
    
    
    
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
                
                self.tblViewItemsSectioned.value.map({
                    sectionModel in
                    SectionModel(header: sectionModel.header, items: sectionModel.items.filter({
                        movie in
                        query.isEmpty || movie.name.lowercased().contains(query.lowercased())
                    }))
                    
                })
                ///Vinculamos los resultados de la busqueda a la table view
            }).bind(to: tblView
                .rx
                .items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        tblView.rx.modelSelected(Movie.self)
            .debug("MyTest")
            .subscribe(onNext: {
            movieObject in
            
            let moveDetailVC = DetailMovieVC()
            moveDetailVC.imgName.accept(movieObject.img)
            moveDetailVC.titleMovie.accept(movieObject.name)
            self.navigationController?.pushViewController(moveDetailVC, animated: true)
        })
        .disposed(by: disposeBag)
        
        
        tblView.rx.itemSelected.subscribe({
            idxPath in
//            print("You did tap cell number \(idxPath)")
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
