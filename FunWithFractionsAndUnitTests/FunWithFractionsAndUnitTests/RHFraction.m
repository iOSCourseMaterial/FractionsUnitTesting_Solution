//
//  RHFraction.m
//  FunWithFractions
//
//  Created by Jimmy Theis on 3/26/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "RHFraction.h"


@interface RHFraction ()

@property (nonatomic, readwrite) NSInteger numerator;
@property (nonatomic, readwrite) NSInteger denominator;

- (NSInteger)gcdOfFirstInteger:(NSInteger)int1 secondInteger:(NSInteger)int2;

@end


@implementation RHFraction

@synthesize numerator = _numerator;
@synthesize denominator = _denominator;

- (id)initWithNumerator:(NSInteger)numerator denominator:(NSInteger)denominator {
    if (denominator == 0) return nil;
    
    self = [super init];
    
    if (self) {
        NSInteger gcd = [self gcdOfFirstInteger:numerator secondInteger:denominator];
        
        if (denominator < 0) gcd = -gcd;
        
        self.numerator = numerator / gcd;
        self.denominator = denominator / gcd;
    }
    
    return self;
}

- (id)initWithWholeNumber:(NSInteger)number {
    return [self initWithNumerator:number denominator:1];
}

- (float)floatValue {
    return (float) self.numerator / (float) self.denominator;
}

#pragma mark - Class Methods

+ (id)one {
    return [[RHFraction alloc] initWithWholeNumber:1];
}

+ (id)zero {
    return [[RHFraction alloc] initWithWholeNumber:0];
}

+ (id)negativeOne {
    return [[RHFraction alloc] initWithWholeNumber:-1];
}

+ (id)fractionWithNumerator:(NSInteger)numerator denominator:(NSInteger)denominator {
    return [[RHFraction alloc] initWithNumerator:numerator denominator:denominator];
}

#pragma mark - Modification Methods

- (id)abs {
    return [RHFraction fractionWithNumerator:abs(self.numerator) denominator:self.denominator];
}

- (id)negate {
    return [RHFraction fractionWithNumerator:-self.numerator denominator:self.denominator];
}

- (id)fractionByAddingFraction:(RHFraction *)fraction {
    NSInteger newNumerator = self.numerator * fraction.denominator + fraction.numerator * self.denominator;
    return [RHFraction fractionWithNumerator:newNumerator
                                 denominator:(self.denominator * fraction.denominator)];
}

- (id)fractionBySubtractingFraction:(RHFraction *)fraction {
    return [self fractionByAddingFraction:fraction.negate];
}

- (id)fractionByMultiplyingByFraction:(RHFraction *)fraction {
    return [RHFraction fractionWithNumerator:(self.numerator * fraction.numerator)
                                 denominator:(self.denominator * fraction.denominator)];
}

- (id)fractionByDividingByFraction:(RHFraction *)fraction {
    RHFraction *flipped = [RHFraction fractionWithNumerator:fraction.denominator
                                                denominator:fraction.numerator];
    return [self fractionByMultiplyingByFraction:flipped];
}

- (NSComparisonResult)compare:(RHFraction *)fraction {
    return [[NSNumber numberWithFloat:self.floatValue] compare:[NSNumber numberWithFloat:fraction.floatValue]];
}

#pragma mark - NSObject Overrides

- (id)init {
    return [self initWithWholeNumber:1];
}

- (NSString *)description {
    if (self.denominator == 1) {
        return [NSString stringWithFormat:@"%d", self.numerator];
    }
    
    return [NSString stringWithFormat:@"%d/%d", self.numerator, self.denominator];
}

- (BOOL)isEqual:(id)object {
    if (object == self) return YES;
    if (!object || ![object isKindOfClass:[RHFraction class]]) return NO;
    
    RHFraction *fraction = (RHFraction *) object;
    return fraction.numerator == self.numerator && fraction.denominator == self.denominator;
}

#pragma mark - Private Methods

- (NSInteger)gcdOfFirstInteger:(NSInteger)int1 secondInteger:(NSInteger)int2 {
    NSInteger temp;
    
    while (int2 != 0) {
        temp = int2;
        int2 = int1 % int2;
        int1 = temp;
    }
    
    return abs(int1);
}

@end
