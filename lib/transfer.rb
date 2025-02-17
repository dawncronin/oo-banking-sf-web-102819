class Transfer
  # your code here
  attr_reader 
  attr_accessor :status, :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.valid? && self.status == "pending" && self.sender.balance > amount
      self.sender.deposit(-amount)
      self.receiver.deposit(amount)
      self.status= "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(amount)
      self.receiver.deposit(-amount)
      self.status= "reversed"
    end

  end

end
