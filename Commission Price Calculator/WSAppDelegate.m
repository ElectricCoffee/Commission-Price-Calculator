//
//  WSAppDelegate.m
//  Commission Price Calculator
//
//  Created by Electric Coffee on 9/9/13.
//  Copyright (c) 2013 Electric Coffee. All rights reserved.
//

#import "WSAppDelegate.h"

@implementation WSAppDelegate

@synthesize priceField, currencyField, typePopUp, additionalField, additionalLabel;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [typePopUp removeAllItems];
    [typePopUp addItemsWithTitles:
     [NSArray arrayWithObjects:
      @"Price per character", @"Percent saved", nil]];
}

- (IBAction)calculateButton:(id)sender {
}
@end
