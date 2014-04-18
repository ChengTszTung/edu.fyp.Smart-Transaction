//
//  InvoiceTableViewController.m
//  Smart Transaction
//
//  Created by TszTung Cheng on 13/12/13.
//  Copyright (c) 2013 1314-114102-02. All rights reserved.
//

#import "InvoiceTableViewController.h"
#import "Transaction.h"
#import "InvoicePDF.h"


@interface InvoiceTableViewController ()
{
    NSURL *fileURL;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray* transactions;
@property (strong, nonatomic) UIView* errorView;
@property (strong, nonatomic) UILabel* errorMsg;
@property (strong, nonatomic) UIDocumentInteractionController* documentInteractionController;
@end

@implementation InvoiceTableViewController
NSString *url;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _transactions = [[NSArray alloc]init];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]
                                        init];
    [refreshControl addTarget:self action:@selector(updateData:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    [self.refreshControl beginRefreshing];
    if (self.tableView.contentOffset.y == 0) {
        
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^(void){
            
            self.tableView.contentOffset = CGPointMake(0, -self.refreshControl.frame.size.height);
            
        } completion:^(BOOL finished){
            
        }];
        
    }
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [self updateData:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_transactions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"invoiceListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate* date = [[_transactions objectAtIndex:indexPath.row] createdAt];
    NSString *dateTime = [formatter stringFromDate:date];
    
    [cell.textLabel setText:dateTime];
    [cell.detailTextLabel setText:dateTime];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    Transaction* temp = (Transaction*)[_transactions objectAtIndex:indexPath.row];
//    NSLog(@"object %@" , temp);
//    NSLog(@"object %@" , (TransactionItem*)temp.transactionItems[0]);
//    NSLog(@"object %@" , [(TransactionItem*)temp.transactionItems[0] product]);
//    
//    //NSLog(@"object %@" , [(TransactionItem*)temp.transactionItems[0] createdAt]);
//

    [InvoicePDF generateInvoicePDF:@"" withTransaction:(Transaction*)[_transactions objectAtIndex:indexPath.row]];
    NSString* fileName = @"Invoice.PDF";
    NSArray *arrayPaths =
    NSSearchPathForDirectoriesInDomains(
                                        NSDocumentDirectory,
                                        NSUserDomainMask,
                                        YES);
    NSString *path = [arrayPaths objectAtIndex:0];
    NSString* pdfFileName = [path stringByAppendingPathComponent:fileName];
    fileURL = [NSURL fileURLWithPath:pdfFileName];
    
    self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:fileURL];
    [self.documentInteractionController setDelegate:self];
    [self.documentInteractionController presentPreviewAnimated:YES];
    
    
}

-(UIViewController*)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller
{
    return [self navigationController];
}


- (void)updateData:(id)sender
{
    PFQuery *query = [Transaction query];
    [query includeKey:@"user"];
    [query includeKey:@"transactionItems"];
    [query includeKey:@"transactionItems.product"];
    [query whereKey:@"user" equalTo:[PFUser currentUser]];
    
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            _transactions = [[NSArray alloc]init];
            _transactions = [objects copy];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
        [self.refreshControl endRefreshing];
        [self.tableView reloadData];
    }];
}


@end
