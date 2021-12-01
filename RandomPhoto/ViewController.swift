//
//  ViewController.swift
//  RandomPhoto
//
//  Created by krittinon phruekakkharakun on 1/12/2564 BE.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        //img frame
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        // set title normal state
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // change bg color
        view.backgroundColor = .systemCyan
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton),
                         for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    //colors array
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemGreen,
        .systemYellow,
        .systemPurple,
        .systemOrange
    ]
    
    //button func
    @objc func didTapButton() {
        getRandomPhoto()
        //random bg color when tap
        view.backgroundColor = colors.randomElement()
    }
    
    // call safe area
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 20,
                              y: view.frame.size
                                .height-150-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-60,
                              height: 55
        )
    }

    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        // convert string
        //! to indicate swift to swift know for a fact this url is valid
        let url = URL(string: urlString)!
        //get content of the url
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        //assign image view image property this ui image
        imageView.image = UIImage(data: data)
    }

}

