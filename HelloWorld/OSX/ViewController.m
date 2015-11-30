//
//  ViewController.m
//  OSX
//
//  Created by Jordan Zucker on 11/30/15.
//  Copyright © 2015 pubnub. All rights reserved.
//

#import <PubNub/PubNub.h>
#import "ViewController.h"

@interface ViewController () <PNObjectEventListener>
@property (nonatomic, weak) IBOutlet NSTextField *textField;
@property (nonatomic, strong) PubNub *client;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    self.client = [PubNub clientWithConfiguration:[PNConfiguration configurationWithPublishKey:@"demo-36" subscribeKey:@"demo-36"]];
    [self.client addListener:self];
    [self.client subscribeToChannels:@[@"helloWorld"] withPresence:YES];
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

#pragma mark - PNObjectEventListener

- (void)client:(PubNub *)client didReceiveMessage:(PNMessageResult *)message {
    self.textField.stringValue = [NSString stringWithFormat:@"%@", message.data.message];
}

@end
