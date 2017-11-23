//
//  PictureViewController.swift
//  NetworkProject
//
//  Created by everp2p on 2017/9/26.
//  Copyright © 2017年 TangLiHua. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {
    
    var string: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.title = "页面B"
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height*0.7)
        let imageUrl = URL(string: self.string!)
        let imageData = try?Data(contentsOf: imageUrl!)
        imageView.image = UIImage(data: imageData!)
        self.view.addSubview(imageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
