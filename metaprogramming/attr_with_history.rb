=begin
Create custom attr_accessor to track the history of values

Define a method attr_accessor_with_history that provides the same functionality as attr accessor but also tracks every value the attribute has ever had.

This method was taken from the home work task of the class ‘Software as a service’ – https://www.coursera.org/saas/auth/welcome.
=end

class Class

  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_hist_name = attr_name+'_history'

    #getter
    self.class_eval("def #{attr_name};@#{attr_name};end")

    #setter
    self.class_eval %Q{
      def #{attr_name}=(val)
        # add to history
        @#{attr_hist_name} = [nil] if @#{attr_hist_name}.nil?
        @#{attr_hist_name} << val

        # set the value itself
        @#{attr_name}=val
      end

      def #{attr_hist_name};@#{attr_hist_name};end

                    }

  end

end



# Usage of this accessor:

class Foo
  attr_accessor_with_history :bar

  def initialize(some_bar_value)
    self.bar = some_bar_value
  end
end

f = Foo.new
f.bar = 3
f.bar = :wowzo
f.bar = 'boo!'
puts f.bar_history # => [nil, 3, :wowzo, 'boo!']
