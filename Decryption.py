import numpy as np

#-----------------------V-------------------------------
# Input string of hexadecimal values separated by spaces
hex_string1 = """
0BC2 1306 0C8B 1015 1DE1 0BE3 1441 10F4 1270 15B3 0686 1D77 0234 18F4 0E9E 1168
0FE1 045E 0D81 162E 1946 1096 0083 15E0 0343 0B9E 15B4 03A9 1939 0BB4 17E6 0DDC
1CBD 040C 0F28 0E99 1023 10FA 138B 053E 15C5 14B2 1A0C 01EB 13AB 1C2D 01D4 0EE2
02FF 093B 0546 19FB 0B33 0A76 145F 0665 191C 069E 0597 148A 15B2 0A23 122E 0C79
1775 17F5 114A 0329 0420 0170 12DA 058A 1D00 01AD 1C71 0FAF 1AD5 0E80 102A 18A9
120A 036A 07CE 14D6 14D3 1038 0B7D 0559 14DD 1946 0A3B 0C62 0B4A 0FFB 13C5 1324
1040 1352 020B 1D2E 12ED 1093 0219 0849 16D0 0651 02C2 084B 1079 08F5 0568 199B
0FBC 11A8 0847 0AF9 11F4 1346 183D 09AE 10DA 1898 079D 02BF 1B8F 0A4A 10AD 0A27
01BA 05C0 034C 105C 017F 11EB 106A 08BD 1767 068C 0D13 1A67 12BE 1720 19E5 04D5
037C 1B6F 10AF 19E2 0D97 0102 17D0 095E 0EFA 1043 0E13 09D7 13AA 0052 0C8D 04B1
08AE 0303 0C9E 174B 1C7F 1192 161C 0FE3 0F1D 0796 1893 0782 00DE 0748 1B08 024D
1400 15BF 1AB8 1AEF 188E 19A0 06DC 08C1 0360 123D 1453 09AC 1925 1191 1C86 18D5
01DE 05B8 0917 1AE6 1492 029B 01AA 1007 0357 1287 0EA3 0657 0DED 0F1A 16FF 1867
1373 17E6 1043 1BFC 18D9 029D 0713 13E3 1495 1460 0AFF 0D42 18C1 04F6 00E0 1A35
12FB 00B1 018B 181E 0C3F 018D 124B 1CB8 0400 0CFD 1DCB 177A 1140 166B 0AAF 0079
116D 18F9 0CD0 13BC 1CE2 0928 15B4 0C59 19DF 0E83 07D8 1A14 02E7 0FB7 1BD9 0885
"""

#-----------------------U-------------------------------
# Input string of hexadecimal values separated by spaces
hex_string2 = """
1827 173D 0824 0002 01C3 0A8E 11E5 1973 0906 0DD9 0806 1B05 0E08 044B 1812 1D85
00C8 1CEC 1265 16FF 0A9E 10E9 1644 107C 1B4F 05AA 06FC 0524 0E80 03A0 036E 1C73
07D9 182B 1B4A 097B 1C2B 1A61 1687 0DF1 184B 0CA1 02F5 01F5 0C96 1789 10A2 0FBB
1DB3 0C1D 0E30 0368 17E6 1DB4 0C6A 1DFE 1B6D 118D 06A3 18F0 1996 0627 0DC3 1366
1089 0CD4 0F91 072A 098E 088B 1AB1 031A 141B 1946 0740 1DB1 0056 1A90 1B17 0AA9
014B 0134 1DB2 00B4 0A7E 1DB1 1C18 0302 0031 05E6 1592 1BFF 11A3 0D73 0BD5 0958
150E 1A39 0A40 1275 186D 0417 047B 112B 02DC 0553 06F0 019B 1925 070F 1650 1B71
0F30 0EA9 16AB 1119 1689 1B64 06F3 194B 1754 0E03 023E 17E4 12B2 0050 1092 0907
1524 1894 13F8 1A6B 0FCC 1D26 0451 1903 11B9 173B 0FA0 1BCA 1B23 0206 0106 05B9
019F 0ED5 0C21 12B6 1B78 0397 03C0 0F69 000C 15F2 1888 16BB 0731 101D 175F 0DAE
02EB 0045 170E 18B3 11FF 10E2 1BBC 14B8 1346 0A96 10B1 126A 0AB3 10B1 1D58 03AB
0B75 0114 1D5A 0E0E 001C 04BC 1254 0AA0 019D 0D5C 0709 09F1 0247 041B 0E1E 1ADA
0CE5 0D4F 0B51 0017 0513 0460 0AA9 18F1 043F 0BD8 1740 1016 0693 0DA1 18D8 1AC8
1610 0883 057F 1643 093B 029E 08CC 0F7C 0018 033D 1B0C 0599 121F 063C 042D 0513
1BF7 01C5 0FF2 10FC 05FD 11EF 11DB 0618 1553 1A0D 1964 1370 1354 1C1C 15D3 0115
1D9C 118C 055F 18CF 0548 150C 14DE 044C 1634 19F8 09D3 0D4A 011F 000A 0B86 043D
"""


