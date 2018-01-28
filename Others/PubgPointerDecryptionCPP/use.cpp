// run once
std::vector<uint8_t> decryptTable8;
decryptTable8.resize(256);
process.ReadMemory(module.baseAddress + 0x3AFF120, decryptTable8.data(), decryptTable8.size() * sizeof(uint8_t));
 
std::vector<uint32_t> decryptTable32;
decryptTable32.resize(1024);
process.ReadMemory(module.baseAddress + 0x3DEB290, decryptTable32.data(), decryptTable32.size() * sizeof(uint32_t));
 
//how to decrypt pointers
TSLEncryptedPointer encryptedPointer;
process.ReadMemory(tmpGnames, &encryptedPointer);
 
auto decrypted = encryptedPointer.Decrypt(decryptTable32.data(), decryptTable8.data());