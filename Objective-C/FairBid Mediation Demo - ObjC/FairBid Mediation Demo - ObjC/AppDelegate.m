#import "AppDelegate.h"
// Step 1: Import HyBid into your class (Only required if anything in Step 4 below is set)
#import <HyBid/HyBid.h>

#define APP_TOKEN @"543027b8e954474cbcd9a98481622a3b"
#define FAIRBID_APP_ID @"134134"

// Step 2: Import FairBid SDK into your class
#import <FairBidSDK/FairBidSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Step 3: Setup & Initialize FairBid SDK
        FYBStartOptions *options = [[FYBStartOptions alloc] init];
        options.logLevel = FYBLoggingLevelVerbose;
        options.autoRequestingEnabled = NO;
        [FairBid startWithAppId:FAIRBID_APP_ID options:options];
    // Step 4: Set COPPA (Optional)
        [HyBid setCoppa:NO];
    // Step 5: Set Test Mode (Optional)
        [HyBid setTestMode:YES];
    // Step 6: Set Location Tracking (Optional)
        [HyBid setLocationTracking:YES];
    // Step 7: Set HTML Interstitial skipOffset (Optional)
        [HyBid setHTMLInterstitialSkipOffset:2];
    // Step 8: Set Video Interstitial skipOffset (Optional)
        [HyBid setVideoInterstitialSkipOffset:5];
    // Step 9: Set Custom Click Behavior (Optional)
        [HyBid setInterstitialActionBehaviour:HB_CREATIVE];
    // Step 10: Set Targeting (Optional)
        HyBidTargetingModel *targeting = [[HyBidTargetingModel alloc] init];
        targeting.age = [NSNumber numberWithInt:28];
        targeting.interests = @[@"music"];
        targeting.gender = @"f";     // "f" for female, "m" for male
        [HyBid setTargeting:targeting];
    // Step 11: Set SKOverlay for Interstitial (Optional)
        [HyBid setInterstitialSKOverlay:YES];
    // Step 12: Set SKOverlay for Rewarded (Optional)
        [HyBid setRewardedSKOverlay:YES];
    // Step 13: Set HyBid log level (Optional)
        [HyBidLogger setLogLevel:HyBidLogLevelDebug];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