hex_string3= """
1825 1CE0 1C43 063F 18D9 0F53 082D 0351 10C7 05CB 1639 1877 0D64 1406 19D7 08B8
1DC2 0281 1501 04AA 1B1C 0E2B 0A2E 09A0 0CBA 1977 0E80 0915 114E 0FA8 12C7 1CB0
0FE7 1698 03B9 05BB 05A9 113D 0FC7 1DA3 0C37 0C89 1086 0BF1 0292 1734 1B0F 1504
0853 04B5 0268 0588 1923 08E5 0C6F 0C62 1394 1899 03CE 0BA5 1654 1A1E 150E 18B4
1900 06D0 0948 1279 1472 17A1 0FC5 11AE 1598 16DD 0A0B 08D5 1083 040C 1A82 07DD
12EE 0824 07CC 12FF 012F 1391 0591 17C7 1743 167A 057D 06D9 1381 1019 1C62 0A25
17EE 1592 158D 12E8 178E 04EA 1D66 0F63 12CC 0924 19EE 19A9 1D28 1223 1A24 0C2A
1986 038F 1D24 0E08 15E0 09AF 15E2 0A94 1617 0524 1C23 1CB4 14B3 051F 1662 19DA
0C5A 12CD 05EF 0E25 062A 1100 0542 0E99 113E 14AE 066A 0E76 013E 08A6 185C 120B
1944 1C3A 151C 0DC1 1488 0D83 03B2 0D10 012A 1503 098A 00CA 1BC4 05E2 01B6 05AF
046A 0D65 0DD1 1AF8 0EA5 1507 0A78 1343 1930 10D4 0B8B 0AB4 0876 0418 06CD 1BA7
0AD3 1734 13E8 04EA 05DB 10EB 1D5A 1420 1B73 0D28 09FE 1AC6 0984 0717 195A 1C1D
130F 1C7F 0B82 0305 0012 009C 1DE1 1B26 07DE 0545 0827 0C56 02BB 01AA 12AC 0DF7
120D 0723 16D7 19E5 084A 0E53 1413 036B 1A0C 1376 094C 1859 0FB3 1109 15DD 0605
03DE 1924 08F9 1C00 1153 0703 1066 1184 0882 015C 18BB 011D 0DE9 17A0 1244 0C99
1714 10A7 0D6D 094C 0B78 0863 1B50 186B 1950 0780 1627 1792 112B 0E49 199B 0EB5

"""


#-----------------------S-------------------------------
# Input string of hexadecimal values separated by spaces
hex_string4 = """
2 -1 2 1 -1 -1 -1 -2 -1 2 2 -1 -2 -2 2 0
-2 1 0 -1 0 -1 0 -1 1 -1 -2 -1 -1 -2 0 2
-2 -1 2 -2 -1 1 0 0 2 0 1 -1 -2 1 -2 -1
2 -1 -2 0 -2 -2 2 -1 0 -2 2 1 -2 2 -2 -1
2 2 0 0 -2 2 0 2 -2 2 -1 0 1 0 2 -2
-2 2 -2 -1 2 -1 1 0 -2 0 1 -1 0 0 2 -1
-1 -2 -2 1 -1 0 1 -2 2 -1 1 -1 -1 -1 1 2
2 1 2 -1 2 0 2 -1 -1 -2 -2 1 2 -1 -2 2
-1 -1 2 -1 2 0 2 0 2 0 1 -1 0 2 0 -1
-1 -2 1 1 1 -1 -1 2 -2 2 -1 0 -1 2 1 -1
-1 -2 -2 -2 0 -2 -2 1 0 1 2 -1 -1 1 1 2
2 -1 -2 1 0 2 -1 1 -1 1 2 1 -2 0 2 2
2 2 1 1 2 -2 1 1 1 0 -1 1 1 -1 -1 2
0 -2 -1 1 -2 1 -1 -2 2 2 1 -2 -1 1 0 0
-2 -1 1 -1 -2 1 1 2 1 -1 0 1 0 1 0 -2
1 1 2 0 1 2 2 1 1 -2 -1 2 -1 1 1 -1
"""


