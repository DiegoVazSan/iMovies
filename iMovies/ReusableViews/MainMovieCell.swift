//
//  MainMovieCell.swift
//  iMovies
//
//  Created by Diego Vazquez Sanchez on 06/03/24.
//

import Foundation
import UIKit


import UIKit

class MainMovieCell: UITableViewCell {
    
    static let keyID : String = "MovieTableViewCellID"
    
    // Image View
    var movieImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Label
    var movieTitle: UILabel = {
        let label = UILabel()
        // Aquí puedes configurar el contenido de la etiqueta
        // Por ejemplo:
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .black
        
        addSubview(movieImgView)

        addSubview(movieTitle)
        
        NSLayoutConstraint.activate([
            movieImgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            movieImgView.centerYAnchor.constraint(equalTo: centerYAnchor),
            movieImgView.widthAnchor.constraint(equalToConstant: 60),
            movieImgView.heightAnchor.constraint(equalToConstant: 60),
            
            movieTitle.leadingAnchor.constraint(equalTo: movieImgView.trailingAnchor, constant: 8),
            movieTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            movieTitle.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

