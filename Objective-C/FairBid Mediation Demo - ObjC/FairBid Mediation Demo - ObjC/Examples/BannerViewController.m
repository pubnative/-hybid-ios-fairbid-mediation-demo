// For FairBid SDK Mediation Banner integration, simply just follow FairBid's documentation.
// FairBid Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

#import "BannerViewController.h"
#import <FairBidSDK/FairBidSDK.h>

#define BANNER_AD_UNIT_ID @"197407"

@interface BannerViewController () <FYBBannerDelegate>

@property (weak, nonatomic) IBOutlet UIView *bannerAdContainer;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation BannerViewController

- (void)dealloc {
    [FYBBanner destroy:BANNER_AD_UNIT_ID];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"FairBid Mediation Banner";
}

- (IBAction)loadAdTouchUpInside:(id)sender {
    [self.activityIndicator startAnimating];
    self.bannerAdContainer.hidden = YES;
    FYBBanner.delegate = self;
    FYBBannerOptions *bannerOptions = [[FYBBannerOptions alloc] init];
    bannerOptions.placementId = BANNER_AD_UNIT_ID;
    [FYBBanner showBannerInView:self.bannerAdContainer
                       position:FYBBannerAdViewPositionBottom
                        options:bannerOptions];
}

#pragma mark - FYBInterstitialDelegate

- (void)bannerDidLoad:(FYBBannerAdView *)banner {
    self.bannerAdContainer.hidden = NO;
    [self.activityIndicator stopAnimating];
}

- (void)bannerDidFailToLoad:(NSString *)placementId withError:(NSError *)error {
    [self.activityIndicator stopAnimating];
    NSLog(@"FairBid Banner did fail to load with message: %@", [error localizedDescription]);
}

- (void)bannerDidShow:(FYBBannerAdView *)banner impressionData:(FYBImpressionData *)impressionData     {
    NSLog(@"bannerDidShow");
}

- (void)bannerDidClick:(FYBBannerAdView *)banner {
    NSLog(@"bannerDidClick");
}

- (void)bannerWillPresentModalView:(FYBBannerAdView *)banner {
    NSLog(@"bannerWillPresentModalView");
}

- (void)bannerDidDismissModalView:(FYBBannerAdView *)banner {
    NSLog(@"bannerDidDismissModalView");
}

- (void)bannerWillLeaveApplication:(FYBBannerAdView *)banner {
    NSLog(@"bannerWillLeaveApplication");
}

- (void)banner:(FYBBannerAdView *)banner didResizeToFrame:(CGRect)frame {

}

- (void)bannerWillRequest:(NSString *)placementId {
    NSLog(@"bannerWillRequest");
}

@end
