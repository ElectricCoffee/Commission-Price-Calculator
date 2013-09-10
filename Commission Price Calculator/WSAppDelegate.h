//
//  WSAppDelegate.h
//  Commission Price Calculator
//
//  Created by Electric Coffee on 9/9/13.
//  Copyright (c) 2013 Electric Coffee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface WSAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSTextField *priceField;

@property (weak) IBOutlet NSTextField *currencyField;

@property (weak) IBOutlet NSPopUpButton *typePopUp;

@property (weak) IBOutlet NSTextField *additionalField;

@property (weak) IBOutlet NSTextField *additionalLabel;

- (IBAction)calculateButton:(id)sender;

@end
