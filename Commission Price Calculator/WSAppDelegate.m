//
//  WSAppDelegate.m
//  Commission Price Calculator
//
//  Created by Electric Coffee on 9/9/13.
//  Copyright (c) 2013 Electric Coffee. All rights reserved.
//

#import "WSAppDelegate.h"
#import "WSLogic.h"
#import "WSUtility.h"
#import "ItemIndexes.h" // defines the enum that is used in the switch,
                        // it's used in a separate header so I can use it across classes

void alert(NSString* message, NSString* informative) {
    NSAlert* alert = [[NSAlert alloc] init];
    [alert setMessageText: message];
    [alert setInformativeText: informative];
    [alert runModal];
}

@implementation WSAppDelegate

@synthesize
    priceField,
    currencyField,
    typePopUp,
    additionalField,
    additionalLabel;

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
            
        case ItemPricePerCharacter:
            _currency = [currencyField stringValue];
            [additionalLabel setStringValue: _currency];
            break;
            
        case ItemPercentSaved:
            _currency = @"%";
            [additionalLabel setStringValue: _currency];
            break;
            
        case ItemChooseOne:
            _currency = @" ";
            [additionalLabel setStringValue: _currency];
            //break; // fallthrough (not currently working)
            
        default:
            [WSUtility alertWithMessage: @"Error"
                         andInformative: @"Please select a calculation type!"];
            break;
    }
    
}

- (IBAction)calculateButton:(id)sender {
    
    if(![[NSScanner scannerWithString: [priceField stringValue]] scanDouble: &_price]) {
        
        [WSUtility alertWithMessage: @"Error"
                     andInformative: @"Invalid input!"];
    }
    else {

    }
}

@end
