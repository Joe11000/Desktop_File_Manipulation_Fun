class FileMover
	@@num_files_moved		= 0
	@@category_names_used	= {}	
	def initialize()
		pic_number = 0
		
	end

	def self.num_files_moved?
		@@num_files_moved
	end

	def move_files_function(files, move_to, new_category_name, files_type)
		return 0 if files.length < 1 # Exit if there are no files to move

		Dir.chdir(move_to)

		if @@category_names_used.has_key?(new_category_name) == false 	# if cateory name hasn't been used yet by this class
			@@category_names_used[new_category_name] = 0					# then try creating a new file index at 0
			pic_number = 0	
		else
			pic_number = @@category_names_used[new_category_name]			# else find how many files you have created with that name
		end

		# This will be our counter. We'll start at 1 today, though normally I like to count from 0
		files.each do |name|
			puts "moving #{name}" #print '.' # This is our "progress bar".
			new_name_found = false

			while (new_name_found == false)# continue until the name of the file doesn't exist yet in this location # break if no file has this name yet  # get a name that isn't in move_files_to directory
				pic_number += 1 #we increment the counter to name the next file
				new_name = ""
				
				leading_zero = pic_number.to_s.length == 1 ? "0" : "" # if num is 1 digit long then use leading zero

				Dir.entries(move_to).each do |path|
					if /#{new_category_name}0?#{pic_number}(.jpg|.jpeg|.png)/.match(path) 
						puts "name #{new_category_name}#{leading_zero}#{pic_number} is taken"
						pic_number += 1
					else
						new_name = "#{new_category_name}#{leading_zero}#{pic_number}#{files_type}"
						new_name_found = true
					end
				end
				
			end		
			puts "new name to be \"#{new_name}\""
			File.rename(name, move_to +"/" + new_name) # name the file and moved
			@@num_files_moved += 1
		end
		@@category_names_used[new_category_name] = pic_number	# Save the number of files created using this category name
	end
end

move_files_to = "D:/Pictures"
move_files_from_desktop = "C:/Users/Noonan/Desktop/*"
move_files_from_downloads = "D:/NewDownloads/*"

#Dir.chdir("C:/Users/Noonan/Desktop/Move_To_Me") # Move to different directory location
#Dir.chdir(move_files_to)

#Find all of the pictures to be moved
puts "What would you like to call this batch?"
new_category_name = gets.chomp

move_class = FileMover.new

pic_names  = Dir[move_files_from_desktop + ".jpg"] 		# take all .jpg  files recursively from Temp_pics and put them into Pictures
pic_names += Dir[move_files_from_downloads + ".jpg"] 	# take all .jpg  files recursively from Temp_pics and put them into Pictures

move_class.move_files_function(pic_names, move_files_to, new_category_name, ".jpg")

pic_names = Dir[move_files_from_desktop + ".jpeg"] 	# take all .jpeg files recursively from Temp_pics and put them into Pictures
pic_names += Dir[move_files_from_downloads + ".jpeg"] 	# take all .jpeg files recursively from Temp_pics and put them into Pictures
move_class.move_files_function(pic_names, move_files_to, new_category_name, ".jpeg")

pic_names = Dir[move_files_from_desktop + ".png"] 		# take all .png  files recursively from Temp_pics and put them into Pictures
pic_names += Dir[move_files_from_downloads + ".png"] 	# take all .png  files recursively from Temp_pics and put them into Pictures
move_class.move_files_function(pic_names, move_files_to, new_category_name, ".png")

puts "#{FileMover.num_files_moved?} files moved"
puts 'Mission Completed, Sir!'