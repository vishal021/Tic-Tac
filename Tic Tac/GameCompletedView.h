//
//  GameCompletedView.h
//  Tic Tac
//
//  Created by Vaisakh Prakash on 18/01/13.
//  Copyright (c) 2013 QBAdmin . All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GameCompletedViewDelegate;

@interface GameCompletedView : UIView

@property (retain, nonatomic) IBOutlet UILabel *gameCompletedLabel;
@property (retain, nonatomic) IBOutlet UIImageView *gameCompletedImageView;
- (IBAction)homeButtonAction:(id)sender;
- (IBAction)replayButtonAction:(id)sender;

@property(nonatomic, assign) id<GameCompletedViewDelegate>delegate;
@end

@protocol GameCompletedViewDelegate <NSObject>
- (void) goBackToHomePage;
- (void) replayGame;
@end
