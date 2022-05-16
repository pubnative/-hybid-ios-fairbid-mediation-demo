// For FairBid SDK Mediation Interstitial integration, simply just follow FairBid's documentation.
// FairBid Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

#import "InterstitialViewController.h"
#import <FairBidSDK/FairBidSDK.h>

#define INTERSTITIAL_AD_UNIT_ID @"197405"

@interface InterstitialViewController () <FYBInterstitialDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *showAdButton;

@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"FairBid Mediation Interstitial";
    [self.activityIndicator stopAnimating];
}

- (IBAction)loadAdTouchUpInside:(id)sender {
    [self.activityIndicator startAnimating];
    self.showAdButton.hidden = YES;
    FYBInterstitial.delegate = self;
    [FYBInterstitial request:INTERSTITIAL_AD_UNIT_ID];
}

- (IBAction)showAdTouchUpInside:(UIButton *)sender {
    if ([FYBInterstitial isAvailable:INTERSTITIAL_AD_UNIT_ID]) {
        [FYBInterstitial show:INTERSTITIAL_AD_UNIT_ID];
    } else {
        NSLog(@"Ad wasn't ready");
    }
}

#pragma mark - FYBInterstitialDelegate

- (void)interstitialIsAvailable:(NSString *)placementId {
    self.showAdButton.hidden = NO;
    [self.activityIndicator stopAnimating];
}
 
- (void)interstitialIsUnavailable:(NSString *)placementId {
    [self.activityIndicator stopAnimating];
}

- (void)interstitialDidShow:(NSString *)placementId impressionData:(FYBImpressionData *)impressionData {
    NSLog(@"interstitialDidShow");
}

- (void)interstitialDidFailToShow:(NSString *)placementId withError:(NSError *)error impressionData:(FYBImpressionData *)impressionData {
    [self.activityIndicator stopAnimating];
    NSLog(@"FairBid Interstitial did fail to show with message: %@", [error localizedDescription]);
}
 
- (void)interstitialDidClick:(NSString *)placementId {
    NSLog(@"interstitialDidClick");
}
 
- (void)interstitialDidDismiss:(NSString *)placementId {
    NSLog(@"interstitialDidDismiss");
    self.showAdButton.hidden = YES;
}

- (void)interstitialWillRequest:(NSString *)placementId {
    NSLog(@"interstitialWillRequest");
}

@end
