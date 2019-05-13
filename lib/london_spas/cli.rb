class LondonSpas::CLI
    @@muted="\e[1;31m"
    @@grn="\e[1;32m"
    @@blu="\e[1;34m"
    @@mag="\e[1;35m"
    @@cyn="\e[1;36m"
    @@white="\e[0m"

    def call
        puts "Time to spa!\n"
        while @input != "relax"
            list_spas
            get_user_input
            validate(@input)
            options
        end
        goodbye
    end

    def list_spas
        puts "\n#{@@blu}Select a spa to see more or you can leave us and go #{@@cyn}relax#{@@white}!\n"
        LondonSpas::Spa.all.each{|s| puts "#{s.int_id}. #{s.name}"}
    end 

    def validate(input)
        spa = LondonSpas::Spa.find_by_id(input)
        spa ? show_spa(spa) : invalid_input
    end 

    def invalid_input
        puts "\n#{@@mag}Oops I don't understand that!#{@@white}"
        sleep(2)
        # menu
    end 

    def show_spa(spa)
        puts "\n#{@@grn}#{spa.name}#{@@white}"
        puts "#{@@mag}Permanently Closed :(#{@@white}" if spa.is_closed 
        spa.location["display_address"].each{|li| puts li}
    end 

    def options 
        puts "\n#{@@blu}Would you like to see the #{@@cyn}list#{@@blu} again or is time to go and #{@@cyn}relax?#{@@white}"
        get_user_input
    end

    def get_user_input 
        @input = gets.strip
    end

    def goodbye
        puts "\n#{@@grn}Enjoy!#{@@white}"
    end 

end