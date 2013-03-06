//
//  AddMail_Temp.m
//  HairStyleProj
//
//  Created by Vivek Rajput on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AddMail_Temp.h"

#import "Client_Relation.h"
@implementation AddMail_Temp
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

-(IBAction)click{
}
-(void) textFieldDidEndEditing:(UITextField *)textField{

	[txtsubject resignFirstResponder];
	
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	[txtmsg resignFirstResponder];
	[txtsubject resignFirstResponder];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range 
 replacementText:(NSString *)text
{
	if([txtmsg.text isEqualToString:@"Write Here......"]){
        txtmsg.text=@"";
	}
	
	// Any new character added is passed in as the "text" parameter
    if ([text isEqualToString:@"\n"]) {
        // Be sure to test for equality using the "isEqualToString" message
        [textView resignFirstResponder];
		
        // Return FALSE so that the final '\n' character doesn't get added
        return FALSE;
    }
    // For any other character return TRUE so that the text gets added to the view
    return TRUE;
}
-(void) textViewDidBeginEditing:(UITextView *)textView{
    
//	CGRect textFieldRect =[self.view.window convertRect:textView.bounds fromView:textView];
//	CGRect viewRect =[self.view.window convertRect:self.view.bounds fromView:self.view];
//	
//	CGFloat midline = textFieldRect.origin.y + 1.0 * textFieldRect.size.height;
//	CGFloat numerator =midline - viewRect.origin.y- MINIMUM_SCROLL_FRACTION * viewRect.size.height;
//	CGFloat denominator =(MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)* viewRect.size.height;
//	CGFloat heightFraction = numerator / denominator;
//	
//	animatedDistance = floor(162.0 * heightFraction);
//	
//	CGRect viewFrame = view1.frame;
//	
//	viewFrame.origin.y -= animatedDistance;
//	
//	[UIView beginAnimations:nil context:NULL];
//	[UIView setAnimationBeginsFromCurrentState:YES];
//	[UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
//	
//	[view1 setFrame:viewFrame];
//    [UIView commitAnimations];   

}
-(void) textViewDidEndEditing:(UITextView *)textView{
//	CGRect viewFrame = view1.frame;
//	
//	//self.view.frame;
//	viewFrame.origin.y += animatedDistance;
//	
//	[UIScrollView beginAnimations:nil context:NULL];
//	[UIScrollView setAnimationBeginsFromCurrentState:YES];
//	[UIScrollView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
//	
//	[view1 setFrame:viewFrame];
//	
//	[UIScrollView commitAnimations];
//    [UIView commitAnimations];  
    [txtmsg resignFirstResponder];
    
	
	
}

-(IBAction)done:(id)sender{
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Hairstyle.sqlite"];
	
	if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
	{
		
		static sqlite3_stmt *statement;
		statement = nil;
		
		
		const char *sql="insert into EMailTemp(Subject,Message) values(?,?)";
		
		if(sqlite3_prepare_v2(database, sql , -1, &statement, NULL) == SQLITE_OK)
		{
			
			sqlite3_bind_text(statement, 1, [txtsubject.text UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text(statement, 2, [txtmsg.text UTF8String], -1, SQLITE_TRANSIENT);
			
		}
		else
		{
			
			NSAssert1(0, @"Error while creating insert statement. '%s'", sqlite3_errmsg(database));
		}
		
		if(sqlite3_step(statement) == SQLITE_DONE) 
		{
			sqlite3_finalize(statement);
			
			
		}
		else
		{
			NSAssert1(0, @"Error while inserting. '%s'", sqlite3_errmsg(database));
		}
		sqlite3_close(database);
		
	}
	else 
	{
		sqlite3_close(database);
		NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
	}
	
	txtmsg.text=@"";
	txtsubject.text=@"";
	
	[txtmsg resignFirstResponder];
	[txtsubject resignFirstResponder];
	[self.navigationController popViewControllerAnimated:YES];
    
}


-(IBAction)back{
    [txtmsg resignFirstResponder];
	[txtsubject resignFirstResponder];

	[self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    objappdel=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
	[objappdel createEditableCopyOfDatabaseIfNeeded];
	
    txtmsg.layer.cornerRadius = 7.0;
	self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
	
    self.navigationController.navigationBar.hidden=TRUE;

}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title=@"Add E-Mail Template";
		
	

}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
