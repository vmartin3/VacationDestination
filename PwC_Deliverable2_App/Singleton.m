//
//  Singleton.m
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/17/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import "Singleton.h"
#import "Post.h"

@implementation Singleton

@synthesize allPostedDestinations;
static Singleton *sharedSingleton = nil;


+ (Singleton *) sharedSingleton {
    @synchronized(self) {
        if (sharedSingleton == nil){
            sharedSingleton = [[self alloc] init];
        }
    }
    return sharedSingleton;
}

- (id)init {
    if (self = [super init]) {
        allPostedDestinations = [[NSMutableArray alloc]init];
    }
    return self;
}

//This function is only called once the first time viewDidload runs, the boolean hasRunBefore is set to true after it runs once
- (void)initialPost {
    if (self.hasRunBefore == NO) {
    Post *initalPost = [[Post alloc]initWithDestinationInformation:nil destinationName:@"Barbados" destinationDescription:@"This was a great trip with the family to this beautiful country in the West Indies. The food was amazing and the water was so clear!"];
     [self addPost:initalPost];
    self.hasRunBefore = YES;
    }
}

//Adds new posts to master array list
- (void)addPost:(Post *)post {
    [allPostedDestinations addObject:post];
}

@end
