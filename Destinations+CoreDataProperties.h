//
//  Destinations+CoreDataProperties.h
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 3/1/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Destinations.h"

NS_ASSUME_NONNULL_BEGIN

@interface Destinations (CoreDataProperties)

@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, retain) NSString *destinationName;
@property (nullable, nonatomic, retain) NSString *destinationDescription;

@end

NS_ASSUME_NONNULL_END
