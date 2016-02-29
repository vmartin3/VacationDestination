//
//  Singleton.h
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/17/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface Singleton : UIViewController
{
    NSMutableArray *allPostedDestinations;
}
@property BOOL *hasRunBefore;
@property NSMutableArray* allPostedDestinations;
+ (Singleton *) sharedSingleton;
- (void)initialPost;
- (void)addPost:(Post *)post;
- (id)init;

@end
