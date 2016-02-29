//
//  Post.m
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/16/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import "Post.h"

@implementation Post
- (id)initWithDestinationInformation:(NSString *)imagePath destinationName:(NSString *)destName destinationDescription:(NSString *)destDescription {
    self.chosenImagePath = imagePath;
    self.destinationTitle = destName;
    self.destinationDescription = destDescription;
    self = [super init];
    return self;
}


//Unarchive with data grabs this information first when loading data
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.chosenImagePath = [aDecoder decodeObjectForKey:@"imagePath"];
        self.destinationTitle = [aDecoder decodeObjectForKey:@"title"];
        self.destinationDescription = [aDecoder decodeObjectForKey:@"description"];
    }
    return self;
}

//When saving data this is called 
- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.chosenImagePath forKey:@"imagePath"];
    [aCoder encodeObject:self.destinationTitle forKey:@"title"];
    [aCoder encodeObject:self.destinationDescription forKey:@"description"];

    
}

@end
