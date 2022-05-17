//
//  OnBoardingViewController.swift
//  JobSeek
//
//  Created by Modhawadiya Jay on 04/05/22.
//

import UIKit

class OnBoardingViewController: UIViewController, Storyboarded {
    
    // MARK: - Variables
    var screensArray: [Screen] = [Screen]()
    var coordinator: OnBoardingCoordinator?
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnSkip: ButtonLightGrey!
    @IBOutlet weak var btnNext: SignUpLogInButtons!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        loadArray()
    }
    
    // MARK: - Functions
    func loadArray() {
        screensArray.append(Screen(image: UIImage(named: "OnBoardingFirstScreen") ?? UIImage(),imageBackground: UIColor(named: "BGFirstOnBoarding") ?? UIColor(), title: "Search your job", subTitle: "Figure out your top five priorities whether it is company culture, salary."))
        screensArray.append(Screen(image: UIImage(named: "OnBoardingSecondScreen") ?? UIImage(), imageBackground: UIColor(named: "BGSecondOnBoarding") ?? UIColor(), title: "Browse jobs list", subTitle: "Our job list include several  industries, so you can find the best job for you."))
        screensArray.append(Screen(image: UIImage(named: "OnBoardingThirdScreen") ?? UIImage(), imageBackground: UIColor(named: "BGThirdOnBoarding") ?? UIColor(), title: "Apply to best jobs", subTitle: "You can apply to your desirable jobs very quickly and easily with ease."))
        screensArray.append(Screen(image: UIImage(named: "OnBoardingFourthScreen") ?? UIImage(), imageBackground: UIColor(named: "BGFourthOnBoarding") ?? UIColor(), title: "Make your career", subTitle: "We help you find your dream job based on your skillset, location, demand."))
    }
    
    //MARK: - Actions
    @IBAction func btnNextPressed(_ sender: SignUpLogInButtons) {
        let visibleItems: NSArray = self.collectionView.indexPathsForVisibleItems as NSArray
        if let currentItem: IndexPath = visibleItems.object(at: 0) as? IndexPath {
            let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
            if nextItem.row < screensArray.count {
                self.collectionView.scrollToItem(at: nextItem, at: .left, animated: true)
            } else {
                coordinator?.startAuthentication()
            }
        }
    }
    
    @IBAction func btnSkip(_ sender: ButtonLightGrey) {
        coordinator?.startAuthentication()
    }
    
} // End of Class

// MARK: - UICollectionViewDataSource
extension OnBoardingViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = screensArray.count
        return screensArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? OnBoardingCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.imgPoster.image = screensArray[indexPath.row].image
        cell.imgPoster.backgroundColor = screensArray[indexPath.row].imageBackground
        cell.lblTitle.text = screensArray[indexPath.row].title
        cell.lblName.text = screensArray[indexPath.row].subTitle
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.tag == 0) {
            let center = CGPoint(x: scrollView.contentOffset.x + (scrollView.frame.width/2), y: (scrollView.frame.height/2))
            if let indexPath = self.collectionView.indexPathForItem(at: center) {
                self.pageControl.currentPage = indexPath.row
                btnSkip.isHidden = indexPath.row == screensArray.count - 1 ? true : false
                btnNext.titleLabel?.text = indexPath.row == screensArray.count - 1 ? "Explore" : "Next"
            }
        }
    }
    
} // End of Extension

// MARK: - UICollectionViewDelegateFlowLayout
extension OnBoardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionHeight = collectionView.bounds.height
        let cellWidth = UIScreen.main.bounds.width
        return CGSize(width: cellWidth, height: collectionHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }
    
} // End of Extension
