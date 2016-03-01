//
//  Destinations.h
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 3/1/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Destinations : NSManagedObject

-(UIImage *) getDestinationImage;
-(void) setDestinationImage: (UIImage *) destinationImage;

@end

NS_ASSUME_NONNULL_END

#import "Destinations+CoreDataProperties.h"
