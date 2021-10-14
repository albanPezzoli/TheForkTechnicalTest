//
//  RankView.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 14/10/2021.
//

import UIKit

final class RankView: UIView {
    private let rankImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "ta-bubbles-empty")
        return imageView
    }()

    private let rankImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "ta-bubbles-empty")
        return imageView
    }()

    private let rankImageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "ta-bubbles-empty")
        return imageView
    }()

    private let rankImageView4: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "ta-bubbles-empty")
        return imageView
    }()

    private let rankImageView5: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "ta-bubbles-empty")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        self.addSubview(rankImageView1)
        self.addSubview(rankImageView2)
        self.addSubview(rankImageView3)
        self.addSubview(rankImageView4)
        self.addSubview(rankImageView5)
        
        
        // Constraint restaurant Image
        rankImageView1.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        rankImageView1.heightAnchor.constraint(equalToConstant: 10).isActive = true
        rankImageView1.widthAnchor.constraint(equalToConstant: 10).isActive = true
        rankImageView1.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        rankImageView1.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        // Constraint restaurant Image
        rankImageView2.leadingAnchor.constraint(equalTo: rankImageView1.trailingAnchor, constant: 2).isActive = true
        rankImageView2.heightAnchor.constraint(equalToConstant: 10).isActive = true
        rankImageView2.widthAnchor.constraint(equalToConstant: 10).isActive = true
        rankImageView2.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        rankImageView2.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        // Constraint restaurant Image
        rankImageView3.leadingAnchor.constraint(equalTo: rankImageView2.trailingAnchor, constant: 2).isActive = true
        rankImageView3.heightAnchor.constraint(equalToConstant: 10).isActive = true
        rankImageView3.widthAnchor.constraint(equalToConstant: 10).isActive = true
        rankImageView3.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        rankImageView3.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        // Constraint restaurant Image
        rankImageView4.leadingAnchor.constraint(equalTo: rankImageView3.trailingAnchor, constant: 2).isActive = true
        rankImageView4.heightAnchor.constraint(equalToConstant: 10).isActive = true
        rankImageView4.widthAnchor.constraint(equalToConstant: 10).isActive = true
        rankImageView4.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        rankImageView4.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        // Constraint restaurant Image
        rankImageView5.leadingAnchor.constraint(equalTo: rankImageView4.trailingAnchor, constant: 2).isActive = true
        rankImageView5.heightAnchor.constraint(equalToConstant: 10).isActive = true
        rankImageView5.widthAnchor.constraint(equalToConstant: 10).isActive = true
        rankImageView5.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        rankImageView5.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        rankImageView5.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func setRankValue(value: Double) {
        let index = Int(value.rounded(.down))
        
        if index == 0 {
            rankImageView1.image = #imageLiteral(resourceName: "ta-bubbles-empty")
            rankImageView2.image = #imageLiteral(resourceName: "ta-bubbles-empty")
            rankImageView3.image = #imageLiteral(resourceName: "ta-bubbles-empty")
            rankImageView4.image = #imageLiteral(resourceName: "ta-bubbles-empty")
            rankImageView5.image = #imageLiteral(resourceName: "ta-bubbles-empty")
        } else if index == 1 {
            rankImageView1.image = #imageLiteral(resourceName: "ta-bubbles-full")
            rankImageView2.image = #imageLiteral(resourceName: "ta-bubbles-empty")
            rankImageView3.image = #imageLiteral(resourceName: "ta-bubbles-empty")
            rankImageView4.image = #imageLiteral(resourceName: "ta-bubbles-empty")
            rankImageView5.image = #imageLiteral(resourceName: "ta-bubbles-empty")
        } else if index == 2 {
            rankImageView1.image = #imageLiteral(resourceName: "ta-bubbles-full")
            rankImageView2.image = #imageLiteral(resourceName: "ta-bubbles-full")
            rankImageView3.image = #imageLiteral(resourceName: "ta-bubbles-empty")
            rankImageView4.image = #imageLiteral(resourceName: "ta-bubbles-empty")
            rankImageView5.image = #imageLiteral(resourceName: "ta-bubbles-empty")
        } else if index == 3 {
            rankImageView1.image = #imageLiteral(resourceName: "ta-bubbles-full")
            rankImageView2.image = #imageLiteral(resourceName: "ta-bubbles-full")
            rankImageView3.image = #imageLiteral(resourceName: "ta-bubbles-full")
            rankImageView4.image = #imageLiteral(resourceName: "ta-bubbles-empty")
            rankImageView5.image = #imageLiteral(resourceName: "ta-bubbles-empty")
        } else if index == 4 {
            rankImageView1.image = #imageLiteral(resourceName: "ta-bubbles-full")
            rankImageView2.image = #imageLiteral(resourceName: "ta-bubbles-full")
            rankImageView3.image = #imageLiteral(resourceName: "ta-bubbles-full")
            rankImageView4.image = #imageLiteral(resourceName: "ta-bubbles-full")
            rankImageView5.image = #imageLiteral(resourceName: "ta-bubbles-empty")
        } else if index == 5 {
            rankImageView1.image = #imageLiteral(resourceName: "ta-bubbles-full")
            rankImageView2.image = #imageLiteral(resourceName: "ta-bubbles-full")
            rankImageView3.image = #imageLiteral(resourceName: "ta-bubbles-full")
            rankImageView4.image = #imageLiteral(resourceName: "ta-bubbles-full")
            rankImageView5.image = #imageLiteral(resourceName: "ta-bubbles-full")
        }
        
        
        let decimal = value.truncatingRemainder(dividingBy: 1)
        
        if decimal != 0 {
            if index == 0 {
                rankImageView1.image = #imageLiteral(resourceName: "ta-bubbles-half")
            } else if index == 1 {
                rankImageView2.image = #imageLiteral(resourceName: "ta-bubbles-half")
            } else if index == 2 {
                rankImageView3.image = #imageLiteral(resourceName: "ta-bubbles-half")
            } else if index == 3 {
                rankImageView4.image = #imageLiteral(resourceName: "ta-bubbles-half")
            } else if index == 4 {
                rankImageView5.image = #imageLiteral(resourceName: "ta-bubbles-half")
            }
        }
    }
}

