unsafe struct Decriptor
    {
        private UInt64[] encrypted_pointers;
        UInt16 encrypted_index1;
        fixed byte pad0[6];
        UInt16 encrypted_index2;
        fixed byte pad1[6];
        UInt16 encrypted_xor1;
        fixed byte pad2[6];
        UInt16 encrypted_xor2;
        fixed byte pad3[6];
 
 
 
        UInt16 DecryptWord(byte* table8, UInt16 word)
        {
            for (int i = 0; i < 5; i++)
            {
                word = (UInt16) (table8[table8[(word & 0xFF) ^ 0x55]] << 0x08 | table8[table8[(word >> 0x08) ^ 0x44]]);
            }
 
            return word;
        }
 
        UInt32 DecryptDword(UInt32* table32, UInt32 dword)
        {
            UInt32 xor = 0;
            xor ^= table32[((dword >> 0x00) & 0xFF) + 0x300];
            xor ^= table32[((dword >> 0x08) & 0xFF) + 0x200];
            xor ^= table32[((dword >> 0x10) & 0xFF) + 0x100];
            xor ^= table32[((dword >> 0x18) & 0xFF) + 0x000];
            return ~xor;
        }
 
        UInt64 DecryptIndex(UInt32* table32, byte* table8)
        {
            UInt32 temp = DecryptWord(table8, (UInt16) (~encrypted_index1 ^ encrypted_index2 ^ 0x0D25));
 
            temp ^= 0xD7AF5ABC;
            temp = DecryptDword(table32, temp);
 
            return temp % 0x2B;
        }
 
        UInt64 DecryptXor(UInt32* table32, byte* table8)
        {
            UInt32 temp = DecryptWord(table8, (UInt16) (~encrypted_xor1 ^ encrypted_xor2 ^ 0x0D25));
 
            temp ^= 0x5CE7E30C;
            temp = DecryptDword(table32, temp);
 
            return temp % 0x2B;
        }
 
        public UInt64 Decrypt(UInt32* table32, byte* table8)
        {
            encrypted_pointers = new UInt64[64];
            UInt64 index = DecryptIndex(table32, table8);
            UInt64 pointer = encrypted_pointers[index];
            UInt64 xor = DecryptXor(table32, table8);
 
            return pointer ^ xor;
        }
       
    }