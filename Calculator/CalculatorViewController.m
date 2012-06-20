//
//  CalculatorViewController.m
//  CalculatorRazeto
//
//  Created by Gonow on 6/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()

@property (strong, nonatomic) CalculatorBrain *brain; 

@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize brain = _brain;


- (IBAction)buttonPressed:(UIButton *)sender 
{
    //NSString *digit = sender.currentTitle;
    
    //NSLog(@"button pressed = %@", digit);
    
    self.display.text = [self.brain digitPressed:sender.currentTitle];
    //[self.display.text stringByAppendingFormat:sender.currentTitle];
    
}

- (CalculatorBrain *) brain
{
    if (!_brain) {
        _brain = [[CalculatorBrain alloc] init];
    }
    
    return _brain;
}

@end
