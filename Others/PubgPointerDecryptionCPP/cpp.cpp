#include <cstdint>
 
class TSLEncryptedPointer
{
private:
	uint64_t encrypted_pointers[44];
	uint16_t encrypted_index1;
	uint8_t pad0[6];
	uint16_t encrypted_index2;
	uint8_t pad1[6];
	uint16_t encrypted_xor1;
	uint8_t pad2[6];
	uint16_t encrypted_xor2;
	uint8_t pad3[6];
 
 
	uint16_t DecryptWord(uint8_t* table8, uint16_t word)
	{
		for (int i = 0; i < 5; i++)
		{
			word = table8[table8[(word & 0xFF) ^ 0x55]] << 0x08 | table8[table8[(word >> 0x08) ^ 0x44]];
		}
 
		return  word;
	}
 
	uint32_t DecryptDword(uint32_t* table32, uint32_t dword)
	{
		uint32_t xor = 0;
		xor ^= table32[((dword >> 0x00) & 0xFF) + 0x300];
		xor ^= table32[((dword >> 0x08) & 0xFF) + 0x200];
		xor ^= table32[((dword >> 0x10) & 0xFF) + 0x100];
		xor ^= table32[((dword >> 0x18) & 0xFF) + 0x000];
		return ~xor;
	}
 
	uint64_t DecryptIndex(uint32_t* table32, uint8_t* table8)
	{
		uint32_t temp = DecryptWord(table8, ~encrypted_index1 ^ encrypted_index2 ^ 0x0D25);
 
		temp ^= 0xD7AF5ABC;
		temp = DecryptDword(table32, temp);
 
		return temp % 0x2B;
	}
 
	uint64_t DecryptXor(uint32_t* table32, uint8_t* table8)
	{
		uint32_t temp = DecryptWord(table8, ~encrypted_xor1 ^ encrypted_xor2 ^ 0x0D25);
 
		temp ^= 0x5CE7E30C;
		temp = DecryptDword(table32, temp);
 
		return temp % 0x2B;
	}
 
public:
	uint64_t Decrypt(uint32_t* table32, uint8_t* table8)
	{
		uint64_t index = DecryptIndex(table32, table8);
		uint64_t pointer = encrypted_pointers[index];
		uint64_t xor = DecryptXor(table32, table8);
 
		return pointer ^ xor;
	}
};