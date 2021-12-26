//
//  ViewController.m
//  rescalc
//
//  Created by Fabio Mauersberger on 25.12.21.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewWillAppear {
    NSMenu *digitMenu = [[NSMenu alloc] initWithTitle:@""];
    NSMenu *multiplierMenu = [[NSMenu alloc] initWithTitle:@""];
    NSMenu *toleranceMenu = [[NSMenu alloc] initWithTitle:@""];
    
    for (int i = 0; i < [[calc digits] count]; i++) {
        NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:[[calc digits] allKeys][i] action:@selector(updateValuesFrom:) keyEquivalent:@""];
        item.target = self;
        [digitMenu addItem:item];
    }
    for (int i = 0; i < [[calc multiplier] count]; i++) {
        NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:[[calc multiplier] allKeys][i] action:@selector(updateValuesFrom:) keyEquivalent:@""];
        item.target = self;
        [multiplierMenu addItem:item];
    }
    for (int i = 0; i < [[calc tolerances] count]; i++) {
        NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:[[calc tolerances] allKeys][i] action:@selector(updateValuesFrom:) keyEquivalent:@""];
        item.target = self;
        [toleranceMenu addItem:item];
    }
    NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:@"None" action:@selector(updateValuesFrom:) keyEquivalent:@""];
    item.target = self;
    [digitMenu addItem:item];
    [multiplierMenu addItem:[item copy]];
    [toleranceMenu addItem:[item copy]];
    
    [[self color0] setMenu:digitMenu];
    [[self color1] setMenu:[digitMenu copy]];
    [[self color2] setMenu:[digitMenu copy]];
    [[self color3] setMenu:multiplierMenu];
    [[self color4] setMenu:toleranceMenu];
    
    [[self color0] selectItemWithTitle:@"None"];
    [[self color1] selectItemWithTitle:@"None"];
    [[self color2] selectItemWithTitle:@"None"];
    [[self color3] selectItemWithTitle:@"None"];
    [[self color4] selectItemWithTitle:@"None"];
    
    self.resistance.stringValue = @"";
    self.tolerance.stringValue = @"";
    self.maxDifference.stringValue = @"";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    calc = [[Calculator alloc] init];
    // Do any additional setup after loading the view.
}


- (void)updateValuesFrom:(id)sender {
    if (![[[self color0] titleOfSelectedItem] isEqual: @"None"] && ![[[self color1] titleOfSelectedItem] isEqual: @"None"] && ![[[self color2] titleOfSelectedItem] isEqual: @"None"] && ![[[self color3] titleOfSelectedItem] isEqual: @"None"]) {
        NSArray *input = @[[[self color0] titleOfSelectedItem], [[self color1] titleOfSelectedItem], [[self color2] titleOfSelectedItem], [[self color3] titleOfSelectedItem]];
        if (![[[self color4] titleOfSelectedItem] isEqual: @"None"]) { [input arrayByAddingObject:[[self color4] titleOfSelectedItem]]; }
        NSArray *values = [calc getValuesOfColors:input];
        [[self resistance] setStringValue: [NSString stringWithFormat:@"%@Ω", values[0]]];
        [[self tolerance] setStringValue: [NSString stringWithFormat:@"%@%%", values[1]]];
        [[self maxDifference] setStringValue: [NSString stringWithFormat:@"%@Ω", values[2]]];
    }
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    // Update the view, if already loaded.
}


@end
