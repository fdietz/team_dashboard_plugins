module Sources
  module Boolean
    class Example < Sources::Boolean::Base
      def get(options = {})
        { :value => rand(2) == 1 }
      end
    end
  end
end