//
//  PostCell.h
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/16/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "DataService.h"

@interface PostCell : UITableViewCell{
    DataService *myData;
}

@property (weak, nonatomic) IBOutlet UILabel     *destinationName;
@property (weak, nonatomic) IBOutlet UILabel     *destinationDescription;
@property (weak, nonatomic) IBOutlet UIImageView *destinationImage;

- (void)configureCell:(Post*)post;
@end
