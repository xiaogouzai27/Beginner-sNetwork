//
//  ViewController.swift
//  NetworkProject
//
//  Created by everp2p on 2017/9/26.
//  Copyright © 2017年 TangLiHua. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {

    var data: [String] = [] //String类型的数组，存储图片的地址
    var scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white
        self.title = "页面A"
        
        getMyPictures()
        
        scrollView.frame = CGRect(x: 20, y:20, width: self.view.frame.width - 40, height: self.view.frame.height - 100)
        self.view.addSubview(scrollView)
        
    }
    func getMyPictures() {
        Alamofire.request("https://static1.bcjiaoyu.com/swiftHighLesson.json", method: .get) .responseJSON { (response) in
            if let j = response.result.value {
                let JSONDictory = JSON(j)
                print(JSONDictory)
                
                self.scrollView.contentSize = CGSize(width: self.view.frame.width - 40, height: CGFloat(JSONDictory.count/2*(200+30)))
                
                var i = 0
                let width = Int(self.view.frame.width-60)/2
                for (key, subJson) in JSONDictory {
                    print(key, subJson)
                    let imageName = String(describing: subJson["image"])
                    let imageUrl = URL.init(string: imageName)
                    let imageData = try? Data.init(contentsOf: imageUrl!)
                    self.data.append(imageName)
                    let image = UIImage(data: imageData!)
                    
                    let button = UIButton(type: UIButtonType.custom)
                    button.setImage(image, for: UIControlState.normal)
                    button.frame = CGRect(x: i%2*(width+20), y: i/2*(200+30), width: width, height:200)
                    button.tag = i;
                    button.layer.masksToBounds = true
                    button.layer.cornerRadius = 10
                    button.addTarget(self, action: #selector(self.clickImage), for: UIControlEvents.touchUpInside)
                    
                    let label = UILabel()
                    label.frame = CGRect(x: i%2*(width+20), y: i/2*(200+30)+200, width:width, height:30)
                    label.text = "第"+String(i+1)+"张照片"
                    label.textAlignment = NSTextAlignment.center
                    
                    self.scrollView.addSubview(button)
                    self.scrollView.addSubview(label)
                    i += 1
                }
            }
        }
    }
    func clickImage(button:UIButton) {
        let nextPage = PictureViewController()
        nextPage.string = self.data[button.tag]
        self.navigationController?.pushViewController(nextPage, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

