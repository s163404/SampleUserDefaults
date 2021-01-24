//
//  SecondViewController.swift
//  SampleUserDefaults
//
//  Created by 冨田康介 on 2021/01/12.
//  Copyright © 2021 kosuketomita. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let rightBarButton = UIBarButtonItem(title: "右", style: .plain, target: nil, action: nil)
    let leftBarButton = UIBarButtonItem(title: "左", style: .plain, target: nil, action: nil)
    
    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    
    var imageView1: UIImageView!
    var imageView2: UIImageView!
    var imageView3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        navigationItem.title = "SecondVC"
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = rightBarButton
        
        // scrollViewの画面表示サイズを指定
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: 200))
        // scrollViewのサイズを指定（幅は1メニューに表示するViewの幅×ページ数）
        scrollView.contentSize = CGSize(width: self.view.frame.size.width*3, height: 200)
        // scrollViewのデリゲートになる
        scrollView.delegate = self
        // メニュー単位のスクロールを可能にする
        scrollView.isPagingEnabled = true
        // 水平方向のスクロールインジケータを非表示にする
        scrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollView)
        
        // scrollView上にUIImageViewをページ分追加する(今回は3ページ分)
        imageView1 = self.createImageView(imageName: "luffy")
        imageView2 = self.createImageView(imageName: "zoro")
        imageView3 = self.createImageView(imageName: "nami")
        imageView1.contentMode = .scaleAspectFit
        imageView2.contentMode = .scaleAspectFit
        imageView3.contentMode = .scaleAspectFit
        scrollView.addSubview(imageView1)
        scrollView.addSubview(imageView2)
        scrollView.addSubview(imageView3)
        
        // pageControlの表示位置とサイズの設定
        pageControl = UIPageControl(frame: CGRect(x: 0, y: 370, width: self.view.frame.size.width, height: 30))
        // pageControlのページ数を設定
        pageControl.numberOfPages = 3
        // pageControlのドットの色
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        // pageControlの現在のページのドットの色
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    // UIImageViewを生成
    func createImageView(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, image: String) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        let image = UIImage(named:  image)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    func createImageView(imageName: String) -> UIImageView {
        return createImageView(x: 0, y: 0, width: 0, height: 0, image: imageName)
    }
}

// scrollViewのページ移動に合わせてpageControlの表示も移動させる
extension SecondViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
    
}
