//
//  PostCell.h
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/16/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Destinations.h"

@interface PostCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *destinationImage;
@property (weak, nonatomic) IBOutlet UILabel     *destinationName;
@property (weak, nonatomic) IBOutlet UILabel     *destinationDescription;

- (void)configureCell:(Destinations *)dest;

@end
