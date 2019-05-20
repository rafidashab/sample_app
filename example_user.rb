class User

  #w this creates attribute accessors (getters and setters) make assignments possible very important.
  attr_accessor( :name, :email, :pass)

  #this takes the hash map of attributes and put them in variable to be passed to the view, this is a constructor
  def initialize(attributes = {})
    @name = attributes[:name]
    @email = attributes[:email]
    @pass = attributes[:pass]

  end

  def formatted_email
    "#{@name} <#{@email}> #{@pass}"
  end


end