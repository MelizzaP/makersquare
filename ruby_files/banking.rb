#Person class
class Person
    attr_reader :name 				#gets name input from user
    attr_accessor :funds 			#gets and sets amount of money person object has
     
     
    def initialize(name, funds)  	#sets up customer by getting name input
      @name = name  				#sets name input to @name instance variable 
      @funds = funds 				#sets fund amount to @funds instance variable
         
      puts "What's up #{@name}?  You have $#{@funds}"  #prints person object's name and the amount of money it has 
    end
      
end 								#end Person class


#Bank class
class Bank
  attr_reader :name  				#gets name of new Bank object 
  attr_writer :accounts 			#sets accounts inside of bank object 
  attr_accessor :balance 			#gets and sets the balance in a person objects bank account
  attr_writer :message				#gets and sets message bollean for printing
  attr_writer :credit_limit 		#sets credit limit
  attr_accessor :credit_balance		#sets and gets credit balance
  attr_accessor :credit_account		#gets/sets person and credit account hash
  

  def initialize(name)  			#initializes a new bank object 
    @name = name					#sets instance variable @name to the name of the bank object 
    @accounts = {} 					#creates an empty hash in which to store person objects in bank objects
    @credit_account = {}			#creates an empty hash for person and credit balance 
    @grand_total = 0				#sets grand total variable
    @money_in = [0]					#sets money in array
    puts "The bank, #{name}, has been created."  #prints what bank object has been created
    @message = false
  end								#end of initial method
  
  def new_account(person)					#new account method, creates a new account under person's name with a balance of 0
    @balance = 0  							#sets initial balance to 0 
    new_person = {person => @balance}		#creates a hash for a new person
    @accounts.merge!(new_person)			#puts new person array in account hash
    puts "#{person.name}, you have opened an account with #{@name}."  #prints person object's name and bank it opened an account with
  end										#end of new_account method 
  
  def withdraw(person, x)					#method for withdrawing money from an account  
   if x > @balance							#conditional that prints a message and bypasses fund movement if x>balance
   	puts "$#{x} is too large of an amount.  #{person.name}'s account only has $#{@balance}"
   else
    person.funds = person.funds + x 		#adds money to person object's funds
     withdraw_hash = {}						#temp hash to store updated values in for the @accounts hash
  	@accounts.each do |item, value| 		#loops through hash and finds person object 
  	  if item == person						#finds person in hash
  	    @balance = value - x				#subtracts ammount input by user from account balance
  	    
 	    withdraw_hash = {person => @balance}#stores updated balance in withdraw_hash
   	    @accounts.delete(person)			#deletes person and balance from @accounts hash
  	  end  									#end of conditional
  	 end  									 #end of loop
  	 
  	 @accounts.merge!(withdraw_hash)		#adds withdraw hash to @accounts array
  	end 									#end of conditional insufficient funds loop
  	 
  	 
  	 if @message == false
  	   puts "#{person.name}, you have withdrawn $#{x} from your account with #{name}.  Your balance is now $#{@balance}" 
  	 end 
  	 @message = false
  end 										#end of withdaw method
 
   def deposit(person, x)						#method for depositing money into an account
    if x > person.funds						#conditional that prints a message and bypasses fund movement if x>funds
     puts "$#{x} is too large of an amount.  #{person.name} only has $#{person.funds}"
     @message = true
    else
     person.funds = person.funds - x 			#subtracts money from person object's funds  
     deposit_hash = {}							#temp hash to store updated values in for the @accounts hash
     @accounts.each do |item, value|			#loops through hash and finds person object
       if item == person						#finds person in hash
         @balance = value + x 					#adds ammount input by user to account balance
         deposit_hash = {person => @balance}	#stores updated balance in deposit hash
         @accounts.delete(person)				#deletes person, balance from @accounts hash
       end										#end of conditional
     end										#end of loop
     
     @accounts.merge!(deposit_hash)			#adds deposit_hash to accounts hash
    end										#end of conditional insufficient funds loop
    
     if @message == false
       puts "#{person.name}, you have deposited $#{x} into your account with #{name}.  Your balance is now $#{@balance}"
     end
     
   end										#end of deposit method
   
   def transfer(person, bank, x)			#method allows money to be transferred from one bank account to another
    if x > @balance							#conditional that prints a message and bypasses fund movement if x>balance
     puts "$#{x} is too large of an amount.  #{person.name}'s account only has $#{@balance}"
    else
     @message = true						#set instance variable to 0 to use in conditional to avoid withdrawal notice from bank
     withdraw(person, x)					#calls withdraw method on persons bank account
     bank.message = true					#set instance variable to 0 to use in conditional to avoid deposit notice from bank
     bank.deposit(person, x)				#calls deposit method on the destination input by user
      
    puts "#{person.name}, you've transferred $#{x} from your account with #{name} to your account with #{bank.name}."
    puts "#{name} balance: $#{@accounts[person]}"
    puts "#{bank.name} balance: $#{bank.balance}"
    
   end 										##end of conditional insufficient funds loop
   
   end										#end of transfer method
   
  def total_cash							#totals the cash in all accounts in the bank
    @grand_total = 0
  	@accounts.each do |item,value| 			#loops through @accounts hash
  	  @grand_total = @grand_total+value		#adds each account balance to grand_total variable
  	end										#end of loop
  	
  	@credit_account.each do |item,value| 	#loops through credit accounts hash
  	  @grand_total = @grand_total-value		#adds each account balance to grand_total variable
  	end										#end of credit accounts loop
  	profit = 0								#sets up variable
  	@money_in.each{|n| profit+=n}			#sums all of the numbers in money in array	
  	@grand_total = @grand_total + profit	#sums all money in accounts, subtracts credit out, adds money paid from credit cards
  	
  	puts "#{name} has $#{@grand_total}." 	
  
  end										#end of total_cash method							

  def open_card(person)  #initializes a CC and sets balance to 0
   if @credit_account != {}  #conditional that prevents person from opening multiple cards
     puts "#{person.name} already has a credit account with #{name}"
   else
     @credit_limit = (person.funds + @balance) * 0.75  #sets credit limit to 75% of person's funds and balance associated with bank
     puts "Congratulations #{person.name}! You've been approved for a credit card with a limit of $#{@credit_limit}."
     @credit_balance = 0 #sets credit balance to zero
     @credit_account = {person => @credit_balance} #credit hash with a person object's balance linked to it
   end #end of conditional loop
  end #end of open card method  

