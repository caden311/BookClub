//
//  ViewController.m
//  BookClub
//
//  Created by Brittny Wright on 12/19/14.
//  Copyright (c) 2014 vientapps. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
     Genres = [[NSMutableArray alloc] init];
    
    [self initGenresArray];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)NonFiction:(id)sender {
    
    Genres[0]=[NSNumber numberWithInt:1];
 
    
}

-(void) initGenresArray
{
    
    for(int i=0; i<10; i++)
    {
        
        Genres [i]=[NSNumber numberWithInt:0];
    
    }
    
}
@end
