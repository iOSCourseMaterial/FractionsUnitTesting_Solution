//
//  FunWithFractionsAndUnitTestsTests.m
//  FunWithFractionsAndUnitTestsTests
//
//  Created by Jimmy Theis on 3/26/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "FunWithFractionsAndUnitTestsTests.h"
#import "RHFraction.h"


@interface FunWithFractionsAndUnitTestsTests ()

@property (nonatomic, strong) RHFraction *twoThirds;
@property (nonatomic, strong) RHFraction *negativeOne;
@property (nonatomic, strong) RHFraction *two;
@property (nonatomic, strong) RHFraction *threeFifths;

@end


@implementation FunWithFractionsAndUnitTestsTests

@synthesize twoThirds = _twoThirds;
@synthesize negativeOne = _negativeOne;
@synthesize two = _two;
@synthesize threeFifths = _threeFifths;

- (void)setUp {
    [super setUp];
    
    // Set-up code here.
    self.twoThirds = [RHFraction fractionWithNumerator:2 denominator:3];
    self.negativeOne = [RHFraction negativeOne];
    self.two = [RHFraction fractionWithNumerator:2 denominator:1];
    self.threeFifths = [RHFraction fractionWithNumerator:3 denominator:5];
}

- (void)tearDown {
    // Tear-down code here.
    
    [super tearDown];
}

#pragma mark - Tests

- (void)testFractionEquality {
    STAssertTrue([self.twoThirds isEqual:[RHFraction fractionWithNumerator:2 denominator:3]], @"Equality false instead of true");
    STAssertFalse([self.twoThirds isEqual:self.threeFifths], @"Equality true instead of false");
}

- (void)testFractionAddition {
    RHFraction *result = [self.twoThirds fractionByAddingFraction:self.negativeOne];
    RHFraction *expectedResult = [RHFraction fractionWithNumerator:-1 denominator:3];
    
    STAssertNotNil(result, @"Fraction was nil");
    STAssertEqualObjects(result, expectedResult, @"Addition did not work");
}

- (void)testFractionSubtraction {
    RHFraction *result = [self.two fractionBySubtractingFraction:self.twoThirds];
    RHFraction *expectedResult = [RHFraction fractionWithNumerator:4 denominator:3];
    
    STAssertNotNil(result, @"Fraction was nil");
    STAssertEqualObjects(result, expectedResult, @"Subtraction did not work");
}

- (void)testFractionMultiplication {
    RHFraction *result = [self.twoThirds fractionByMultiplyingByFraction:self.threeFifths];
    RHFraction *expectedResult = [RHFraction fractionWithNumerator:2 denominator:5];
    
    STAssertNotNil(result, @"Fraction was nil");
    STAssertEqualObjects(result, expectedResult, @"Multiplication did not work");
}

- (void)testFractionDivision {
    RHFraction *result = [self.twoThirds fractionByDividingByFraction:self.threeFifths];
    RHFraction *expectedResult = [RHFraction fractionWithNumerator:10 denominator:9];
    
    STAssertNotNil(result, @"Fraction was nil");
    STAssertEqualObjects(result, expectedResult, @"Division did not work");
}

- (void)testFractionDivisionByZero {
    RHFraction *result = [self.twoThirds fractionByDividingByFraction:[RHFraction fractionWithNumerator:0 denominator:5]];
    STAssertNil(result, @"Division by zero did not yield nil");
}

- (void)testFractionFlotValue {
    STAssertEqualsWithAccuracy(self.twoThirds.floatValue, 0.66666f, 0.00001, @"Float value incorrect");
}

- (void)testFractionComparison {
    NSArray *array = [NSArray arrayWithObjects:self.twoThirds, self.two, self.threeFifths, self.negativeOne, nil];
    NSArray *sorted = [array sortedArrayUsingSelector:@selector(compare:)];
    
    STAssertEquals([sorted objectAtIndex:0], self.negativeOne, @"First element incorrect");
    STAssertEquals([sorted objectAtIndex:1], self.threeFifths, @"Second element incorrect");
    STAssertEquals([sorted objectAtIndex:2], self.twoThirds, @"Third element incorrect");
    STAssertEquals([sorted objectAtIndex:3], self.two, @"Fourth element incorrect");
}

@end
