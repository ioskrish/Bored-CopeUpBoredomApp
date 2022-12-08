//
//  ViewController.swift
//  Bored
//
//  Created by TryCatch Classes on 13/10/22.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    //slider components
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var nextbtn: UIButton!
    @IBOutlet weak var skipbtn: UIButton!
    
    //slider vectors image
    var images: [String] = ["1","2","3"]
    var frame = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pagecontrol.numberOfPages = images.count
        setupScreens()

        scrollview.delegate = self
    }
    
    //skip btn action
    @IBAction func newpage(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController1") as! ViewController1
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //next btn action
    @IBAction func nextsrc(_ sender: UIButton) {
        for index in 0..<images.count {
        var frame: CGRect = self.scrollview.frame
            frame.origin.x = scrollview.frame.size.width * CGFloat(index)
            self.scrollview.scrollRectToVisible(frame, animated: true)
            
        }
    }
    
    //scroll running function
    func setupScreens() {
            for index in 0..<images.count {
                frame.origin.x = scrollview.frame.size.width * CGFloat(index)
                frame.size = scrollview.frame.size
                
                let imgView = UIImageView(frame: frame)
                imgView.image = UIImage(named: images[index])
                
                self.scrollview.addSubview(imgView)
            }
            
            scrollview.contentSize = CGSize(width: (scrollview.frame.size.width * CGFloat(images.count)), height: scrollview.frame.size.height)
            scrollview.delegate = self
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let pageNumber = scrollview.contentOffset.x / scrollview.frame.size.width
            pagecontrol.currentPage = Int(pageNumber)
        }


}

