# Strongly typed attr_accessor

class Myclass

end
  def self.typesafe_accessor(name, type)

    define_method(name) do
      instance_variable_get("@#{name}")
    end

    define_method("#{name}=") do |value|
      if value.is_a? type
        instance_variable_set("@#{name}", value)
      else
        raise ArgumentError.new("Invalid Type")
      end
    end
  end

  typesafe_accessor :foo, Integer

end



# usage

f = Foo.new
f.foo = 1
f.foo = "bar" # an exception thrown here!


# You can modify this code to create an accessor so it can be used in all classes. To do this – move this code to class Class and modify it a little like in the first example.


