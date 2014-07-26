//
//  GamePageViewController.m
//  Tic Tac
//
//  Created by QBAdmin  on 06/12/12.
//  Copyright (c) 2012 QBAdmin . All rights reserved.
//

#import "GamePageViewController.h"

@interface GamePageViewController ()

@end

@implementation GamePageViewController

@synthesize isOpponentiPhone;
@synthesize selectOpponentView;

@synthesize playerTurn;
@synthesize selectStartView;

@synthesize gameView;
@synthesize gameCompletedView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.selectOpponentView = [[SelectOpponentView alloc]init];
    self.selectOpponentView.delegate = self;
    [self.view addSubview:self.selectOpponentView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setSelectOpponentView:nil];
    [super viewDidUnload];
}

#pragma mark - SelectOpponentViewDelegate

-(void) selectionButtonPressedWithiPhone:(BOOL)isiPhone;
{
    self.isOpponentiPhone = isiPhone;
    [self.selectOpponentView removeFromSuperview];
    
    self.selectStartView = [[SelectStartView alloc]init];
    self.selectStartView.delegate = self;
    [self.view addSubview:self.selectStartView];
}

#pragma mark - SelectStartViewDelegate

-(void) selectionButtonPressedWithBoxStatus:(BoxStatus)boxStatus;
{
    self.playerTurn = boxStatus;
    [self.selectStartView removeFromSuperview];
    
    self.gameView = [[GameView alloc]init];
    self.gameView.delegate = self;
    self.gameView.isOpponentiPhone = self.isOpponentiPhone;
    
    self.gameView.playerTurn = self.playerTurn;
    [self.view addSubview:self.gameView];
}

#pragma mark - GameViewDelegate

- (void) displayWinningViewWithTittle:(NSString *)title andImage:(NSString *)imageName{
    
    self.gameCompletedView = [[GameCompletedView alloc]init];
    self.gameCompletedView.delegate = self;
    self.gameCompletedView.gameCompletedLabel.text = title;
    self.gameCompletedView.gameCompletedImageView.image = [UIImage imageNamed:imageName];
    [self.view addSubview:self.gameCompletedView];
}
#pragma mark - GameCompletedViewDelegate
- (void) replayGame{
    [self.gameCompletedView removeFromSuperview];
    [self.gameView removeFromSuperview];
    self.selectStartView = [[SelectStartView alloc]init];
    self.selectStartView.delegate = self;
    [self.view addSubview:self.selectStartView];
}



#pragma mark - Button Actions

- (void)goBackToHomePage {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    [SelectStartView release];
    [SelectOpponentView release];
    [super dealloc];
}
@end
