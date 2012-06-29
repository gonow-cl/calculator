//
//  CalculatorBrain.h
//  CalculatorRazeto
//
//  Created by Gonow on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorBrain : NSObject
- (NSString *) digitPressed:(NSString *) digit;
- (NSString *) clear;
- (void) push;
- (float) sum;
- (float) sub;
- (float) div;
- (float) mult;
@end
