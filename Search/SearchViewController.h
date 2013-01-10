//
//  SearchViewController.h
//  Search
//
//  Created by Dina Li on 1/9/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController <UISearchBarDelegate>
{
    //UIScrollView *webScrollView;
    UIWebView *webView;
    UISearchBar *searchBarOne;
    UILabel *testLabel;
    
}

@property (strong, nonatomic) IBOutlet UIWebView *webView;
//@property (nonatomic, retain) IBOutlet UIScrollView *webScrollView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBarOne;
//@property (weak, nonatomic) IBOutlet UILabel *testLabel;

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBarOne;
@end
