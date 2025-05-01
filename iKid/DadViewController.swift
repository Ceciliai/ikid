//
//  DadViewController.swift
//  iKid
//
//  Created by Haiyi Luo on 4/28/25.
//

import UIKit

class DadViewController: UIViewController {

    @IBOutlet weak var jokeImageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!

    // 图片名称数组
    let knockKnockImages = ["k1", "k2", "k3", "k4", "k5"]
    var currentStep = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        if let firstImage = UIImage(named: knockKnockImages[0]) {
            jokeImageView.image = firstImage
            print("Loaded initial Knock Knock image: \(knockKnockImages[0])")
        } else {
            print("⚠️ Initial image not found!")
        }

        nextButton.setTitle("Next", for: .normal)
    }

    @IBAction func nextTapped(_ sender: UIButton) {
        // 增加步骤
        currentStep += 1

        if currentStep >= knockKnockImages.count {
            // 可选：翻完后循环回第1张
            currentStep = 0
            print("Restarting Knock Knock sequence")
        }

        let nextImageName = knockKnockImages[currentStep]
        if let newImage = UIImage(named: nextImageName) {
            UIView.transition(with: jokeImageView,
                              duration: 0.6,
                              options: .transitionFlipFromRight,
                              animations: {
                                  self.jokeImageView.image = newImage
                              },
                              completion: nil)

            print("Flipped to Knock Knock image: \(nextImageName)")
        } else {
            print("⚠️ Image not found: \(nextImageName)")
        }
    }
}
