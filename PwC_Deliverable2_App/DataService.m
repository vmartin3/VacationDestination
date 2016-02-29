//
//  DataService.m
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/23/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import "DataService.h"

@implementation DataService

+ (id)sharedService {
    
    static DataService *sharedDataService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDataService = [[self alloc]init];
    });
    
    return sharedDataService;
}

- (id)init {
    if (self = [super init]) {
        KEY_POSTS = @"posts";
        self.loadedPosts = [[NSMutableArray alloc]init];
        defaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

- (void)addPosts:(Post *)post{
    [self.loadedPosts addObject:post];
    [self savePosts];
    [self loadPosts];
}


//Converts loadedPosts array in data that can be stored
- (void)savePosts {
    
    NSData *postsData = [NSKeyedArchiver archivedDataWithRootObject:self.loadedPosts];
    [defaults setObject:postsData forKey:KEY_POSTS];
    [defaults synchronize];
}

-(void)loadPosts{
    
    NSData *postsData = [defaults objectForKey:KEY_POSTS];
    if (postsData) {
        NSMutableArray *postsArray = [NSKeyedUnarchiver unarchiveObjectWithData:postsData];
        self.loadedPosts = postsArray;
    }
    
    //Notifies the observer in view controller class that post have been loaded
    [[NSNotificationCenter defaultCenter]postNotificationName:@"postsLoaded" object:nil];

}

- (UIImage *)imageForPath:(NSString *)path{
    NSString *fullPath = [self documentsPathForFilename:path];
    UIImage *image = [UIImage imageNamed:fullPath];
    return image;
}

//Turning images into data saving each data file with unqiue name using timestamp
- (NSString *)saveImageAndCreatePath:(UIImage *)image{
    NSData *imageData = UIImagePNGRepresentation(image);
    NSTimeInterval timeInt = [NSDate timeIntervalSinceReferenceDate];
    
    NSString *imagePath = [NSString stringWithFormat:@"image%f.png", timeInt];
    NSString *fullPath = [self documentsPathForFilename:imagePath];
    [imageData writeToFile:fullPath atomically:YES];
    return imagePath;
}

- (NSString *)documentsPathForFilename:(NSString *)name{
    //Grabbing paths of images from documents directory and grabbing first element from array that is returned
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *fullPath = paths[0];
    //Adding file name that is being passed into the end of the path and saving data there
    return [fullPath stringByAppendingPathComponent:name];
}
@end
