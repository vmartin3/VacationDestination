//
//  DataService.h
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/23/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Post.h"

@interface DataService : NSObject{
    NSUserDefaults *defaults;
    NSString *KEY_POSTS;
}
@property (nonatomic, strong) NSMutableArray *loadedPosts;

+ (id)sharedService;
- (void)loadPosts;
- (void)savePosts;
- (void)addPosts:(Post *)post;
- (NSString *)saveImageAndCreatePath:(UIImage *)image;
- (UIImage *)imageForPath:(NSString *)path;
- (NSString *)documentsPathForFilename:(NSString *)name;

@end
