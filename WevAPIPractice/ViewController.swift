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

    //======Views======
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fetch()
    }

    //======Functione======
    func fetch(){
        guard url != nil, let url = url else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let file = String(data: data, encoding: .utf8){
                print(file)
            }
        }
    }
}

