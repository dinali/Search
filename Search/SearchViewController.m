//
//  SearchViewController.m
//  Search
//
//  Created by Dina Li on 1/9/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

//TODO: most but not all(?) of the code for adding the tap to zoom is here

#import "SearchViewController.h"
//#define ZOOM_VIEW_TAG 100
//#define ZOOM_STEP 1.5

@implementation SearchViewController

@synthesize webView = _webView;
//@synthesize testLabel = _testLabel;
//@synthesize webScrollView = _webScrollView;
@synthesize searchBarOne = _searchBarOne;

//- (void)loadView {
//    [super loadView];
//    
//    // set the tag for the image view
//    [webView setTag:ZOOM_VIEW_TAG];
//    
//    // add gesture recognizers to the image view
//    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
//    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
//    UITapGestureRecognizer *twoFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTwoFingerTap:)];
//    
//    [doubleTap setNumberOfTapsRequired:2];
//    [twoFingerTap setNumberOfTouchesRequired:2];
//    
//    [webView addGestureRecognizer:singleTap];
//    [webView addGestureRecognizer:doubleTap];
//    [webView addGestureRecognizer:twoFingerTap];
//    
//    // calculate minimum scale to perfectly fit image width, and begin at that scale
//    float minimumScale = [webScrollView frame].size.width  / [webView frame].size.width;
//    [webScrollView setMinimumZoomScale:minimumScale];
//    [webScrollView setZoomScale:minimumScale];
//}


- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBarOne {
//    NSURL *url =  [NSURL URLWithString: @"http://www.ers.usda.gov"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    NSLog(@"url searchBarTextDidEndEditing = %@", url);
//    
//    [_webView loadRequest:request];
}

#pragma mark -
#pragma mark UISearchBarDelegate

// called when the bookmark button inside the search bar is tapped
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"bookmark button clicked");
}

// called when keyboard search button pressed
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchTerm = [_searchBarOne.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    //  NSString *stringURL = [NSString stringWithFormat:@"http://search.usa.gov/search?utf8=✓&sc=1&query=usda+economic+research+service&m=&embedded=&affiliate=usagov&filter=moderate"];
    
    NSString *stringURL = [NSString stringWithFormat:@"http://search.usa.gov/search?utf8=✓&sc=1&query=usda+economic+research+service&m=&embedded=&affiliate=usagov&filter=moderate&query=%@",searchTerm];
    
    NSLog(@"viewDidLoad url = %@", stringURL);
    
    NSString* webStringURL = [stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL* urlFinal = [NSURL URLWithString:webStringURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:urlFinal];
    
    [_webView loadRequest:request];
    
//    NSString* stringURL = [NSString stringWithFormat:@"http://search.ers.usda.gov/search?affiliate=ers&query=%@",searchTerm];

}


//TODO: not implemented
// called when cancel button pressed
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	NSLog(@"cancel button clicked");
}

- (void) viewWillAppear:(BOOL)animated
{
//    _testLabel.text = @"this is a test";
}

// display a page in the UIView on load
- (void)viewDidLoad
{
    _searchBarOne.delegate = self;
	//_searchBarOne.showsCancelButton = YES;
    //_searchBarOne.showsBookmarkButton = YES;
    
    NSURL *url =  [NSURL URLWithString: @"http://www.ers.usda.gov"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSLog(@"viewDidLoad url = %@", url);
    
    [_webView loadRequest:request];
    [super viewDidLoad];
}


- (void)viewDidUnload
{
   // self.webScrollView = nil;
   // self.webView = nil;
    [self setSearchBarOne:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

/*
#pragma mark UIScrollViewDelegate methods

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [webScrollView viewWithTag:ZOOM_VIEW_TAG];
}
*/
/************************************** NOTE **************************************/
/* The following delegate method works around a known bug in zoomToRect:animated: */
/* In the next release after 3.0 this workaround will no longer be necessary      */
/**********************************************************************************/
//- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale {
//    [scrollView setZoomScale:scale+0.01 animated:NO];
//    [scrollView setZoomScale:scale animated:NO];
//}
//
//#pragma mark TapDetectingImageViewDelegate methods
//
//- (void)handleSingleTap:(UIGestureRecognizer *)gestureRecognizer {
//    // single tap does nothing for now
//}
//
//- (void)handleDoubleTap:(UIGestureRecognizer *)gestureRecognizer {
//    // double tap zooms in
//    float newScale = [webScrollView zoomScale] * ZOOM_STEP;
//    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
//    [webScrollView zoomToRect:zoomRect animated:YES];
//}
//- (void)handleTwoFingerTap:(UIGestureRecognizer *)gestureRecognizer {
//    // two-finger tap zooms out
//    float newScale = [webScrollView zoomScale] / ZOOM_STEP;
//    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
//    [webScrollView zoomToRect:zoomRect animated:YES];
//}

//#pragma mark Utility methods
//
//- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center {
//    
//    CGRect zoomRect;
//    
//    // the zoom rect is in the content view's coordinates.
//    //    At a zoom scale of 1.0, it would be the size of the webScrollView's bounds.
//    //    As the zoom scale decreases, so more content is visible, the size of the rect grows.
//    zoomRect.size.height = [webScrollView frame].size.height / scale;
//    zoomRect.size.width  = [webScrollView frame].size.width  / scale;
//    
//    // choose an origin so as to get the right center.
//    zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0);
//    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0);
//    
//    return zoomRect;
//}


@end

