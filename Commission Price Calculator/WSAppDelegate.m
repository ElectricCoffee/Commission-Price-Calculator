//
//  WSAppDelegate.m
//  Commission Price Calculator
//
//  Created by Electric Coffee on 9/9/13.
//  Copyright (c) 2013 Electric Coffee. All rights reserved.
//

#import "WSAppDelegate.h"

typedef enum {
    ItemChooseOne,
    ItemPricePerCharacter,
    ItemPercentSaved
} ItemIndexes;

void alert(NSString* message, NSString* informative) {
    NSAlert* alert = [[NSAlert alloc] init];
    [alert setMessageText: message];
    [alert setInformativeText: informative];
    [alert runModal];
}

@implementation WSAppDelegate

@synthesize priceField, currencyField, typePopUp, additionalField, additionalLabel;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _price = 0.0;
    [typePopUp removeAllItems];
    [typePopUp addItemsWithTitles:
     [NSArray arrayWithObjects:
      @"Choose one...", @"Price per character", @"Percent saved", nil]];
}

- (IBAction)itemChanged:(id)sender {
    NSInteger index = [(NSPopUpButton*)sender indexOfSelectedItem];
    switch (index) {
            
        case ItemChooseOne:
            _currency = @" ";
            [additionalLabel setStringValue: _currency];
            break;
            
        case ItemPricePerCharacter:
            _currency = [currencyField stringValue];
            [additionalLabel setStringValue: _currency];
            break;
            
        case ItemPercentSaved:
            _currency = @"%";
            [additionalLabel setStringValue: _currency];
            break;
            
        default:
            alert(@"Error", @"Please select a calculation type!");
            break;
    }
    
}

- (IBAction)calculateButton:(id)sender {
    
    if(![[NSScanner scannerWithString: [priceField stringValue]] scanDouble: &_price]) {        
        alert(@"Error", @"Invalid input!");
    }
    else {
        
    }
}

@end
