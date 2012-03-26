//
//  RHFraction.h
//  FunWithFractions
//
//  Created by Jimmy Theis on 3/26/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RHFraction : NSObject

@property (nonatomic, readonly) NSInteger numerator;
@property (nonatomic, readonly) NSInteger denominator;

- (id)initWithNumerator:(NSInteger)numerator denominator:(NSInteger)denominator;
- (id)initWithWholeNumber:(NSInteger)number;

+ (id)one;
+ (id)zero;
+ (id)negativeOne;
+ (id)fractionWithNumerator:(NSInteger)numerator denominator:(NSInteger)denominator;

- (id)abs;
- (id)negate;

- (id)fractionByAddingFraction:(RHFraction *)fraction;
- (id)fractionBySubtractingFraction:(RHFraction *)fraction;
- (id)fractionByMultiplyingByFraction:(RHFraction *)fraction;
- (id)fractionByDividingByFraction:(RHFraction *)fraction;

- (NSComparisonResult)compare:(RHFraction *)fraction;

- (float)floatValue;

@end
