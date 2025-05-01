//
//  PunViewController.swift
//  iKid
//
//  Created by Haiyi Luo on 4/28/25.
//
import UIKit

class PunViewController: UIViewController {

    @IBOutlet weak var jokeImageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!

    // 当前是否显示的是 punchline 图
    var isShowingPunchline = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始加载题图 pun1
        let startImage = UIImage(named: "pun1")
        jokeImageView.image = startImage
        print("Loaded initial image: pun1")
        
        if startImage == nil {
            print("⚠️ Warning: pun1 image not found!")
        }
    }

    @IBAction func nextTapped(_ sender: UIButton) {
        let toImageName = isShowingPunchline ? "pun1" : "p2"
        let newImage = UIImage(named: toImageName)
        
        if newImage == nil {
            print("⚠️ Warning: image \(toImageName) not found!")
        } else {
            // 翻转动画（从右向左）
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


