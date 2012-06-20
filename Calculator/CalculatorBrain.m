//
//  CalculatorBrain.m
//  CalculatorRazeto
//
//  Created by Gonow on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic,strong) NSString* buffer;
@end

@implementation CalculatorBrain

@synthesize buffer = _buffer;

- (NSString *) buffer{
    if(!_buffer){
        _buffer = @"0";
    }
    return _buffer;
}

- (NSString *) digitPressed:(NSString *) digit
{
    if([self.buffer characterAtIndex:0] == '0'){
        self.buffer = digit;
    } else {
        self.buffer = [self.buffer stringByAppendingString:digit];
    }
    
    return self.buffer;
}

- (NSString *) clear {
    self.buffer = @"0";
    return self.buffer;
}

@end
