//
//  ViewController.swift
//  AnimatedGradient
//
//  Created by Vinay Sharma on 26/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    let color1 = UIColor(red: 209/255, green: 107/255, blue: 165/255, alpha: 1)
    let color2 = UIColor(red: 134/255, green: 168/255, blue: 231/255, alpha: 1)
    let color3 = UIColor(red: 95/255, green: 251/255, blue: 241/255, alpha: 1)
    
    @IBOutlet weak var a: UIButton!
    @IBOutlet weak var b: UIButton!
    @IBOutlet weak var c: UIButton!
    @IBOutlet weak var d: UIButton!
    @IBOutlet weak var e: UIButton!
    @IBOutlet weak var f: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        a.animatedGradient(UIColor.colorSet(3))
        b.animatedGradient(UIColor.colorSet(3))
        c.animatedGradient(UIColor.colorSet(3))
        d.animatedGradient(UIColor.colorSet(3))
        e.animatedGradient(UIColor.colorSet(3))
        f.animatedGradient(UIColor.colorSet(3))
        // Do any additional setup after loading the view.
    }


}

