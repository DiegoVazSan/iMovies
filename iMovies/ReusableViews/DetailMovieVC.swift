//
//  DetailMovieVC.swift
//  iMovies
//
//  Created by Diego Vazquez Sanchez on 06/03/24.
//

import UIKit

class DetailMovieVC: UIViewController {
    //MARK: - Properties
    var mainImgView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "tuImagen"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var titleLbl: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Título"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    var reviewLbl: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Descripción"
        descriptionLabel.font = UIFont.systemFont(ofSize: 18)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Navigation
    
    
    //MARK: - Functions
    private func setupUI(){
        self.view.backgroundColor = .white
        
        view.addSubview(mainImgView)
        view.addSubview(titleLbl)
        view.addSubview(reviewLbl)
        
        NSLayoutConstraint.activate([
            
            mainImgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImgView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            titleLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLbl.topAnchor.constraint(equalTo: mainImgView.bottomAnchor, constant: 20),
            
            reviewLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reviewLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 20),
            reviewLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            reviewLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func configureThis(movieImg: String, movieTitle: String, movieReview: String){
        self.mainImgView.image = UIImage(named: movieImg)
        self.titleLbl.text = movieTitle
        self.reviewLbl.text = movieReview
    }
    
}
//MARK: - Delegates

