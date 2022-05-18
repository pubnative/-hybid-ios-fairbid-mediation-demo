// For FairBid SDK Mediation Banner integration, simply just follow FairBid's documentation.
// FairBid Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import FairBidSDK

class Banner: UIViewController {

    @IBOutlet weak var bannerAdContainer: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let adUnitID = "704853"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "FairBid Mediation Banner"
    }

    @IBAction func loadAdTouchUpInside(_ sender: UIButton) {
        activityIndicator.startAnimating()
        bannerAdContainer.isHidden = true
        FYBBanner.delegate = self
        let bannerOptions = FYBBannerOptions()
        bannerOptions.placementId = adUnitID
        FYBBanner.show(in: self.bannerAdContainer, position: .bottom, options: bannerOptions)
    }
}

extension Banner: FYBBannerDelegate {
    
    func bannerDidLoad(_ banner: FYBBannerAdView) {
        bannerAdContainer.isHidden = false
        activityIndicator.stopAnimating()
    }
    
    func bannerDidFail(toLoad placementId: String, withError error: Error) {
        activityIndicator.stopAnimating()
        print("Failed to load banner ad with error: \(error.localizedDescription)")
    }
    
    func bannerDidShow(_ banner: FYBBannerAdView, impressionData: FYBImpressionData) {
        print("bannerDidShow")
    }
    
    func bannerDidClick(_ banner: FYBBannerAdView){
        print("bannerDidClick")
    }
    
    func bannerWillPresentModalView(_ banner: FYBBannerAdView) {
        print("bannerWillPresentModalView")
    }
    
    func bannerDidDismissModalView(_ banner: FYBBannerAdView) {
        print("bannerDidDismissModalView")
    }
    
    func bannerWillLeaveApplication(_ banner: FYBBannerAdView) {
        print("bannerWillLeaveApplication")
    }
    
    func banner(_ banner: FYBBannerAdView, didResizeToFrame frame: CGRect) {
        
    }
    
    func bannerWillRequest(_ placementId: String) {
        print("bannerWillRequest")
    }
}
