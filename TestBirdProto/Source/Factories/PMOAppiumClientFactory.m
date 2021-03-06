//
//  PMOAppiumClientFactory.m
//  TestBirdProto
//
//  Created by Peter Molnar on 31/07/2018.
//  Copyright © 2018 Peter Molnar. All rights reserved.
//

#import "PMOAppiumClientFactory.h"

@implementation PMOAppiumClientFactory

+ (nullable SEJsonWireClient *)buildClientForServerAddress:(nonnull NSString *)serverAddress serverPort:(NSInteger)serverPort {
    
    NSError *error;
    
    SEJsonWireClient *client = [[SEJsonWireClient alloc] initWithServerAddress:serverAddress port:serverPort error:&error];
    
    if (![error.localizedDescription isEqualToString:@"Success: The command executed successfully."]) {
        
        NSLog(@"****** Error at initialisation of the JsonWireClient: \n %@", error.localizedDescription);
    }
    
    return client;
}

+ (nonnull SECapabilities *)buildCapabilitiesFrom:(nullable NSDictionary *)desiredCapabilities {
    
    SECapabilities *iOSCapabilities = [[SECapabilities alloc] init];
    NSDictionary *defaultCapabilities = @{
                                          @"platformName": @"iOS",
                                          @"platformVersion": @"11.4",
                                          @"deviceName": @"Peter Molnar's iPhone",
                                          @"automationName": @"XCUITest",
                                          @"app": @"/Users/peti/Quiz/Quiz.ipa",
                                          @"noReset" : @"true",
                                          @"xcodeOrgId" : @"3YBS3Y2WC7",
                                          @"udid" : @"aea8d5b777ad201f28f6d0f5b678e9ece13ea6d1",
                                          @"xcodeSigningId" : @"Peter Molnar"
                                          } ;
    
    if (desiredCapabilities) {
        for (NSString *key in desiredCapabilities) {
            if ([desiredCapabilities[key] length] < 1) {
                [iOSCapabilities addCapabilityForKey:key andValue:defaultCapabilities[key]];
            } else {
                [iOSCapabilities addCapabilityForKey:key andValue:desiredCapabilities[key]];
            }
        }
    }
    
    return iOSCapabilities;
}


@end
