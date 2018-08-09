//
//  AppDelegate.m
//  State-Machine
//
//  Created by Dzmitry Tarelkin on 8/9/18.
//  Copyright © 2018 Dzmitry Tarelkin. All rights reserved.
//

#import "AppDelegate.h"
#import "StateMachine.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    StateMachine * machine = [[StateMachine alloc] initWithState];
    [machine performEvent:EventB];
    [machine performEvent:EventA];
    [machine performEvent:EventC];
    [machine performEvent:EventC];
//    [machine performEvent:EventB];
//    [machine performEvent:EventB];
//    [machine performEvent:EventB];
//    [machine performEvent:EventB];
//    [machine performEvent:EventB];
//    [machine performEvent:EventB];
//    [machine performEvent:EventB];
//    [machine performEvent:EventB];
//    [machine performEvent:EventB];
//    [machine performEvent:EventB];
//    [machine performEvent:EventB];
    return YES;
}



@end
