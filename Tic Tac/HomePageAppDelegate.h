//
//  HomePageAppDelegate.h
//  Tic Tac
//
//  Created by QBAdmin  on 06/12/12.
//  Copyright (c) 2012 QBAdmin . All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomePageViewController;

@interface HomePageAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) HomePageViewController *viewController;
@property (strong, nonatomic) UINavigationController *navigator;

@end
