//
//  PostCell.m
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/16/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import "PostCell.h"

@implementation PostCell

- (void)awakeFromNib {
    //Rounds image in the cell of the page displaying all the post
    [super awakeFromNib];
    [[self.destinationImage layer]setCornerRadius:self.destinationImage.frame.size.width / 2];
    [self.destinationImage setClipsToBounds: YES];
}

//Grabs data entered by the user on the add destination page and puts into these variables that will used to post data to the cells of the table
- (void)configureCell: (Destinations *)dest {
    self.destinationName.text = dest.destinationName;
    self.destinationDescription.text = dest.destinationDescription;
    [self.destinationImage setImage:[dest getDestinationImage]];
}

@end
