// For FairBid SDK Mediation Interstitial integration, simply just follow FairBid's documentation.
// FairBid Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import FairBidSDK

class Interstitial: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var showAdButton: UIButton!
    
    let adUnitID = "197405"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "FairBid Mediation Interstitial"
        activityIndicator.stopAnimating()
    }
    
    @IBAction func loadAdTouchUpInside(_ sender: UIButton) {
        activityIndicator.startAnimating()
        showAdButton.isHidden = true
        FYBInterstitial.delegate = self
        FYBInterstitial.request(adUnitID)
    }
    
    @IBAction func showAdTouchUpInside(_ sender: UIButton) {
        if (FYBInterstitial.isAvailable(adUnitID)) {
            FYBInterstitial.show(adUnitID)
        } else {
            print("Ad wasn't ready")
        }
    }
}

extension Interstitial: FYBInterstitialDelegate {
    
    func interstitialIsAvailable(_ placementId: String) {
        showAdButton.isHidden = false
        activityIndicator.stopAnimating()
    }
    
    func interstitialIsUnavailable(_ placementId: String) {
        print("interstitialIsUnavailable")
        activityIndicator.stopAnimating()
    }
    
    func interstitialDidShow(_ placementId: String, impressionData: FYBImpressionData) {
        print("interstitialDidShow")
    }
    
    func interstitialDidFail(toShow placementId: String, withError error: Error, impressionData: FYBImpressionData) {
        activityIndicator.stopAnimating()
        print("Failed to show interstitial ad with error: \(error.localizedDescription)")
    }
    
    func interstitialDidClick(_ placementId: String) {
        print("interstitialDidClick")
    }
    
    func interstitialDidDismiss(_ placementId: String) {
        print("interstitialDidDismiss")
        showAdButton.isHidden = true
    }
  
    func interstitialWillRequest(_ placementId: String) {
        print("interstitialWillRequest")
    }
}
