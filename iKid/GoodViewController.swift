//
//  GoodViewController.swift
//  iKid
//
//  Created by Haiyi Luo on 4/28/25.
//

import UIKit

class GoodViewController: UIViewController {
    @IBOutlet weak var jokeImageView: UIImageView!
       @IBOutlet weak var nextButton: UIButton!

       var isShowingPunchline = false

       override func viewDidLoad() {
           super.viewDidLoad()

           let startImage = UIImage(named: "g1")
           jokeImageView.image = startImage
           print("Loaded initial image: g1")

           if startImage == nil {
               print("⚠️ Warning: g1 image not found!")
           }

           nextButton.setTitle("Next", for: .normal)
           print("Initialized Next button")
       }

       @IBAction func nextTapped(_ sender: UIButton) {
           let toImageName = isShowingPunchline ? "g1" : "g2"
           let newImage = UIImage(named: toImageName)

           if newImage == nil {
               print("⚠️ Warning: image \(toImageName) not found!")
           } else {
               UIView.transition(with: jokeImageView,
                                 duration: 0.6,
                                 options: .transitionFlipFromRight,
                                 animations: {
                                     self.jokeImageView.image = newImage
                                 },
                                 completion: nil)

               print("Flipped to image: \(toImageName)")
           }

           isShowingPunchline.toggle()
       }
}
