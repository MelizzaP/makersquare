require_relative 'banking'

lady = Person.new("Jan Headley", 2000) #What's up Jan Headley?  You have $2000

man = Person.new("Michael Stope", 1400) # What's up Michael Stope?  You have $1400

usaa = Bank.new ("USAA") #The bank, USAA, has been created.
p usaa #<Bank:0x007faa6b846e40 @name="USAA", @accounts={}>
fun = Bank.new ("Fun Credit Union") #The bank, Fun Credit Union, has been created.
p fun #<Bank:0x007faa6b846c38 @name="Fun Credit Union", @accounts={}>

usaa.new_account(lady) #Jan Headley, you have opened an account with USAA.
usaa.new_account(man)  #Michael Stope, you have opened an account with USAA.
fun.new_account(lady)  #Jan Headley, you have opened an account with Fun Credit Union.
fun.new_account(man)  #Michael Stope, you have opened an account with Fun Credit Union.

usaa.deposit(lady, 500)		#Jan Headley, you have deposited $500 into your account with USAA.  Your balance is now $500
usaa.deposit(man, 400)		#Michael Stope, you have deposited $400 into your account with USAA.  Your balance is now $400
fun.deposit(lady, 5)		#Jan Headley, you have deposited $5 into your account with Fun Credit Union.  Your balance is now $5
fun.deposit(man, 8)			#Michael Stope, you have deposited $8 into your account with Fun Credit Union.  Your balance is now $8

usaa.withdraw(lady, 100)	#Jan Headley, you have withdrawn $100 from your account with USAA.  Your balance is now $400
usaa.withdraw(man, 50)  	#Michael Stope, you have withdrawn $50 from your account with USAA.  Your balance is now $350
fun.withdraw(lady, 4)		#Jan Headley, you have withdrawn $4 from your account with Fun Credit Union.  Your balance is now $1
fun.withdraw(man, 6)		#Michael Stope, you have withdrawn $6 from your account with Fun Credit Union.  Your balance is now $2

usaa.transfer(lady, fun, 20) #Jan Headley, you've transferred $20 from your account with USAA to your account with Fun Credit Union.
							 #USAA balance: S380
							 #Fun Credit Union balance: $21
fun.transfer(man, usaa, 1)	 #Michael Stope, you've transferred $1 from your account with Fun Credit Union to your account with USAA.
							 #Fun Credit Union balance: S1
							 #USAA balance: $351
							 
# usaa.withdraw(lady, 8000)	 #$8000 is too large of an amount.  Jan Headley's account only has $351
# fun.deposit(man, 5000)		 #$5000 is too large of an amount.  Michael Stope only has $1042
# usaa.transfer(man,fun,10000) #$10000 is too large of an amount.  Michael Stope's account only has $351
# fun.transfer(lady,usaa,20000)#$20000 is too large of an amount.  Jan Headley's account only has $7

usaa.total_cash				#USAA has $731.
fun.total_cash				#Fun Credit Union has $28

usaa.open_card(lady)		#Congratulations Jan Headley! You've been approved for a credit card with a limit of $1462.5.
usaa.open_card(lady)		#Jan Headley already has a credit account with USAA

usaa.charge_credit(lady, 100)	#Jan Headley charged $100. Total amount charged with USAA is $100
usaa.charge_credit(lady, 10000)	#Card Declined - Jan Headley only has $1362.5 of credit available
usaa.total_cash					#USAA has $631.

usaa.charge_debit(lady, 20)		#Jan Headley has spent $20 in a debit transaction.  USAA balance is now $360
usaa.charge_debit(lady, 10000)	#Card Declined - Jan Headley only has $360 in account with USAA

usaa.pay_bill(lady, 1000)		#$1000 is too large of an amount.  Jan Headley's account only has $360
usaa.pay_bill(lady, 2)			#Jan Headley has paid $2 to USAA. A fee of $0.98 was added to balance for not paying in full
								#Credit Available: $1364.5
								#USAA Balance: $358
usaa.total_cash					#USAA has $613.
usaa.pay_bill(lady, 98)			#Jan Headley has paid credit card with USAA in full.
								#Credit Availble: $1462.5
								#USAA Balance: $260
usaa.total_cash					#USAA has $709.