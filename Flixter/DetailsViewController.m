//
//  DetailsViewController.m
//  Flixter
//
//  Created by Daphne Lopez on 6/16/22.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backPosterImage;
@property (weak, nonatomic) IBOutlet UIImageView *frontPosterImage;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Use the informaion received to poulate my views
    NSString *movieTitle = self.movieInfo[@"title"];
    NSString *movieSynopsis = self.movieInfo[@"overview"];
    // Assign labels
    self.movieTitleLabel.text = movieTitle;
    self.synopsisLabel.text = movieSynopsis;
    // Load and assign poster image
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = self.movieInfo[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    NSURL *posterURL =[NSURL URLWithString:fullPosterURLString];
    [self.frontPosterImage setImageWithURL:posterURL];
    //backdrop photo
    [self.backPosterImage setImageWithURL:posterURL];

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
