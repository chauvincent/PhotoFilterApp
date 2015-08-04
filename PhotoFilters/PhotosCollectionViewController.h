//
//  PhotosCollectionViewController.h
//  PhotoFilters
//
//  Created by Vincent Chau on 8/1/15.
//  Copyright (c) 2015 Vincent Chau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"
@interface PhotosCollectionViewController : UICollectionViewController

- (IBAction)cameraBarButtonItemPressed:(id)sender;
@property (strong, nonatomic) Album *album;

@end
