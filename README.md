encryptor
=========

Inspired by tutorial on jumpstart lab.com

Use these methods to encrypt words or text from a file with a Caesar Cypher or Rot-N encryption.

Rotating the text by up to 90 places -- the (' '..'z') range-- is supported.

Pass a word and the number to rotate by to the encrypt method or a file name and number to rotate by the the encrypt_file method to encrypt.

Pass a code and the number to rotate by to the decrypt method or a file name and number to rotate by the decrypt_file method to decrypt.

If you want to decrypt and don't know the rotation number, pass the text to the crack_encryption method to print all 90 possible rotations.