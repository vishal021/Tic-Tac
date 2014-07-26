//
//  GameView.m
//  Tic Tac
//
//  Created by Vaisakh Prakash on 18/01/13.
//  Copyright (c) 2013 QBAdmin . All rights reserved.
//

#import "GameView.h"

@implementation GameView

@synthesize playerTurn;
@synthesize isOpponentiPhone;
@synthesize coverView;

@synthesize boxArray;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"GameView"
                                              owner:self options:nil] objectAtIndex:0];
    }
    buttonArray = [[NSMutableArray alloc]init];
    winningArray = [[NSMutableArray alloc]init];
    for (int i = 1; i < 10; i++) {
        NSNumber *buttonTag = [NSNumber numberWithInt:i];
        [buttonArray addObject:buttonTag];
    }
    gameCount = 0;
    [self initializeAllBox];
    [self printArray];
    return self;
}

- (IBAction)homeButtonAction:(id)sender {
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(goBackToHomePage)]) {
                [self.delegate goBackToHomePage];
        }
    }
}

#pragma mark - Utility Methods

- (void)setUserInteraction:(BOOL)enabled{
    for (int i =0; i < 9; i++){
        UIButton *button = (UIButton *)[self viewWithTag:i+1];
        [button setUserInteractionEnabled:enabled];

    }
}

- (void)dealloc {
    [coverView release];
    [super dealloc];
}


//////////************////////////

- (void)initializeAllBox{
    boxArray = [[NSMutableArray alloc]init];
    for (int rowCount = 1; rowCount < 10; rowCount = rowCount + 3)
    {
        NSMutableArray *boxRowArray = [[NSMutableArray alloc]init];
        for (int columnCount = rowCount; columnCount < rowCount + 3; columnCount ++)
        {
            BoxButton *gameBox = (BoxButton *)[self viewWithTag:columnCount];
            gameBox.boxStatus = isNone;
            [boxRowArray addObject:gameBox];
        }
        
        [boxArray addObject:boxRowArray];
        [boxRowArray release];
    }
    for (int columnCount = 1; columnCount < 4; columnCount ++)
    {
        NSMutableArray *boxRowArray = [[NSMutableArray alloc]init];
        for (int rowCount = columnCount; rowCount < columnCount + 7; rowCount = rowCount + 3)
        {
            BoxButton *gameBox = (BoxButton *)[self viewWithTag:rowCount];
            gameBox.boxStatus = isNone;
            [boxRowArray addObject:gameBox];
        }
        [boxArray addObject:boxRowArray];
        [boxRowArray release];
    }
    NSMutableArray *boxCrossArray1 = [[NSMutableArray alloc]init];
    BoxButton *gameBox = (BoxButton *)[self viewWithTag:1];
    gameBox.boxStatus = isNone;
    [boxCrossArray1 addObject:gameBox];
    gameBox = (BoxButton *)[self viewWithTag:5];
    gameBox.boxStatus = isNone;
    [boxCrossArray1 addObject:gameBox];
    gameBox = (BoxButton *)[self viewWithTag:9];
    gameBox.boxStatus = isNone;
    [boxCrossArray1 addObject:gameBox];
    
    [boxArray addObject:boxCrossArray1];
    [boxCrossArray1 release];
    
    NSMutableArray *boxCrossArray2 = [[NSMutableArray alloc]init];
    gameBox = (BoxButton *)[self viewWithTag:3];
    gameBox.boxStatus = isNone;
    [boxCrossArray2 addObject:gameBox];
    gameBox = (BoxButton *)[self viewWithTag:5];
    gameBox.boxStatus = isNone;
    [boxCrossArray2 addObject:gameBox];
    gameBox = (BoxButton *)[self viewWithTag:7];
    gameBox.boxStatus = isNone;
    [boxCrossArray2 addObject:gameBox];
    
    [boxArray addObject:boxCrossArray2];
    [boxCrossArray2 release];
}
- (void)printArray{
    for (int row = 0; row < 8; row ++)
    {
        NSLog(@"%d",((BoxButton *)[[boxArray objectAtIndex:row] objectAtIndex:0]).tag);
        NSLog(@"%d",((BoxButton *)[[boxArray objectAtIndex:row] objectAtIndex:1]).tag);
        NSLog(@"%d",((BoxButton *)[[boxArray objectAtIndex:row] objectAtIndex:2]).tag);
    }
}
- (IBAction)buttonTaped:(id)sender {
    gameCount ++;
    BoxButton *tapedButton = sender;
    if (self.playerTurn == isCircle) {
        tapedButton.boxStatus = isCircle;
        [tapedButton setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        self.playerTurn = isXmark;
    } else {
        tapedButton.boxStatus = isXmark;
        [tapedButton setBackgroundImage:[UIImage imageNamed:@"x_circle_blu.png"] forState:UIControlStateNormal];
        self.playerTurn = isCircle;
    }
    [tapedButton setUserInteractionEnabled:NO];
    
    
    if ([self checkForWinningCase]) {
        [self viewWinningCase];
    }
    if (gameCount == 9){
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(displayWinningViewWithTittle:andImage:)]) {
                [self.delegate displayWinningViewWithTittle:@"MATCH DRAW" andImage:@"idiotic_smile.png"];
            }
        }
        return;
    }
    if (self.isOpponentiPhone) {
        if (isIPhoneTurn) {
            
            isIPhoneTurn = NO;
        }else{
            isIPhoneTurn = YES;
            [self findTheCaseToPlay];
            [self playTheCase];
        }
    }
}
- (BOOL)findTheCaseToPlay{
    
    for (int row = 0; row < 8; row ++)
    {
        BoxStatus status = isNone;
        button1 = [[boxArray objectAtIndex:row] objectAtIndex:0];
        button2 = [[boxArray objectAtIndex:row] objectAtIndex:1];
        button3 = [[boxArray objectAtIndex:row] objectAtIndex:2];
        button1.boxStatus == button2.boxStatus ? status = button1.boxStatus: status;
        button2.boxStatus == button3.boxStatus ? status = button2.boxStatus: status;
        button1.boxStatus == button3.boxStatus ? status = button3.boxStatus: status;
        
        if ((status == self.playerTurn)&&((button1.boxStatus == isNone)||(button2.boxStatus == isNone) || (button3.boxStatus == isNone))) {
            NSLog(@"win:row==%d",row);
            return YES;
        }
    }
    
    for (int row = 0; row < 8; row ++)
    {
        BoxStatus status = isNone;
        button1 = [[boxArray objectAtIndex:row] objectAtIndex:0];
        button2 = [[boxArray objectAtIndex:row] objectAtIndex:1];
        button3 = [[boxArray objectAtIndex:row] objectAtIndex:2];
        button1.boxStatus == button2.boxStatus ? status = button1.boxStatus: status;
        button2.boxStatus == button3.boxStatus ? status = button2.boxStatus: status;
        button1.boxStatus == button3.boxStatus ? status = button3.boxStatus: status;
        
        if ((status != isNone)&&((button1.boxStatus == isNone)||(button2.boxStatus == isNone) || (button3.boxStatus == isNone))) {
            NSLog(@"resisy:row==%d",row);
            return YES;
        }
    }
    for (int row = 0; row < 8; row ++)
    {
        button1 = [[boxArray objectAtIndex:row] objectAtIndex:0];
        button2 = [[boxArray objectAtIndex:row] objectAtIndex:1];
        button3 = [[boxArray objectAtIndex:row] objectAtIndex:2];
        if((button1.boxStatus == button2.boxStatus ? (button2.boxStatus == button3.boxStatus ? YES : NO): NO)){
            NSLog(@"empty:row==%d",row);
            return YES;
            
        }
    }
    for (int row = 0; row < 8; row ++)
    {
        button1 = [[boxArray objectAtIndex:row] objectAtIndex:0];
        button2 = [[boxArray objectAtIndex:row] objectAtIndex:1];
        button3 = [[boxArray objectAtIndex:row] objectAtIndex:2];
        if(button1.boxStatus == isNone || button2.boxStatus == isNone || button3.boxStatus == isNone){
            NSLog(@"fil play:row==%d",row);
            return YES;
            
        }
    }
     NSLog(@"no");
    
    return NO;
   
}

