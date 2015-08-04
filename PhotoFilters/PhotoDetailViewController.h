//
//  PhotoDetailViewController.h
//  PhotoFilters
//
//  Created by Vincent Chau on 8/3/15.
//  Copyright (c) 2015 Vincent Chau. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Photo; //forward declaration

@interface PhotoDetailViewController : UIViewController

@property (strong, nonatomic) Photo *photo;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)addFilterButtonPressed:(id)sender;
- (IBAction)deleteButtonPressed:(id)sender;

@end