def charge_credit(person, x)
 if x + @credit_balance > @credit_limit  #conditional to prevent going over credit limit
   puts "Card Declined - #{person.name} only has $#{@credit_limit - @credit_balance} of credit available"
  else
   charge_hash = {}  #temp hash to store updated values in for the @credit_account hash
   @credit_account.each do |item, value|	#loops through hash and finds person object
     if item == person	#finds person in hash
       @credit_balance = value + x #adds ammount input by user to account balance
       charge_hash = {person => @credit_balance}	#stores updated balance in charge hash
       @credit_account.delete(person)	#deletes person, balance from @accounts hash
     end	#end of conditional
    end	#end of loop
	
	 @credit_account.merge!(charge_hash)			#adds charge_hash to accounts hash
     puts "#{person.name} charged $#{x}. Total amount charged with #{name} is $#{@credit_balance}"
  end #end of credit limit conditional
  
end #end of charge_credit method

  def charge_debit(person, x)					#takes money directly from bank account
   if x > @balance								#conditional to prevent negative bank balance
     puts "Card Declined - #{person.name} only has $#{@balance} in account with #{name}"
   else
     @message = true							#prevents withdrawal method from printing
     withdraw(person,x)							#calls withdraw method for person and amnt input
     puts "#{person.name} has spent $#{x} in a debit transaction.  #{name} balance is now $#{@balance}"
   end						#end of insufficient funds conditional 
  
  end  					#end of debit method 
  
  def pay_bill(person, x)						#method for person object to pay off credit balance
    if x > @balance							#conditional for amount of money paid
      puts "$#{x} is too large of an amount.  #{person.name}'s account only has $#{@balance}"
    elsif x == @credit_balance						#if credit balance paid full then no fees charged
      @message = true						#prevents withdraw method from printing message
      withdraw(person,x)					#calls withdraw method for person and amount input
      @credit_account.delete(person)		#deletes person from credit Account hash
      @credit_balance = 0
      temp_hash = {person => @credit_balance}#temp hash for setting persons
      @credit_account.merge!(temp_hash)		 # puts temp hash in credit account hash
      @money_in << x 						#adds money into bank
      
      puts "#{person.name} has paid credit card with #{name} in full."
      puts "Credit Availble: $#{@credit_limit}"
      puts "#{name} Balance: $#{@balance}"
    else 
      fee = (@credit_balance - x) * 0.01   #subtracts 1% fee if person doesn't pay in full 
      @message = true						#prevents withdraw method from printing message
      withdraw(person,x)					#calls withdraw method for person and amount input
      pay_hash = {}  						#temp hash to store updated values in for the @credit_account hash
      @credit_account.each do |item, value|	#loops through hash and finds person object
        if item == person					#finds person in hash
           @credit_balance = value - x 		#subtracts ammount input by user to account balance
           pay_hash = {person => @credit_balance}	#stores updated balance in charge hash
           @credit_account.delete(person)	#deletes person, balance from @accounts hash
         end	#end of conditional
      end	#end of loop
	   @credit_account.merge!(pay_hash)			#adds pay_hash to accounts hash
	   @money_in << x 							#adds money in for bank total 
	   
	  puts "#{person.name} has paid $#{x} to #{name}. A fee of $#{fee} was added to balance for not paying in full"
	  puts "Credit Available: $#{@credit_limit - @credit_balance}"
	  puts "#{name} Balance: $#{@balance}"
	 end 	#end of money paid conditional
  end  #end of pay_bill method
   
end  										#end of Bank Class

