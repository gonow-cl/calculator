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
    self.display.text = [self.brain digitPressed:sender.currentTitle];
}

- (IBAction)enter:(id)sender {
    self.display.text = [self.brain push];
}

- (IBAction)sum:(id)sender { 
    self.display.text = [NSString stringWithFormat:@"%f", [self.brain sum]]; 
}

- (IBAction)sub:(id)sender { 
    self.display.text = [NSString stringWithFormat:@"%f", [self.brain sub]]; 
}

- (IBAction)div:(id)sender { 
    self.display.text = [NSString stringWithFormat:@"%f", [self.brain div]]; 
}

- (IBAction)mult:(id)sender { 
    self.display.text = [NSString stringWithFormat:@"%f", [self.brain mult]]; 
}

- (CalculatorBrain *) brain
{
    if (!_brain) {
        _brain = [[CalculatorBrain alloc] init];
    }
    
    return _brain;
}

@end
