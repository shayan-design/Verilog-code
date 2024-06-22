import numpy as np

n = 256

# message
m = np.random.randint(0, 2, (1, 1, n))

scaling_factor = 3840

m = m * scaling_factor

# Define the matrices
A = np.random.randint(0, 7680, (2, 2, n))  # Example A matrix

# Secret key generation
S = np.random.randint(-2, 3, (2, 1, n))

# Error in key generation, e
e = np.random.randint(-2, 3, (2, 1, n))

# Error vector r
r = np.random.randint(-2, 3, (1, 2, n))

# Error 1, e1
e1 = np.random.randint(-1, 2, (1, 2, n))

# Error 2, e2
e2 = np.random.randint(-1, 2, (1, 1, n))

# Generate a random vector of 256 elements with integers in the range [0, 7681]
# Set the range for the random elements
low = 256
high = 7681

# Define the length of the vector
length = 256

#Fixed vector
"""
v = np.arange(10, 266)
v2 = np.arange(297, 553)

v4 = np.arange(1, 257)
v5 = np.arange(257, 513)
"""

# Function to print matrix blocks
def print_matrix(name, matrix, rows, cols):
    print(f"\n-----------------------{name}------------------------------")
    for i in range(rows):
        for k in range(cols):
            for j in range(0, len(matrix[i][k]), 16):
                row = ' '.join(str(num) for num in matrix[i][k][j:j+16])
                print(row)
            print(f"\n-----------------------{name}------------------------------")

print_matrix("m", m, 1, 1)        
print_matrix("A", A, 2, 2)
print_matrix("S", S, 2, 1)

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

#////////////////////////////////////////////////////////////////////////////

# Key generation
Key = np.random.randint(-1, 0, (2, 1, n))
  
for i in range(2):
    for j in range(2):
        vector1 = A[i][j]
        vector2 = S[j][0]
        
        if(j == 0):
            z8 = Pol(vector1, vector2, n, psi, modulus)
        else:
            z9 = Pol(vector1, vector2, n, psi, modulus)
    error = e[i][0]
    Key[i][0] = (z8 + z9 + error) % modulus


# Ciphertext for U
U = np.random.randint(-1, 0, (1, 2, n))

for i in range(2):
    for j in range(2):
        vector1 = r[0][j]
        vector2 = A[j][i]
        
        if(j == 0):
            z8 = Pol(vector1, vector2, n, psi, modulus)
        else:
            z9 = Pol(vector1, vector2, n, psi, modulus)
    error = e1[0][i]
    U[0][i] = (z8 + z9 + error) % modulus
    

# Ciphertext for V
V = np.random.randint(-1, 0, (1, 1, n))

for j in range(2):
    vector1 = r[0][j]
    vector2 = Key[j][0]
        
    if(j == 0):
        z8 = Pol(vector1, vector2, n, psi, modulus)
    else:
        z9 = Pol(vector1, vector2, n, psi, modulus)
    error = e2[0][0]
    V[0][0] = (z8 + z9 + error + m[0][0]) % modulus
    

"""
# Decription for message
dec = np.random.randint(-1, 0, (1, 1, n))

for j in range(2):
    vector1 = U[0][j]
    vector2 = S[j][0]
        
    if(j == 0):
        z8 = Pol(vector1, vector2, n, psi, modulus)
    else:
        z9 = Pol(vector1, vector2, n, psi, modulus)

    dec[0][0] = (V[0][0] - (z8 + z9) ) % modulus
""" 


print("\n------------------KEY Generation---------------")
for j in range(2):
    for i in range(0, len(Key[j][0]), 16):
        row = ' '.join(f'{num:04X}' for num in Key[j][0][i:i+16])
        print(row)
    
    print("\n------------------KEY Generation---------------")


print("\n------------------U---------------")
for j in range(2):
    for i in range(0, len(U[0][j]), 16):
        row = ' '.join(f'{num:04X}' for num in U[0][j][i:i+16])
        print(row)
    
    print("\n------------------U---------------")

   
print("\n------------------V---------------")
for i in range(0, len(V[0][0]), 16):
    row = ' '.join(f'{num:04X}' for num in V[0][0][i:i+16])
    print(row)
    
print("\n------------------V---------------")

"""
print("\n------------------decryption------------------------------")
for i in range(0, len(dec[0][0]), 16):
    row = ' '.join(f'{num:04X}' for num in dec[0][0][i:i+16])
    print(row)
    
print("\n------------------decryption------------------------------")
"""

"""   
1721 12C7 0EA8 10F7 10B6 146C 1AB0 1431 00D6 1813 1B28 171B 142D 0380 0D6B 04A4
03DB 0FA1 1811 0618 0118 05F2 1870 1299 1850 08C6 1CF6 1B06 0045 1657 1CAA 1910
1476 115C 0A02 0AB7 0A18 13D3 11E1 1CFC 14AF 0203 1C63 076A 1CC2 1D38 1983 01D0
1C59 16A9 00B7 0B45 05B6 032C 0D04 1483 06C4 0B1E 1C8D 1359 1440 06DB 0A76 0102
1418 1B20 14C9 0D54 1015 1416 0336 1C26 182B 1297 0AEC 111C 0092 081A 16A6 1CD1
049B 063D 03A2 0F17 0CEE 0252 16CB 0E06 1804 0FB5 0E91 05AE 063D 1392 0C4D 1657
096C 0FAA 0E59 1892 19A9 07D5 0046 01D7 1535 0536 06DD 0C3F 0465 131B 1DF8 01F9
12D2 16E5 1B50 0483 1979 0D7C 1329 0B68 1A56 05DC 0207 10AB 0932 095C 1600 0DA8
04A8 1727 1104 03D9 0900 1CD9 0EF1 0A20 01E0 0E3A 0165 0A01 18ED 04FB 0944 0506
1D72 038F 142B 16D4 01BA 1402 1D78 142D 04FA 064A 1DAD 0C6C 0818 1349 06EB 1962
14D6 0BB5 1077 141F 0A59 0E6E 07E1 1D3C 041B 0B7E 099D 1C0A 0DBC 16F5 0820 0F12
137B 13A1 103F 071D 003E 1880 0D91 004A 0A4C 1C87 0A16 15AF 1782 029A 18A0 114E
173B 1681 0A9D 1B9E 0B33 186D 0D3D 0495 12E7 155F 194D 0BE6 0D61 0CC0 0BFD 0FFD
0883 1304 0ABE 0AB7 1496 0F07 19DF 0C2E 02DF 1A48 1D8E 0F6E 0996 0E8F 17FA 03C1
0E6D 028F 11F1 1121 0111 1820 1998 0488 12AE 1047 1805 1181 1A27 168F 1255 1280
07E6 0835 0311 1D4C 10D3 0BCF 18C5 0083 08FE 0584 0C04 0C9F 0998 171C 10F1 1206
"""


