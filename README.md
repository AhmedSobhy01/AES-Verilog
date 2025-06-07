# <h1 align="center">AES Encryption using Verilog on FPGA</h1>

https://github.com/user-attachments/assets/89a8f95d-6bfe-42bc-836b-53730abd24ab

## 📝 Project Description

This project implements the Advanced Encryption Standard (AES) encryption algorithm using Verilog. The design is targeted for the Altera DE1-SoC FPGA board. This project was undertaken as part of the Logic Design course during the first year of our Computer Engineering program.

The AES algorithm is widely used for securing data and is known for its efficiency and security. In this project, we have implemented the 128-bit, 192-bit, and 256-bit versions of AES. The design includes key expansion, the encryption process, and the decryption process.

## 🧮 AES Algorithm Overview

AES is a symmetric block cipher that processes data blocks of 128 bits using cipher keys of 128, 192, or 256 bits. The algorithm consists of several steps that are repeated in multiple rounds:

-   **SubBytes**: A non-linear substitution step where each byte is replaced with another according to a lookup table (S-box).
-   **ShiftRows**: A transposition step where the last three rows of the state are shifted cyclically.
-   **MixColumns**: A mixing operation which operates on the columns of the state, combining the four bytes in each column.
-   **AddRoundKey**: Each byte of the state is combined with a byte of the round key using bitwise XOR.

The number of rounds depends on the key length:

-   AES-128: 10 rounds
-   AES-192: 12 rounds
-   AES-256: 14 rounds

## 🔍 Module Descriptions

Our implementation consists of the following key modules:

-   **SubTable/InvSubTable**: Implements the S-Box substitution for encryption and decryption.
-   **SubBytes/InvSubBytes**: Applies the S-Box substitution to the entire state.
-   **ShiftRows/InvShiftRows**: Performs the row shifting operations.
-   **MixColumns/InvMixColumns**: Implements the column mixing operations using finite field arithmetic.
-   **KeyExpansion**: Generates the round keys from the initial key.
-   **AddRoundKey**: XORs the state with the round key.
-   **AESEncrypt**: Orchestrates the encryption process through all rounds.
-   **AESDecrypt**: Orchestrates the decryption process through all rounds.
-   **AES**: Top-level module that connects all components and interfaces with the FPGA board.

Each module includes a testbench (DUT - Design Under Test) for verification.

## ✨ Features

-   **AES-128, AES-192, and AES-256 Encryption and Decryption**: Implements the core AES algorithm for 128-bit, 192-bit, and 256-bit keys.
-   **Key Expansion**: Dynamically generates the required round keys from the initial key.
-   **Hardware Implementation**: Optimized for running on the Altera DE1-SoC FPGA board.
-   **Interactive Interface**: Uses the FPGA board's switches, LEDs, and seven-segment displays to control the operation and display results.
-   **Parameterized Design**: Modules use parameters to support different key lengths without code duplication.
-   **Testbenches**: Comprehensive test cases for each module to verify functionality.

## 🚀 Getting Started

### Prerequisites

-   Altera DE1-SoC FPGA board
-   Quartus Prime software
-   ModelSim for simulation

### Installation

1. **Clone the repository**

    ```bash
    git clone https://github.com/AhmedSobhy01/AES-Verilog.git
    cd AES-Verilog
    ```

2. **Open Quartus Prime**

    - Open Quartus Prime and create a new project.
    - Add all the Verilog files from the repository to the project.
    - Set AES.v as the top-level entity.
    - Assign the pins according to the DE1-SoC board's user manual.

3. **Compile the Project**

    - Compile the project in Quartus Prime.
    - Ensure there are no errors in the compilation.

4. **Program the FPGA**
    - Connect the DE1-SoC board to your computer.
    - Use the Quartus Prime Programmer to upload the compiled design to the FPGA.

### Running the Simulation

1. **Open ModelSim**

    - Create a new ModelSim project and add all Verilog files.
    - Compile all the files.

2. **Run the Testbenches**
    - Each module has a corresponding testbench module with the suffix `_DUT`.
    - Run simulations for individual modules (e.g., `SubBytes_DUT`, `MixColumns_DUT`).
    - Run the full AES simulation using `AES_DUT`.
    - Analyze waveforms to verify correct behavior.
    - Compare results with known test vectors from the AES standard.

## 📁 Project Structure

The project is organized as follows:

-   **Core AES Modules**:

    -   `SubTable.v` / `InvSubTable.v`: S-Box lookup tables
    -   `SubBytes.v` / `InvSubBytes.v`: Byte substitution
    -   `ShiftRows.v` / `InvShiftRows.v`: Row shifting
    -   `MixColumns.v` / `InvMixColumns.v`: Column mixing
    -   `KeyExpansion.v`: Key schedule generation
    -   `AddRoundKey.v`: Key addition

