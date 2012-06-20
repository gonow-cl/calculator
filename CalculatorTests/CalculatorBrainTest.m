//
//  CalculatorBrainTest.m
//  Calculator
//
//  Created by Gonow on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrainTest.h"
#import "CalculatorBrain.h"

@interface CalculatorBrainTest()
    @property (nonatomic,strong) CalculatorBrain* brain;
@end


@implementation CalculatorBrainTest

@synthesize brain = _brain;

- (void)setUp
{
    [super setUp];
    self.brain = [[CalculatorBrain alloc] init];
}

-(void)testDigitInput {
    [self checkInput:@"0" expected:@"0"];
    [self checkInput:@"1" expected:@"1"];
    [self checkInput:@"3" expected:@"13"];
}

-(void)testSum {
    [self inputNumber:@"2"];
}

-(void)inputNumber:(NSString*)number {
//    [self.brain digitPressed:number withDisplay:
    
}

-(void)testCleanDisplay {
    NSString* display = [self.brain clear];
    STAssertTrue([display isEqualToString: @"0"], @"Espera 0");
}

-(void)checkInput: (NSString*) digit expected: (NSString*)expected {
    NSString* value = [self.brain digitPressed:digit];
    STAssertTrue([value isEqualToString: expected], [NSString stringWithFormat:@"%@ != %@", value, expected]);
}



@end
