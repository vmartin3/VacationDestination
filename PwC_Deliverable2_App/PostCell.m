//
//  PostCell.m
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/16/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import "PostCell.h"
#import "Post.h"

@implementation PostCell

- (void)awakeFromNib {
    //Rounds image in the cell of the page displaying all the post
    [super awakeFromNib];
    myData = [DataService sharedService];
    [[self.destinationImage layer]setCornerRadius:self.destinationImage.frame.size.width / 2];
    [self.destinationImage setClipsToBounds: YES];
}

//Grabs data entered by the user on the add destination page and puts into these variables that will used to post data to the cells of the table
- (void)configureCell: (Post*)post {
    self.destinationName.text = post.destinationTitle;
    self.destinationDescription.text = post.destinationDescription;
    [self.destinationImage setImage:[myData imageForPath:post.chosenImagePath]];
}

@end
