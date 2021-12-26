//
//  Calculator.m
//  rescalc
//
//  Created by Fabio Mauersberger on 25.12.21.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"

@implementation Calculator : NSObject 

-(id) init {
    self = [super init];
    _digits = @{
        @"black": @0,
        @"brown": @1,
        @"red": @2,
        @"orange": @3,
        @"yellow": @4,
        @"green": @5,
        @"blue": @6,
        @"violett": @7,
        @"grey": @8,
        @"white": @9
    };
    _multiplier = @{
        @"silver": @0.01,
        @"gold": @0.1,
        @"brown": @10,
        @"red": @100,
        @"orange": @1000,
        @"yellow": @10000,
        @"green": @100000,
        @"blue": @1000000,
        @"violett": @10000000
    };
    _tolerances = @{
        @"violett": @0.1,
        @"blue": @0.25,
        @"green": @0.5,
        @"brown": @1,
        @"red": @2,
        @"gold": @5,
        @"silver": @10
    };
    return self;
}

-(NSArray *) getValuesOfColors:(NSArray *) colors {
    NSMutableString *value = [NSMutableString stringWithFormat: @"%@%@", _digits[colors[0]], _digits[colors[1]]];
    double tolerance;
    double maxDifference;
    if ([colors count] == 5) {
        value = [NSMutableString stringWithFormat:@"%@%@", value, _digits[colors[2]]];
        value = [NSMutableString stringWithFormat:@"%f", [value floatValue] * [_multiplier[colors[3]] floatValue]];
        tolerance = [_tolerances[colors[4]] floatValue];
    } else {
        value = [NSMutableString stringWithFormat:@"%f", [value floatValue] * [_multiplier[colors[2]] floatValue]];
        tolerance = [_tolerances[colors[3]] floatValue];
    }
    maxDifference = [value floatValue] * (tolerance/100);
    return @[[NSNumber numberWithFloat:[value floatValue]], [NSNumber numberWithDouble:tolerance], [NSNumber numberWithDouble:maxDifference]];
}

@end
