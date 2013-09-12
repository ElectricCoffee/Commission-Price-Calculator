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

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _price = 0.0;
    [typePopUp removeAllItems];
    [typePopUp addItemsWithTitles:
     [NSArray arrayWithObjects:
      @"Price per character", @"Percent saved", nil]];
}

- (IBAction)calculateButton:(id)sender {
    
    if(![[NSScanner scannerWithString: [priceField stringValue]] scanDouble: &_price]) {
        NSAlert* alert = [[NSAlert alloc] init];
        [alert setMessageText: @"Error"];
        [alert setInformativeText: @"Invalid input!"];
        [alert runModal];
    }
    else {
        
    }
}

@end
