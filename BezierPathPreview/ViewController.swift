//
//  ViewController.swift
//  BezierPathPreview
//
//  Created by kum-ap on 2017/08/07.
//  Copyright © 2017年 kum-ap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var drawLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.lightGray.cgColor
        layer.strokeColor = UIColor.black.cgColor
        layer.lineWidth = 3
        self.view.layer.addSublayer(layer)
        return layer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updatePath()
    }

    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        if (sender.state != .changed) {
            return
        }
        let center = sender.location(in: self.view)
        sender.view!.frame = CGRect(origin: center, size: CGSize.zero).insetBy(dx: -20, dy: -20)
        self.updatePath()
    }
    
    func updatePath() -> Void {
        let startPoint = self.center(rect: self.view.viewWithTag(1)!.frame)
        let endPoint = self.center(rect: self.view.viewWithTag(2)!.frame)
        let ctrlPoint1 = self.center(rect: self.view.viewWithTag(3)!.frame)
        let ctrlPoint2 = self.center(rect: self.view.viewWithTag(4)!.frame)
        
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addCurve(to: endPoint, controlPoint1: ctrlPoint1, controlPoint2: ctrlPoint2)
        
        self.drawLayer.path = path.cgPath
    }
    
    func center(rect: CGRect) -> CGPoint {
        return CGPoint(x: rect.midX, y: rect.midY)
    }
}

