// For FairBid SDK Mediation Rewarded integration, simply just follow FairBid's documentation.
// FairBid Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import FairBidSDK

class Rewarded: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var showAdButton: UIButton!
    
    let adUnitID = "197406"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "FairBid Mediation Rewarded"
        activityIndicator.stopAnimating()
    }
    
    @IBAction func loadAdTouchUpInside(_ sender: UIButton) {
        activityIndicator.startAnimating()
        showAdButton.isHidden = true
        FYBRewarded.delegate = self
        FYBRewarded.request(adUnitID)
    }
    
    @IBAction func showAdTouchUpInside(_ sender: UIButton) {
        if (FYBRewarded.isAvailable(adUnitID)) {
            FYBRewarded.show(adUnitID)
        } else {
            print("Ad wasn't ready")
        }
    }
}

extension Rewarded: FYBRewardedDelegate {
    
    func rewardedIsAvailable(_ placementName: String) {
        showAdButton.isHidden = false
        activityIndicator.stopAnimating()
    }
    
    func rewardedIsUnavailable(_ placementName: String) {
        print("rewardedIsUnavailable")
        activityIndicator.stopAnimating()
    }
    
    func rewardedDidShow(_ placementName: String, impressionData: FYBImpressionData) {
        print("rewardedDidShow")
    }
    
    func rewardedDidFail(toShow placementName: String, withError error: Error, impressionData: FYBImpressionData) {
        activityIndicator.stopAnimating()
        print("Failed to show rewarded ad with error: \(error.localizedDescription)")
    }
    
    func rewardedDidClick(_ placementName: String) {
        print("rewardedDidClick")
    }
    
    func rewardedDidComplete(_ placementName: String, userRewarded: Bool) {
        print("rewardedDidComplete")
    }
    
    func rewardedDidDismiss(_ placementName: String) {
        print("rewardedDidDismiss")
        showAdButton.isHidden = true
    }
  
    func rewardedWillRequest(_ placementId: String) {
        print("rewardedWillRequest")
    }
    
}