- (void)playTheCase{
    if (button1.boxStatus == isNone) {
        [self buttonTaped:button1];
        return;
    }
    if (button2.boxStatus == isNone) {
        [self buttonTaped:button2];
        return;
    }
    if (button3.boxStatus == isNone) {
        [self buttonTaped:button3];
        return;
    }
}
- (BOOL)checkForWinningCase{
    for (int row = 0; row < 8; row ++)
    {
        button1 = [[boxArray objectAtIndex:row] objectAtIndex:0];
        button2 = [[boxArray objectAtIndex:row] objectAtIndex:1];
        button3 = [[boxArray objectAtIndex:row] objectAtIndex:2];
        if ((button1.boxStatus == button2.boxStatus) && (button2.boxStatus == button3.boxStatus) && button3.boxStatus != isNone) {
            return YES;
        }
        
    }
    return NO;
}
- (void)viewWinningCase{
    [button1 setBackgroundColor:[UIColor greenColor]];
    [button2 setBackgroundColor:[UIColor greenColor]];
    [button3 setBackgroundColor:[UIColor greenColor]];
    [self setUserInteraction:NO];
    
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(displayWinningViewWithTittle:andImage:)]) {
            if (self.playerTurn == isXmark) {
                [self.delegate displayWinningViewWithTittle:@"WON THE GAME" andImage:@"circle.png"];
            } else {
                [self.delegate displayWinningViewWithTittle:@"WON THE GAME" andImage:@"x_circle_blu.png"];
            }
        }
    }
}

@end
