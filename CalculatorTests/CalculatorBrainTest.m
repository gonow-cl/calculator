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
    [self inputNumber:@"5"];
    STAssertEquals([self.brain sum], 7.0f, @"Espera 7");
}

-(void)testSubtract {
    // STFail(@"To do: implementar");
    [self inputNumber:@"5"];
    [self inputNumber:@"2"];
    STAssertEquals([self.brain sub], 3.0f, @"Espera 3");
}


-(void)testSubtractNeg {
    // STFail(@"To do: implementar");
    [self inputNumber:@"2"];
    [self inputNumber:@"5"];
    STAssertEquals([self.brain sub], -3.0f, @"Espera -3");
}


-(void)testSubtractEq {
    // STFail(@"To do: implementar");
    [self inputNumber:@"5"];
    [self inputNumber:@"5"];
  //  STAssertEquals([self.brain sub], 0.0f, @"Espera 0");
    
    STAssertEqualsWithAccuracy([self.brain sub], 0.0f, 0.001, @"Espera 0");
    
}

-(void)testDivide {
    [self inputNumber:@"10"];
    [self inputNumber:@"2"];
    STAssertEquals([self.brain div], 5.0f, @"Espera 5");
}

-(void)testMulti {
    [self inputNumber:@"2"];
    [self inputNumber:@"3"];
    STAssertEquals([self.brain mult], 6.0f, @"Espera 6");
}

-(void)testMultiOPerations {
    float expected = (10 / 5) + ((40 * 2) - 12);
    
    [self.brain digitPressed:@"1"];
    [self.brain digitPressed:@"0"];
    [self.brain push];
    [self.brain digitPressed:@"5"];
    [self.brain div];
    [self.brain digitPressed:@"4"];
    [self.brain digitPressed:@"0"];
    [self.brain push];
    [self.brain digitPressed:@"2"];
    [self.brain mult];
    [self.brain digitPressed:@"1"];
    [self.brain digitPressed:@"2"];
    [self.brain sub];
    float result = [self.brain sum];
    STAssertEquals(result, expected, @"Espera 70");
    
    
}

-(void)inputNumber:(NSString*)number {
    [self.brain digitPressed:number];
    [self.brain push];
    
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
