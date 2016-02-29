//
//  Post.h
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/16/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Post.h"
#import <UIKit/UIKit.h> 

@interface Post : NSObject <NSCoding>

@property (nonatomic,strong) NSString       *chosenImagePath;
@property (nonatomic,strong) NSString       *destinationTitle;
@property (nonatomic,strong) NSString       *destinationDescription;

//Creating custom intializer so that all new post include this data
- (id)initWithDestinationInformation:(NSString *)chosenImage destinationName:(NSString *)destName destinationDescription:(NSString *)destDescription;


@end
