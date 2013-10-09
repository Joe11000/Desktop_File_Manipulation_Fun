require 'FileUtils'

def delete_all_files(directory)
	#arr = Dir["*"].each{}
	#arr = arr.drop(2) #  . and .. will always be the first 2 in array


	# puts arr.delete_if{|i| /\A(\.){1,}\Z/.match(i)} # remove . and .. from the list of things to delete
	#folder_name = /\//.last_match(directory).to_s
	#puts "#{folder_name} : #{arr.size} files deleted"  
	#arr.each{|f| File.delete(directory + "/" + f)} 	# delete a single file
	
	FileUtils.rm_rf(directory) #removes everything from //NOONAN-NAS/service/trashbox/
end

trashbox = "//NOONAN-NAS/service/trashbox/"

delete_all_files(trashbox)


#Dir.rmdir()

#Dir.mkdir("All_Gone!")


=begin
def delete_all_files(directory)
	arr = Dir.entries(directory)
	arr = arr.drop(2) #  . and .. will always be the first 2 in array
	puts arr
	# puts arr.delete_if{|i| /\A(\.){1,}\Z/.match(i)} # remove . and .. from the list of things to delete
	arr.each{|file| FileUtils.rm(file)}
end

directory = "//NOONAN-NAS/service/trashbox/DLNA"
directory2 = "C:/Users/Noonan/Desktop/New folder/Herp"

delete_all_files(directory2)

#Dir.rmdir()

#Dir.mkdir("All_Gone!")
=end