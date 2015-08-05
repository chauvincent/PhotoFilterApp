//
//  FilterCollectionViewController.h
//  PhotoFilters
//
//  Created by Vincent Chau on 8/4/15.
//  Copyright (c) 2015 Vincent Chau. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Photo;

@interface FilterCollectionViewController : UICollectionViewController

@property (strong, nonatomic) Photo *photo;

@end
