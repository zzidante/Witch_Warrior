module GetsChomp
  module InputOverrideCommands
    class TransformInput
      def self.get_input
        user_input = gets.chomp!.downcase

        case user_input
        when 'help'
          puts 'help commands'
          user_input
        when 'exit'
          exit
        else
          user_input
        end
      end
    end
  end
end #include help desk in here and errors