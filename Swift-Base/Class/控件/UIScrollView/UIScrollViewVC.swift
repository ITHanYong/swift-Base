//
//  UIScrollViewVC.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/7.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import Masonry

class UIScrollViewVC: UIViewController, UIScrollViewDelegate {
    
    var pageControl: UIPageControl!
    var imageArray: Array<String>!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.title = "UIScrollView"
        self.view.backgroundColor = UIColor.white
        
        let item = UIBarButtonItem.barButtonItemTaget(target: self, acton: #selector(back), imageNormal: "back_white_1", imageHighlighted: "back_white_1")
        self.navigationItem.leftBarButtonItem = item
        
        imageArray = ["scrollImage_1","scrollImage_2","scrollImage_3"]
        
        setupScrollView()
        setuppageControl()
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupScrollView() {
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: SCREENW, height: SCREENH))
        self.view.addSubview(scrollView)
        
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
        } else {
            // Fallback on earlier versions
        }
        
        scrollView.backgroundColor = UIColor.clear
        
        //设置分页
        scrollView.isPagingEnabled = true
        
        for index in 0..<imageArray.count {
            //创建imageView
            let imageView = UIImageView(frame: CGRect(x: CGFloat(index)*SCREENW, y: 0, width: SCREENW, height: SCREENH-NavHeight(self)))
            imageView.image = UIImage(named: imageArray[index])
            imageView.contentMode = .scaleAspectFit
            imageView.backgroundColor = UIColor.clear
            scrollView.addSubview(imageView)
        }
        
        // 设置内容区域
        scrollView.contentSize = CGSize(width: scrollView.frame.width*CGFloat(imageArray.count), height: scrollView.frame.height)
        scrollView.delegate = self
        scrollView.isDirectionalLockEnabled = false
        
        // 垂直
        scrollView.alwaysBounceVertical = false
        // 水平
        scrollView.alwaysBounceHorizontal = false
        
        // 设置滚动条
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    func setuppageControl() {
        
        pageControl = UIPageControl(frame: CGRect(x: 0, y: SCREENH-NavHeight(self)-100, width: SCREENW, height: 20))
        pageControl.numberOfPages = imageArray.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.blue
        pageControl.pageIndicatorTintColor = UIColor.orange
        self.view.addSubview(pageControl)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
