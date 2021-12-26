//
//  ViewController.h
//  rescalc
//
//  Created by Fabio Mauersberger on 25.12.21.
//

#import <Cocoa/Cocoa.h>
#import "WorkClasses/Calculator.h"

@interface ViewController : NSViewController {
    Calculator *calc;
}

@property IBOutlet NSPopUpButton *color0;
@property IBOutlet NSPopUpButton *color1;
@property IBOutlet NSPopUpButton *color2;
@property IBOutlet NSPopUpButton *color3;
@property IBOutlet NSPopUpButton *color4;

@property IBOutlet NSTextField *resistance;
@property IBOutlet NSTextField *tolerance;
@property IBOutlet NSTextField *maxDifference;

- (void)updateValuesFrom:(id)sender;

@end

