# <h1 align="center">AES Encryption using Verilog on FPGA</h1>

https://github.com/user-attachments/assets/89a8f95d-6bfe-42bc-836b-53730abd24ab

## 📝 Project Description

This project implements the Advanced Encryption Standard (AES) encryption algorithm using Verilog. The design is targeted for the Altera DE1-SoC FPGA board. This project was undertaken as part of the Logic Design course during the first year of our Computer Engineering program.

The AES algorithm is widely used for securing data and is known for its efficiency and security. In this project, we have implemented the 128-bit, 192-bit, and 256-bit versions of AES. The design includes key expansion, the encryption process, and the decryption process.

## ✨ Features

-   **AES-128, AES-192, and AES-256 Encryption and Decryption**: Implements the core AES algorithm for 128-bit, 192-bit, and 256-bit keys.
-   **Key Expansion**: Dynamically generates the required round keys from the initial key.
-   **Hardware Implementation**: Optimized for running on the Altera DE1-SoC FPGA board.

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

3. **Compile the Project**

    - Compile the project in Quartus Prime.
    - Ensure there are no errors in the compilation.

4. **Program the FPGA**
    - Connect the DE1-SoC board to your computer.
    - Use the Quartus Prime Programmer to upload the compiled design to the FPGA.

### Running the Simulation

1. **Open ModelSim**

    - Load the project files into ModelSim.

2. **Run the Simulation**
    - Perform functional and timing simulations to verify the design.
    - Use the provided testbenches to simulate AES encryption and decryption.

## 📁 Project Structure

Root directory contains all Verilog modules, each module file includes a module for the testbench with the convention {moduleName}\_DUT.

## 🛠️ Usage

-   **Encrypting Data:** Input your plaintext and key to the FPGA design to receive the encrypted ciphertext.
-   **Decrypting Data:** Input the ciphertext and the key to the FPGA design to retrieve the original plaintext.

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
	  <sub> Ahmed Walid </sub>
	</a>
  </td>
  <td align = "center"> 
	<a href = "https://github.com/anas-ibrahem">
	  <img src = "https://github.com/anas-ibrahem.png" width = 100>
	  <br />
	  <sub> Anas Ibrahim </sub>
	</a>
  </td>
</tr>
</table>

## 📜 License

This project is licensed under the MIT License - see [License](LICENSE) for more information.
