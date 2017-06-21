//
//  ViewController.swift
//  Demo
//
//  Created by 島仁誠 on 2017/04/04.
//  Copyright © 2017年 jinsei shima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOfItems:Int
    {
        set {
            var page:Int?
            if pageControl != nil
            {
                page = currentPage
            }
            pageControl = FlexiblePageControl()
            pageControl.numberOfPages = newValue
            navigationItem.titleView = pageControl
            show()
            pageControl.displayCount = 10
            if page != nil
            {
                currentPage = page!
            }
        }
        
        get {
            return pageControl.numberOfPages
        }
    }
    
    var currentPage:Int {
        
        set {
            pageControl.currentPage = newValue
            show()
        }
        
        get {
            return pageControl.currentPage
        }
        
    }
    
    func show()
    {
        lblCurrentPageNumber.text = "\(currentPage + 1)/\(numberOfItems)"
        lblCurrentPageNumber.sizeToFit()
    }
    
    var pageControl:FlexiblePageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        numberOfItems = 20
        currentPage = 19
//        pageControl.setInitialDotsViewForOutOfBoundsPage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var lblCurrentPageNumber: UILabel!
    @IBAction func btnAdd10Clicked(_ sender: Any) {
        numberOfItems += 10
    }
    @IBAction func btnNextClicked(_ sender: Any) {
        guard currentPage < numberOfItems - 1 else { return }
        currentPage += 1
    }
    @IBAction func btnPrevClicked(_ sender: Any) {
        guard currentPage > 0 else { return }
        currentPage -= 1
        
    }
}
