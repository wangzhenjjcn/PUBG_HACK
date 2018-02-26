#include <cstdint>
 
template<typename T> T rol(T val, size_t count)
{
	constexpr size_t bitcount = sizeof(T) * 8;
	count %= bitcount;
	return (val << count) | (val >> (bitcount - count));
}
 
template<typename T> T ror(T val, size_t count)
{
	constexpr size_t bitcount = sizeof(T) * 8;
	count %= bitcount;
	return (val >> count) | (val << (bitcount - count));
}
 
class TslDecryptFunction
{
private:
	uint8_t pad_0x00[3];
	uint8_t ror_value;
 
	uint8_t pad_0x04[2];
	uint64_t xor_value;
 
	uint8_t pad_0x0E[3];
	uint8_t sub_value[10];
 
	uint64_t GetSubValue()
	{
		if (sub_value[0] == 0x48)
		{
			if (sub_value[1] == 0xB8) //mov rax, i64
			{
				return *reinterpret_cast<uint64_t*>(sub_value + 2);
			}
 
			if (sub_value[1] == 0x2D) //sub rax, i32
			{
				return static_cast<uint64_t>(*reinterpret_cast<uint32_t*>(sub_value + 2));
			}
		}
 
		if (sub_value[0] == 0xB8) // mov eax, i32
		{
			return static_cast<uint64_t>(*reinterpret_cast<uint32_t*>(sub_value + 1));
		}
 
		return 0;
	}
 
 
public:
	uint64_t Decrypt(uint64_t encrypted)
	{
		encrypted = ror<uint64_t>(encrypted, ror_value);
		encrypted ^= xor_value;
		encrypted -= GetSubValue();
 
		return encrypted;
	}
};
#pragma pack(pop)
 
class TslEncryptedPointer
{
private:
	uint8_t encrypted_index[2];
	uint8_t pad_0x02[6];
	uint64_t encrypted_pointer;
 
public:
	uint64_t Decrypt(TslDecryptFunction* decryptFunctions)
	{
		auto index = rol<uint8_t>(encrypted_index[0] ^ encrypted_index[1], encrypted_index[0]) & 0x1F;
 
		return decryptFunctions[index].Decrypt(encrypted_pointer);
	}
};