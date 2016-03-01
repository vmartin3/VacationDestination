//
//  Destinations.m
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 3/1/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import "Destinations.h"

@implementation Destinations

-(void) setDestinationImage: (UIImage *) destinationImage{
    NSData *imageData = UIImagePNGRepresentation(destinationImage);
    self.image = imageData;
}

-(UIImage *) getDestinationImage{
    UIImage *destImage = [UIImage imageWithData:self.image];
    return destImage;
}


@end