hex_string5= """
2 -1 1 1 -2 -1 0 2 -2 -1 -2 2 -1 0 2 0
2 2 -2 0 -1 2 -1 -2 0 1 0 0 -1 0 0 0
1 0 0 1 0 -1 -1 2 -1 0 2 -2 -1 -1 -1 1
-1 2 2 2 -1 2 2 -1 0 -1 1 -1 1 2 -2 2
-1 0 1 2 0 0 1 0 -1 0 -2 0 0 1 2 2
2 -2 1 -2 1 2 1 1 -1 0 -1 -1 -1 -1 2 2
2 -1 2 0 -2 0 -1 1 1 2 -1 1 -2 0 -1 -1
-1 -2 1 1 -1 0 0 -1 0 0 -1 -1 0 -1 -1 -1
1 -1 1 -1 -1 -1 0 -1 -2 -2 0 2 2 1 -1 2
-2 -2 1 2 -1 0 0 -1 0 0 1 -1 0 0 0 -2
2 2 -1 -2 0 1 -2 1 0 0 -1 -2 0 -1 2 0
0 -2 -1 2 0 1 -1 0 2 2 -1 -2 1 2 1 1
1 -2 1 -1 2 0 -1 0 1 0 2 -1 0 0 1 2
0 1 2 -1 -1 -2 -1 0 -1 -2 2 -1 1 2 0 0
-2 2 -2 0 0 -1 1 0 0 0 -1 -1 -1 2 1 0
-2 2 -2 -2 1 1 2 -1 2 1 1 -1 2 1 -2 1
"""

# Clean the string to remove any extra whitespace or characters
hex_string1 = hex_string1.strip()

# Split the string into individual hex values
hex_values = hex_string1.split()

# Convert each hex value to a decimal value
V = np.array([int(value, 16) for value in hex_string1.split()])


#--------------------U0----------------------------
hex_string2 = hex_string2.strip()

# Split the string into individual hex values
hex_values_2 = hex_string2.split()

# Convert each hex value to a decimal value
U0 = np.array([int(value, 16) for value in hex_string2.split()])

#--------------------U1----------------------------
hex_string3 = hex_string3.strip()

# Split the string into individual hex values
hex_values_3 = hex_string3.split()

# Convert each hex value to a decimal value
U1 = np.array([int(value, 16) for value in hex_string3.split()])


#--------------------S0----------------------------
hex_string4 = hex_string4.strip()

# Split the string into individual hex values
hex_values_4 = hex_string4.split()

# Convert each hex value to a decimal value
S0 = np.array([int(value, 16) for value in hex_string4.split()])

#--------------------S1----------------------------
hex_strin5 = hex_string5.strip()

# Split the string into individual hex values
hex_values_5 = hex_string5.split()

# Convert each hex value to a decimal value
S1 = np.array([int(value, 16) for value in hex_string5.split()])

print(V)
print(U0)
print(U1)
print(S0)
print(S1)


# Function to print matrix blocks
def print_matrix(name, matrix, rows, cols):
    print(f"\n-----------------------{name}------------------------------")
    for i in range(rows):
        for k in range(cols):
            for j in range(0, len(matrix[i][k]), 16):
                row = ' '.join(str(num) for num in matrix[i][k][j:j+16])
                print(row)
            print(f"\n-----------------------{name}------------------------------")

# Define the parameters
n = 256
psi = 2689  # Example value; replace with your specific value if different
modulus = 7681  # Example modulus; replace with your specific value if different

