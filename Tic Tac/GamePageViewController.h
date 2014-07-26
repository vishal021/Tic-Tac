//
//  GamePageViewController.h
//  Tic Tac
//
//  Created by QBAdmin  on 06/12/12.
//  Copyright (c) 2012 QBAdmin . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectOpponentView.h"
#import "SelectStartView.h"
#import "GameView.h"
#import "GameCompletedView.h"

@interface GamePageViewController : UIViewController <SelectOpponentViewDelegate, SelectStartViewDelegate, GameViewDelegate, GameCompletedViewDelegate>{
}

@property (nonatomic) BOOL isOpponentiPhone;
@property (retain, nonatomic) SelectOpponentView *selectOpponentView;

@property (nonatomic) BoxStatus playerTurn;
@property (retain, nonatomic) SelectStartView *selectStartView;

@property (retain, nonatomic) GameView *gameView;
@property (retain, nonatomic) GameCompletedView *gameCompletedView;

@end
