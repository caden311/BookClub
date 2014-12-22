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
    
    //[self initGenresArray];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)NonFiction:(id)sender {
    
    
    NSString * value = [[NSString alloc] initWithFormat:@"Nonfiction"];
    if(_NonFictionOutlet.alpha == 1&&[Genres count]<4)
    {
    _NonFictionOutlet.alpha=.3;

    [Genres addObject:value];
    }
    else
    {
        _NonFictionOutlet.alpha=1;
        [Genres removeObject:value];
        
    }
    
}

-(void) initGenresArray
{
    
    for(int i=0; i<10; i++)
    {
        
        [Genres insertObject:0 atIndex:i];
    
    }
    
}
- (IBAction)Fiction:(id)sender
{
    
    NSString * value = [[NSString alloc] initWithFormat:@"Fiction"];
    if(_FictionOutlet.alpha == 1&&[Genres count]<4)
    {
        _FictionOutlet.alpha=.3;
        
        [Genres addObject:value];
    }
    else
    {
        _FictionOutlet.alpha=1;
        [Genres removeObject:value];
        
    }
}
@end
