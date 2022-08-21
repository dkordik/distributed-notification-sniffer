// nsdncmon.m

#import <Foundation/NSObject.h>
#import <Foundation/NSNotification.h>
#import <Foundation/NSString.h>
#import <Foundation/NSDistributedNotificationCenter.h>
#import <Foundation/NSRunLoop.h>
#import <stdio.h>

@interface nsdncmon: NSObject {}
-(id) init;
-(void) receiveNotification: (NSNotification*) notification;
@end

NSString *const NAME = @"com.spotify.client.PlaybackStateChanged";

void logNotification(NSNotification* notification) {
    NSLog(@"\r\n"
          "name:     %@\r\n"
          "object:   %@\r\n"
          "userInfo: %@\r\n",
          [notification name],
          [notification object],
          [notification userInfo]);
}

@implementation nsdncmon
-(id) init {
    NSDistributedNotificationCenter * center
        = [NSDistributedNotificationCenter defaultCenter];

    // [center addObserver: self
    //     selector:    @selector(receiveNotification:)
    //     name:        NAME // nil name doesn't work on macOS Catalina (10.15) and later
    //     object:      nil
    // ];

    [center addObserverForName:NAME // nil name doesn't work on macOS Monteray (12) and later
        object:nil
        queue:nil
        usingBlock:^(NSNotification *notification){
          fprintf(stderr,"addObserverForName:FOUND...\r\n");
          logNotification(notification);
        }];

    fprintf(stderr,"Listening...\n");
    [[NSRunLoop currentRunLoop] run];
    fprintf(stderr,"Stopping...\n");
    return self;
}
-(void) receiveNotification: (NSNotification*) notification {
    fprintf(stderr,"addObserver:FOUND...\n");
    logNotification(notification);
}
@end

int main( int argc, char ** argv) {
    [[nsdncmon alloc] init];
    return 0;
}
