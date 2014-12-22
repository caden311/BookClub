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
    _warningLabel.text=@"";
    findRand=false;
    
    
   
    
    [self getRandomBook];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)getRandomBook
{
        if( [Genres count] <1)
        {
            _warningLabel.text=@"Please go back and select a genre(s)";
        }
        else if([Genres count]<2)
        {
            genreValue = Genres[0];
            [self downloadItemsForOne:genreValue];
        }
   // [self getBook];
    
}


-(void)downloadItemsForOne:(NSString *) val
{
    if(findRand==false)
    {
        //NSString * username = self.uNameTextField.text;
        NSString * query = [NSString stringWithFormat:@"http://24.10.161.128/BookClub/phpService/modifiedService.php?query=SELECT count(*) as cnt FROM Books JOIN BookGenre ON Books.bookId=BookGenre.bookId WHERE BookGenre.bookGenre='%@'",val];
        NSString * stringURL = [query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *jsonFileUrl = [NSURL URLWithString:stringURL];
        NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
        [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    }
    else
    {
        NSString * query = [NSString stringWithFormat:@"http://24.10.161.128/BookClub/phpService/modifiedService.php?query=SELECT * FROM Books JOIN BookGenre ON Books.bookId=BookGenre.bookId WHERE BookGenre.bookGenre='%@'& Limit 1 Offset %@",val, randRow];
        NSString * stringURL = [query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *jsonFileUrl = [NSURL URLWithString:stringURL];
        NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
        [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    }
    
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
    if(findRand==false)
    {
        NSDictionary *jsonElement =jsonArray[0];
       
        NSString * counter=jsonElement[@"cnt"];
        
        int random =[counter intValue];
        
        if(random>0)
        {
            int val =((arc4random()%random));
            randRow=[NSNumber numberWithInt:val];
        }
        else
        {
            randRow=[NSNumber numberWithInt:random];
        }
     
        
      
        findRand=true;
       
        [self getRandomBook];
        
    }
    else
    {
    
        // Loop through Json objects, create question objects and add them to our questions array
        for (int i = 0; i < jsonArray.count; i++)
        {
            NSDictionary *jsonElement = jsonArray[i];
            _bookName.text = jsonElement[@"bookName"];
            _Author.text = jsonElement[@"Author"];
            _publishedDate.text=jsonElement[@"publishedDate"];
            _Genres.text=jsonElement[@"bookGenre"];
     
        
        }
    
    }
    
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
