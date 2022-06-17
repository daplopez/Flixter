//
//  MovieViewController.m
//  Flixter
//
//  Created by Daphne Lopez on 6/15/22.
//

#import "MovieViewController.h"
#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"
#import "DetailsViewController.h"

@interface MovieViewController () <UITableViewDataSource, UITableViewDelegate>

// Create array property
@property (nonatomic, strong) NSArray *movies;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end

@implementation MovieViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    // TODO: start animating load state
    [self.activityIndicator startAnimating];
    // Table View
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 170;
    
    [self fetchMovies];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchMovies) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    // TODO: Stop animating load state
    [self.activityIndicator stopAnimating];
    
}

- (void)fetchMovies {
    // TODO: reuse cells
    //tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier)
    
    // Calling API
    // Creating URL
    NSURL *url = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=ea542190563ddd85fc11d6cbe35ca3d0"];
    // Creating request
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    // Creating session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    // Creating session task
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
           }
           else {
               // TODO: Get the array of movies
               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               // TODO: Store the movies in a property to use elsewhere
               self.movies = dataDictionary[@"results"];
               //NSLog(@"%@", dataDictionary);// log an object with the %@ formatter.
               // TODO: Reload your table view data
               [self.tableView reloadData];
               
           }
        
        [self.refreshControl endRefreshing];
        
       }];
    // send request now
    [task resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Reusing cell
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    // Getting movie ans setting labels
    NSDictionary *movie = self.movies[indexPath.row];
    cell.titleLabel.text = movie[@"title"];
    cell.synopsisLabel.text = movie[@"overview"];
    
    // Getting poster image
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = movie[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    NSURL *posterURL =[NSURL URLWithString:fullPosterURLString];
    cell.posterView.image = nil;
    [cell.posterView setImageWithURL:posterURL];
    
    return cell;
}

#pragma mark - Navigation

//In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // save the index path to know what dictionary you need to pass
    NSIndexPath *indexPath =[self.tableView indexPathForCell:sender];
    // Get movie dictionary
    NSDictionary * dataToPass = self.movies[indexPath.row];
    // Get the new view controller using [segue destinationViewController].
    DetailsViewController *detailsVC = [segue destinationViewController];
    // Pass the selected object to the new view controller property.
    detailsVC.movieInfo = dataToPass;

}


@end
