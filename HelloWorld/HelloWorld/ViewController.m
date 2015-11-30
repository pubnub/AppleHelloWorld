//
//  ViewController.m
//  HelloWorld
//
//  Created by Jordan Zucker on 11/30/15.
//  Copyright © 2015 pubnub. All rights reserved.
//

#import <PubNub/PubNub.h>
#import "ViewController.h"

@interface ViewController () <PNObjectEventListener>
@property (nonatomic, weak) IBOutlet UILabel *label;
@property (nonatomic, strong) PubNub *client;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.client = [PubNub clientWithConfiguration:[PNConfiguration configurationWithPublishKey:@"demo-36" subscribeKey:@"demo-36"]];
    [self.client addListener:self];
    [self.client subscribeToChannels:@[@"helloWorld"] withPresence:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PNObjectEventListener

- (void)client:(PubNub *)client didReceiveMessage:(PNMessageResult *)message {
    self.label.text = [NSString stringWithFormat:@"%@", message.data.message];
}

@end
