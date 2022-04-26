//
//  ViewController.swift
//  WevAPIPractice
//
//  Created by Apple New on 2022-04-25.
//

import UIKit

class ViewController: UIViewController {
    //======Elements======
//    let url = URL(string: "https://www.apple.com")
    let url = URL(string: "https://api.thecatapi.com/v1/breeds?limit=5")
    lazy var imageView : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "square.and.arrow.up")
        image.widthAnchor.constraint(equalToConstant: 150).isActive = true
        image.heightAnchor.constraint(equalToConstant: 150).isActive = true
        image.backgroundColor = .blue
        return image
    }()

    //======Views======
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fetch()
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
    }

    //======Functione======
    func fetch(){
        guard url != nil, let url = url else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let data = data, let file = String(data: data, encoding: .utf8){
                print(file)
                self?.imageView.image = UIImage(data: data)
            }
        } .resume()
    }
       
}

