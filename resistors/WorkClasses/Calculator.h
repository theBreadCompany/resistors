//
//  Calculator.h
//  rescalc
//
//  Created by Fabio Mauersberger on 25.12.21.
//

#ifndef Calculator_h
#define Calculator_h

@interface Calculator : NSObject {
}

@property NSDictionary *digits;
@property NSDictionary *multiplier;
@property NSDictionary *tolerances;

-(NSArray *) getValuesOfColors:NSArray;

@end

#endif /* Calculator_h */
