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
    @property (nonatomic,strong) NSMutableArray* stack;
@end

@implementation CalculatorBrain

@synthesize buffer = _buffer;
@synthesize stack = _stack;

- (NSString *) buffer {
    if (!_buffer) {
        _buffer = @"0";
    }
    return _buffer;
}

- (NSMutableArray *) stack {
    if (!_stack) {
        _stack = [[NSMutableArray alloc] init];
    }
    return _stack;
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

- (NSString *) push {
    if (self.buffer != @"0") {
        [self.stack addObject:[self.buffer copy]];
        self.buffer = @"0";
    }
    return self.buffer;
}

- (float) pop {
    NSString* value = [self.stack lastObject];
    [self.stack removeLastObject];
    return [value floatValue];
}

- (float) sum {
    [self push];
    float result = [self pop] + [self pop];
    [self.stack addObject: [NSString stringWithFormat:@"%f", result]];
    return result;
}

- (float) sub {
    [self push];
    float result = - ( [self pop] - [self pop] );
    [self.stack addObject: [NSString stringWithFormat:@"%f", result]];
    return result;
}

- (float) div {
    [self push];
    float dividendo = [self pop];
    float result = [self pop] / dividendo;
    [self.stack addObject: [NSString stringWithFormat:@"%f", result]];
    return result;
}

- (float) mult{
    [self push];
    float result = [self pop] * [self pop];
    [self.stack addObject: [NSString stringWithFormat:@"%f", result]];
    return result;
}


@end







