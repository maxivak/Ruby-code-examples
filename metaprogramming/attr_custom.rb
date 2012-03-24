# Custom attr_accessor method accessible from all classes


class Class
  def my_custom_attr_method(attr_name)
  # your code here
  end
end

# you can use this method in any of your classes
class Myclass
  my_custom_attr_method :attr1
end


#attr_accessor

=begin
Ruby’s method attr_accessor uses metaprogramming to create getters and setters for object attributes on the fly.

It creates the code like this:
=end

class Class

  def my_attr_accessor(*args)

      # iterate through each passed in argument...
      args.each do |arg|

          # getter
          self.class_eval("def #{arg};@#{arg};end")

          # setter
          self.class_eval("def #{arg}=(val);@#{arg}=val;end")

      end
  end
end