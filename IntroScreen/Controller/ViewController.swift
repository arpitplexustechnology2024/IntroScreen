//
//  SceneDelegate.swift
//  IntroScreen
//
//  Created by Arpit iOS Dev. on 09/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    private var onboardingSlides: [OnboardingModel] = []
    private var currentPage = 0 {
        didSet {
            updateCurrentPage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        self.nextButton.layer.cornerRadius = self.nextButton.frame.height / 2
    }
    
    private func setupUI() {
//        onboardingSlides = [
//            OnboardingModel(title: "Choose any one Funny card",
//                            description: "Thousands of cards to teasing your friends, groups, families, lovers.",
//                            image: UIImage(named: "Intro01")!),
//            OnboardingModel(title: "Fill the information for which you want to make the card",
//                            description: "Enter the funny information of the card you want to make and if you get confused.",
//                            image: UIImage(named: "Intro02")!),
//            OnboardingModel(title: "Save or share the created funny card",
//                            description: "Challenge someone else to create your funny card",
//                            image: UIImage(named: "Intro03")!)
//        ]
        
        onboardingSlides = [
            OnboardingModel(title: "Select Your Funney  Card",
                            description: "The entertainment industry as a whole has give more thought to the pollution of rivers than it has to the pollution of minds.",
                            image: UIImage(named: "Intro01")!),
            OnboardingModel(title: "Fill Your Information",
                            description: "The entertainment industry as a whole has give more thought to the pollution of rivers than it has to the pollution of minds.",
                            image: UIImage(named: "Intro02")!),
            OnboardingModel(title: "Your Favorite card Edit, Save & Share",
                            description: "The entertainment industry as a whole has give more thought to the pollution of rivers than it has to the pollution of minds.",
                            image: UIImage(named: "Intro03")!)
        ]
        
        pageControl.numberOfPages = onboardingSlides.count
    }
    
    private func updateCurrentPage() {
        pageControl.currentPage = currentPage
        
        nextButton.setTitle(
            currentPage == onboardingSlides.count - 1 ? "Done" : "Next" ,
            for: .normal)
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        currentPage == onboardingSlides.count - 1 ? print("Done") : moveToNext()
    }
    
    private func moveToNext() {
        currentPage += 1
        let indexPath = IndexPath(item: currentPage, 
                                  section: 0)
        collectionView.scrollToItem(at: indexPath, 
                                    at: .centeredHorizontally,
                                    animated: true)
    }

}

//MARK: - UICollectionView DataSource
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingSlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionCell.identifier,
                                                      for: indexPath) as! OnboardingCollectionCell
        cell.setupCell(onboardingSlides[indexPath.row])
        return cell
    }
}

//MARK: - UICollectionView Delegates
extension ViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

//MARK: - UICollectionView Delegate FlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width,
                      height: collectionView.frame.height)
    }
}

