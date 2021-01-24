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
    
    var scrollView = UIScrollView()
    var contentView: UIView!
    var pageControl = UIPageControl()
    
    var imageView1: UIImageView!
    var imageView2: UIImageView!
    var imageView3: UIImageView!
    
    let button = UIButton()
    
    /// 画面の長辺は高さかどうか
    var isHeightLongerThanWidth: Bool {
        get {
            if view.bounds.height > view.bounds.width { return true }
            else { return false }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "SecondVC"
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = rightBarButton
        
        // scrollViewのデリゲートになる
        scrollView.delegate = self
        // メニュー単位のスクロールを可能にする
        scrollView.isPagingEnabled = true
        // 水平方向のスクロールインジケータを非表示にする
        scrollView.showsHorizontalScrollIndicator = false
        
        self.view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView = createContentView()
        scrollView.addSubview(contentView)

        // scrollView上にUIImageViewをページ分追加する(今回は3ページ分)
        imageView1 = self.createImageView(imageName: "luffy")
        imageView2 = self.createImageView(imageName: "zoro")
        imageView3 = self.createImageView(imageName: "nami")
        contentView.addSubview(imageView1)
        contentView.addSubview(imageView2)
        contentView.addSubview(imageView3)
        
        // pageControlの表示位置とサイズの設定
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.backgroundColor = .systemGray6
        pageControl.isUserInteractionEnabled = true
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.addTarget(self, action: #selector(tapPageControl), for: .valueChanged)
        self.view.addSubview(pageControl)

        
        button.setTitle("次へ", for: .normal)
        button.backgroundColor = .link
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        // スクロールビューは正方形で、一辺は画面の長辺に合わせた長さにする
        if isHeightLongerThanWidth {
            NSLayoutConstraint.activate([
                scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2),
                scrollView.widthAnchor.constraint(equalTo: scrollView.heightAnchor),
            ])
        } else {
            NSLayoutConstraint.activate([
                scrollView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
                scrollView.widthAnchor.constraint(equalTo: scrollView.heightAnchor),
            ])
        }
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            // コンテンツビューの幅（スクロール範囲）を制約で決めてしまう
            // スクロール可能にするには下記両方の制約が必要？
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 3),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),

            imageView1.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView1.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            imageView1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageView1.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageView2.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView2.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            imageView2.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor),
            imageView2.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageView3.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView3.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            imageView3.leadingAnchor.constraint(equalTo: imageView2.trailingAnchor),
            imageView3.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: pageControl.bottomAnchor),
        ])

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    /// 画像つきのイメージビューを生成
    func createImageView(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, image: String) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        let image = UIImage(named:  image)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    func createImageView(imageName: String) -> UIImageView {
        return createImageView(x: 0, y: 0, width: 0, height: 0, image: imageName)
    }
    
    func createContentView() -> UIView {
        let contentView = UIView()
        contentView.layer.borderWidth = 1
        contentView.backgroundColor = .systemGray6
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }
    
    @objc
    func tapPageControl() {
        print(#function)
        // MEMO: - scrollView.setContentOffsetでスクロールする
    }
    
    @objc
    func tapButton() {
        let nextVC = TextFieldViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}


// MARK: - UIScrollViewDelegate
// scrollViewのページ移動に合わせてpageControlの表示も移動させる
extension SecondViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
    
}
