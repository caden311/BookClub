//
//  BookView.m
//  BookClub
//
//  Created by Brittny Wright on 12/19/14.
//  Copyright (c) 2014 vientapps. All rights reserved.
//

#import "BookView.h"

@interface BookView ()

@end

@implementation BookView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getRandomBook];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)getRandomBook
{
    
        [self downloadItems];
        
   // [self getBook];
    
}


-(void)downloadItems
{
    //NSString * username = self.uNameTextField.text;
    NSString * query = [NSString stringWithFormat:@"http://24.10.161.128/BookClub/phpService/service.php?query=Select * from `Books` join `BookGenre` on Books.bookId=BookGenre.bookId where BookGenre.bookGenre='Fiction'"];
    NSString * stringURL = [query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *jsonFileUrl = [NSURL URLWithString:stringURL];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    
    
}

#pragma mark NSURLConnectionDataProtocol Methods

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    downloadedData = [[NSMutableData alloc] init];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [downloadedData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:downloadedData options:NSJSONReadingAllowFragments error:&error];
    
    
    // Create an array to store the locations
   // NSString *correctPassword;
   // NSString *adminCode;
    
    
    // Loop through Json objects, create question objects and add them to our questions array
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSDictionary *jsonElement = jsonArray[i];
        NSString * book = jsonElement[@"bookName"];
        
         NSLog(book);
        //correctPassword = jsonElement[@"password"];
       // adminCode = jsonElement[@"isAdmin"];
        
    }
    

    
    // Ready to notify delegate that data is ready and pass back items
}

/*
-(void)getBook
{

    
        NSString * query = [NSString stringWithFormat:@"http://24.10.161.128/BookClub/phpService/service.php?query=Select * from `Books` join `BookGenre` on Books.bookId=BookGenre.bookId where BookGenre.bookGenre='Nonfiction'"];
        NSString * stringURL = [query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *jsonFileUrl = [NSURL URLWithString:stringURL];
        NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
        [NSURLConnection connectionWithRequest:urlRequest delegate:self];
        _conn = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
        
        NSError *error;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:downloadedData options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *jsonElement2 = jsonArray[0];
    
    NSString * book = [[NSString alloc] initWithString:jsonElement2[@"bookName"]];
    
    
    NSLog(book);

}
*/




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
