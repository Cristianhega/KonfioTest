//
//  DetailViewCell.swift
//  KonfioApp
//
//  Created by Cristian Hernandez Garcia on 30/10/23.
//

import UIKit

class DetailViewCell: UITableViewCell {
    
    let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = .ten
        return view
    }()
    
    let photoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = .ten
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: .twenty)
        label.textColor = UIColor(hex: Constants.darkGray)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: .fifteen)
        label.textColor = UIColor(hex: Constants.mediumGray)
        label.numberOfLines = Int(.five)
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: .fifteen)
        label.textColor = UIColor(hex: Constants.darkGray)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor(hex: Constants.lightGray)
        addSubview(whiteView)
        addSubview(photoView)
        whiteView.addSubview(nameLabel)
        whiteView.addSubview(descriptionLabel)
        whiteView.addSubview(ageLabel)
        
        NSLayoutConstraint.activate([
            whiteView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .twenty),
            whiteView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.twenty),
            whiteView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.ten),
            whiteView.topAnchor.constraint(equalTo: topAnchor, constant: .fifty),
            
            photoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .twenty),
            photoView.topAnchor.constraint(equalTo: topAnchor, constant: .ten),
            photoView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.ten),
            photoView.widthAnchor.constraint(equalToConstant: .oneHundredTwenty),
            
            nameLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: .ten),
            nameLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: .oneHundredThirty),
            nameLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -.ten),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: .ten),
            descriptionLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: .oneHundredThirty),
            descriptionLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -.ten),
            
            ageLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: .ten),
            ageLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: .oneHundredThirty),
            ageLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -.ten)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
