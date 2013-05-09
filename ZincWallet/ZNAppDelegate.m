//
//  ZNAppDelegate.m
//  ZincWallet
//
//  Created by Aaron Voisine on 5/8/13.
//  Copyright (c) 2013 zinc. All rights reserved.
//

#import "ZNAppDelegate.h"

@implementation ZNAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    // this will notify user if bluetooth is disabled (on 4S and newer devices that support BTLE)
    CBCentralManager *cbManager = [[CBCentralManager alloc] initWithDelegate:self queue:dispatch_get_main_queue()];
    
    [self centralManagerDidUpdateState:cbManager]; // Show initial state
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)cbManager
{
    switch (cbManager.state) {
        case CBCentralManagerStateResetting: NSLog(@"system BT connection momentarily lost."); break;
        case CBCentralManagerStateUnsupported: NSLog(@"BT Low Energy not suppoerted."); break;
        case CBCentralManagerStateUnauthorized: NSLog(@"BT Low Energy not authorized."); break;
        case CBCentralManagerStatePoweredOff: NSLog(@"BT off."); break;
        case CBCentralManagerStatePoweredOn: NSLog(@"BT on."); break;
        default: NSLog(@"BT State unknown."); break;
    }    
}
@end
