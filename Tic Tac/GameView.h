//
//  GameView.h
//  Tic Tac
//
//  Created by Vaisakh Prakash on 18/01/13.
//  Copyright (c) 2013 QBAdmin . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Box.h"
#import "Constants.h"
#import "BoxButton.h"

@protocol GameViewDelegate;

@interface GameView : UIView{
    
    int gameCount;
    BOOL isIPhoneTurn;
    BOOL checknull;
    int gameArray[9];
    int box[3];
    int iPhoneTappedButton1;
    int iPhoneTappedButton2;
    
    NSMutableArray *buttonArray;
    NSMutableArray *winningArray;
    
    BoxButton * button1;
    BoxButton * button2;
    BoxButton * button3;
}

@property (nonatomic) BOOL isOpponentiPhone;
@property (nonatomic) BoxStatus playerTurn;
@property (retain, nonatomic) IBOutlet UIView *coverView;
@property (strong, nonatomic) NSMutableArray *boxArray;

@property(nonatomic, assign) id<GameViewDelegate>delegate;
@end

@protocol GameViewDelegate <NSObject>
- (void) goBackToHomePage;
- (void) displayWinningViewWithTittle:(NSString *)title andImage:(NSString *)imageName;
@end
