function zap -d "zap: add path z0ne edition"
	set -l new_path

	for element in $argv
		set -l element /(string trim -l -c / $element)
		if not contains $element $PATH
	    		set -a new_path $HOME$element
		end
	end

	set -a new_path $PATH
	set PATH $new_path
end
