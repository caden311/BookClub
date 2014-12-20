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
bool validLogin;
bool collectData;
NSMutableData *downloadedData;

}

@property (strong) NSURLConnection *conn;


    @end