-   **Main Modules**:

    -   `AESEncrypt.v`: Encryption process
    -   `AESDecrypt.v`: Decryption process
    -   `AES.v`: Top-level integration

-   **Utility Modules**:

    -   `DisplayDecoder.v`: Seven-segment display control
    -   `Binary2BCD.v`: Binary to BCD conversion for display

Each module file includes a testbench module with the convention `{moduleName}_DUT`.

## 🛠️ Usage

### FPGA Board Operation

1. **Select AES Mode**:

    - Use switches SW[1:0] to select between AES-128 (00), AES-192 (01), or AES-256 (10 or 11).

2. **Control Operation**:

    - SW[9]: Reset - Resets the AES operation when high.
    - KEY[0]: Clock Simulator - Each press simulates one clock cycle, activating one AES round.
        - AES-128: 11 clock cycles (1 initial + 9 main rounds + 1 final)
        - AES-192: 13 clock cycles (1 initial + 11 main rounds + 1 final)
        - AES-256: 15 clock cycles (1 initial + 13 main rounds + 1 final)
    - KEY[1]: Clock - Manually advance the clock (for debugging).

    Note: Alternatively, the AES clock can be connected directly to the board's clock instead of using KEY[0] for automated operation.

3. **Monitor Status**:

    - LEDR[0]: Illuminates when encryption is complete.
    - LEDR[1]: Illuminates when decryption is complete and matches the original data.
    - LEDR[5-7]: Indicates the selected AES mode (128-bit, 192-bit, or 256-bit).
    - LEDR[9]: Indicates reset state.

4. **View Results**:

    - HEX0-HEX2: Displays the BCD (decimal) representation of the lower 8 bits of the current state.
    - HEX3-HEX5: Displays the hexadecimal representation of the lower 12 bits of the current state.

    For example, a display showing "EFF255" means:

    - "EFF" is the hexadecimal value of the lower 12 bits (displayed on HEX5-HEX3)
    - "255" is the decimal representation of the lower 8 bits (0xFF in hex), displayed on HEX2-HEX0

## 🔄 Implementation Details

### Key Expansion Process

The key expansion routine creates round keys from the cipher key. For AES-128, the key schedule consists of 44 words (176 bytes). For AES-192 and AES-256, the key schedule consists of 52 and 60 words respectively.

### Encryption Process

1. Initial round key addition
2. 9/11/13 main rounds (for AES-128/192/256):
    - SubBytes - byte substitution using S-box
    - ShiftRows - cyclic shifting of rows
    - MixColumns - column mixing using finite field arithmetic
    - AddRoundKey - XOR with round key
3. Final round (without MixColumns)

### Decryption Process

1. Initial round key addition
2. 9/11/13 main rounds (for AES-128/192/256):
    - InvShiftRows - inverse cyclic shifting of rows
    - InvSubBytes - inverse byte substitution
    - AddRoundKey - XOR with round key
    - InvMixColumns - inverse column mixing
3. Final round (without InvMixColumns)

## 👥 Collaborators

<table>
<tr>
  <td align = "center"> 
	<a href = "https://github.com/AhmedAmrNabil">
	  <img src = "https://github.com/AhmedAmrNabil.png" width = 100>
	  <br />
	  <sub> Ahmed Amr </sub>
	</a>
  </td>
  <td align = "center"> 
	<a href = "https://github.com/AhmedSobhy01">
	  <img src = "https://github.com/AhmedSobhy01.png" width = 100>
	  <br />
	  <sub> Ahmed Sobhy </sub>
	</a>
  </td>
  <td align = "center"> 
	<a href = "https://github.com/AWS132">
	  <img src = "https://github.com/AWS132.png" width = 100>
	  <br />
	  <sub> Ahmed Waleed </sub>
	</a>
  </td>
  <td align = "center"> 
	<a href = "https://github.com/anas-ibrahem">
	  <img src = "https://github.com/anas-ibrahem.png" width = 100>
	  <br />
	  <sub> Anas Ibrahem </sub>
	</a>
  </td>
</tr>
</table>

## 📚 References

-   [FIPS 197: Advanced Encryption Standard (AES)](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.197.pdf)
-   [The Design of Rijndael: AES - The Advanced Encryption Standard](https://www.springer.com/gp/book/9783540425809)
-   [Intel FPGA Documentation](https://www.intel.com/content/www/us/en/programmable/documentation/lit-index.html)
-   [DE1-SoC User Manual](https://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&No=836)

## 📜 License

This project is licensed under the MIT License - see [License](LICENSE) for more information.
