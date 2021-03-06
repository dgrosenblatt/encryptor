class Encryptor
	def cipher(rotation)
		keys = (' '..'z').to_a
		values = keys.rotate(rotation)
		Hash[keys.zip(values)]
	end

	def encrypt(word, rotation)
		letters_array = word.split('')
		encrypted_letters_array = letters_array.collect do |l|
			cipher(rotation)[l]
		end
		encrypted_word = encrypted_letters_array.join
	end

	def decrypt(word, rotation)
		letters_array = word.split('')
		decrypted_letters_array = letters_array.collect do |l|
			cipher(rotation).key(l)
		end
		decrypted_word = decrypted_letters_array.join
	end

	def encrypt_file(file_name, rotation)
		message = File.open(file_name, "r")
		text = message.read
		encrypted_text = encrypt(text, rotation)
		new_name = "encrypted_#{file_name}"
		encrypted_file = File.open(new_name, "w")
		encrypted_file.write(encrypted_text)
		encrypted_file.close
		puts "Wrote \'#{encrypted_text}\' to new file #{new_name}"
	end

	def decrypt_file(file_name, rotation)
		message = File.open(file_name, "r")
		text = message.read
		decrypted_text = decrypt(text, rotation)
		new_name = "decrypted_#{file_name}"
		decrypted_file = File.open(new_name, "w")
		decrypted_file.write(decrypted_text)
		decrypted_file.close
		puts "Wrote \'#{decrypted_text}\' to new file #{new_name}"
	end

	def crack_encryption(word)
		puts "Printing all rotations for #{word}"
		(' '..'z').to_a.size.times do |guess|
			potential = decrypt(word, guess)
			puts "Rotated by #{guess}:  #{potential}"
		end
	end
end