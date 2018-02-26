// run once
uint64_t temp;
int32_t offset32;
 
temp = module.FindPattern("\xE8\x00\x00\x00\x00\x4C\x8B\xC0\x8B\x03", x????xxxxx");
 
process.ReadMemory(temp + 0x1, &offset32);
auto getGNamesFunction = (temp + offset32 + 0x5);
 
process.ReadMemory(getGNamesFunction + 0x83, &offset32);
auto encryptedGNamesPtr = (getGNamesFunction + offset32 + 0x87);
 
process.ReadMemory(temp + 0x77, &offset32);
auto decryptFunctionsPtr = (temp + offset32 + 0x7B);
 
 
uint64_t decryptFunctionPointers[32];
process.ReadMemory(decryptFunctionsPtr, &decryptFunctionPointers, sizeof(decryptFunctionPointers));
 
TslDecryptFunction decryptFunctions[32];
 
for (size_t i = 0; i < 32; i++)
{
	process.ReadMemory(decryptFunctionPointers[i], &decryptFunctions[i]);
}
 
 
//how to decrypt pointers
TslEncryptedPointer encryptedGNames;
process.ReadMemory(encryptedGNamesPtr, &encryptedGNames);
process.ReadMemory(encryptedGNames.Decrypt(decryptFunctions), &encryptedGNames); //yes the gnames pointer is double encrypted
 
auto GNames = encryptedGNames.Decrypt(decryptFunctions);
 
 
//how to decrypt the name array
struct {
	TslEncryptedPointer encryptedChunks;
	TslEncryptedPointer encryptedCount;
} nameArray;
 
process.ReadMemory(GNames, &nameArray);
 
uint64_t chunks[128];
process.ReadMemory(nameArray.encryptedChunks.Decrypt(decryptFunctions), &chunks, sizeof(chunks));
 
int32_t NumElements = (int32_t)nameArray.encryptedCount.Decrypt(decryptFunctions);
int32_t NumChunks = (NumElements / 0x4000) + ((NumElements & 0x3FFF) ? 1 : 0);
