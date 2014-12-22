//
//  BookView.h
//  BookClub
//
//  Created by Brittny Wright on 12/19/14.
//  Copyright (c) 2014 vientapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ViewController.h"

@interface BookView : UIViewController <NSURLConnectionDelegate>
{
    bool findRand;
   
NSMutableData *downloadedData;
    NSNumber * randRow;
    NSString * genreValue;

}

@property (strong) NSURLConnection *conn;
@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UILabel *Author;
@property (weak, nonatomic) IBOutlet UILabel *publishedDate;
@property (weak, nonatomic) IBOutlet UILabel *Genres;
@property (weak, nonatomic) IBOutlet UILabel *warningLabel;


    @end