def Pol(v, v2, n, psi, modulus):
# Function to compute power with modulus
    def mod_exp(base, exp, mod):
        result = 1
        while exp > 0:
            if exp % 2 == 1:
                result = (result * base) % mod
            base = (base * base) % mod
            exp //= 2
        return result

# Create the n x n matrix
    matrix = np.zeros((n, n), dtype=int)

    for i in range(n):
        for j in range(n):
            exponent = 2 * i * j + i
            matrix[i, j] = mod_exp(psi, exponent, modulus)

    z = np.dot(v, matrix) % modulus

    z2 = np.dot(v2, matrix) % modulus

    z3 = np.multiply(z, z2) % modulus

# Define h vector for determining intersection between z and h 
    h = np.array([1134, 3672, 7662, 694, 6665, 6042])

# Find common elements between v and z
    common_elements = np.intersect1d(h, z)

    def extended_gcd(a, b):
        if a == 0:
            return b, 0, 1
        gcd, x1, y1 = extended_gcd(b % a, a)
        x = y1 - (b // a) * x1
        y = x1
        return gcd, x, y


    def mod_inverse(inv_shi, modulus):
        gcd, x, y = extended_gcd(inv_shi, modulus)
        if gcd != 1:
            raise ValueError(f"No modular inverse exists for {inv_shi} and {modulus}")
        else:
            return x % modulus

    inv_n = mod_inverse(n, modulus)
    inv_shi = mod_inverse(psi, modulus)


# Function to compute power with modulus
    def mod_exp(base, exp, mod):
        result = 1
        while exp > 0:
            if exp % 2 == 1:
                result = (result * base) % mod
            base = (base * base) % mod
            exp //= 2
        return result

# Create the n x n matrix
    matrix = np.zeros((n, n), dtype=int)

    for i in range(n):
        for j in range(n):
            exponent = 2 * i * j + i
            matrix[i, j] = mod_exp(inv_shi, exponent, modulus)
        
    matrix_transpose = np.transpose(matrix)

    z5 = (np.dot(z3, matrix_transpose) * inv_n) % modulus
    return z5


# Decription for message
G1 = Pol(U0, S0, n, psi, modulus)
G2 = Pol(U1, S1, n, psi, modulus)

dec = (V - (G1 + G2)) % modulus


for i in range(n):
    if(dec[i] >= 1920 and dec[i] <= 5760):
        dec[i] = 3840
    else:
        dec[i] = 0

print("\n------------------decryption------------------------------")
for i in range(0, len(dec), 16):
    row = ' '.join(str(num) for num in dec[i:i+16])
    print(row)
    
print("\n------------------decryption------------------------------")


"""   
3840 3840 3840 0 0 3840 0 3840 3840 3840 3840 3840 3840 0 0 0
3840 0 0 0 0 3840 3840 3840 3840 3840 0 0 0 0 3840 0
0 0 0 3840 3840 3840 3840 0 3840 3840 0 0 3840 0 0 3840
0 0 0 3840 3840 0 0 3840 0 0 3840 3840 3840 0 3840 0
3840 3840 3840 0 0 3840 0 3840 3840 3840 0 0 0 3840 3840 3840
3840 3840 3840 3840 0 0 0 3840 3840 0 3840 3840 3840 3840 3840 0
3840 3840 3840 0 3840 3840 0 0 0 3840 0 3840 3840 3840 3840 3840
0 0 3840 3840 3840 0 0 0 3840 3840 0 0 3840 0 0 3840
0 3840 0 0 3840 0 3840 3840 3840 0 3840 0 3840 0 0 3840
3840 0 0 3840 3840 3840 0 0 0 3840 3840 3840 3840 0 0 0
3840 0 0 3840 3840 0 3840 0 3840 3840 3840 3840 3840 3840 3840 3840
0 0 0 3840 3840 0 3840 0 3840 0 3840 0 3840 0 0 0
0 0 0 3840 3840 3840 0 0 0 3840 0 0 0 3840 3840 0
3840 3840 3840 0 0 3840 0 0 0 0 0 0 3840 0 0 0
0 0 0 3840 0 0 3840 3840 0 3840 3840 0 0 3840 3840 3840
3840 0 3840 0 0 3840 0 0 0 3840 3840 3840 3840 0 0 0
"""



