//
//  RegisterVC.m
//  Home Loan : REA
//
//  Created by Dheina Lundi A on 04/09/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import "RegisterVC.h"

#import "MLTableAlert.h"

@interface RegisterVC ()

@end

@implementation RegisterVC


MLTableAlert *alert;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"img_bg_triangle_loop"]];
    
    [self.scrollView addSubview:self.content];
    [self.scrollView setContentSize:self.content.frame.size];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"SignUp"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
    
    
    
    
    
    
}


-(IBAction)showAgencyTable:(id)sender
{
	// create the alert
	alert = [MLTableAlert tableAlertWithTitle:@"Choose an option..." cancelButtonTitle:@"Cancel" numberOfRows:^NSInteger (NSInteger section)
                  {
                      return 10;
//                      if (self.rowsNumField.text == nil || [self.rowsNumField.text length] == 0 || [self.rowsNumField.text isEqualToString:@"0"])
//                          return 1;
//                      else
//                          return [self.rowsNumField.text integerValue];
                  }
                                          andCells:^UITableViewCell* (MLTableAlert *anAlert, NSIndexPath *indexPath)
                  {
                      static NSString *CellIdentifier = @"CellIdentifier";
                      UITableViewCell *cell = [anAlert.table dequeueReusableCellWithIdentifier:CellIdentifier];
                      if (cell == nil)
                          cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                      
                      cell.textLabel.text = [NSString stringWithFormat:@"Section %d Row %d", indexPath.section, indexPath.row];
                      
                      return cell;
                  }];
	
	// Setting custom alert height
	alert.height = 350;
	
	// configure actions to perform
	[alert configureSelectionBlock:^(NSIndexPath *selectedIndex){
//		self.resultLabel.text = [NSString stringWithFormat:@"Selected Index\nSection: %d Row: %d", selectedIndex.section, selectedIndex.row];
	} andCompletionBlock:^{
//		self.resultLabel.text = @"Cancel Button Pressed\nNo Cells Selected";
	}];
	
	// show the alert
	[alert show];
}


- (void)keyboardWasShown:(NSNotification *)notification
{
    self.btnInvisible.hidden=NO;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    CGRect rectOld = self.scrollView.frame;
    rectOld.size.height = rectOld.size.height-215;
    self.scrollView.frame =rectOld;
    [UIView commitAnimations];
}
- (void)keyboardWasHide:(NSNotification *)notification
{
    self.btnInvisible.hidden=YES;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    CGRect rectOld = self.scrollView.frame;
    rectOld.size.height = rectOld.size.height+215;
    self.scrollView.frame =rectOld;
    [UIView commitAnimations];
}

-(IBAction)btnInvHideKeyboard:(id)sender
{
    [self hideKeyboard];
}
-(void)hideKeyboard
{
    [self.view endEditing:YES];
}
//textFieldShouldReturn
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self hideKeyboard];
    return NO;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
