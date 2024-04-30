import os

def extract_module(module_name, files):
    # Try to find the module in a file with the same name first
    specific_file = os.path.join(os.path.dirname(os.getcwd()), f"{module_name}.v")
    if os.path.exists(specific_file):
        with open(specific_file, 'r') as f:
            lines = f.readlines()
            for line in lines:
                if line.strip().startswith(f"module {module_name}(") or line.strip().startswith(f"module {module_name} (") or line.strip().startswith(f"module {module_name}#(") or line.strip().startswith(f"module {module_name} #("):
                    start = lines.index(line)
                    end = next((i for i, line in enumerate(lines[start:]) if line.strip().startswith("endmodule")), None)

                    if end:
                        return "".join(lines[start:end+start+1])

    # If not found in specific file, search all files
    for file in files:
        with open(os.path.join(os.path.dirname(os.getcwd()), file), 'r') as f:
            lines = f.readlines()
            for line in lines:
                if line.strip().startswith(f"module {module_name}(") or line.strip().startswith(f"module {module_name} (") or line.strip().startswith(f"module {module_name}#(") or line.strip().startswith(f"module {module_name} #("):
                    start = lines.index(line)
                    end = next((i for i, line in enumerate(lines[start:]) if line.strip().startswith("endmodule")), None)
                    if end:
                        return "".join(lines[start:end+start+1])
    return None

if __name__ == "__main__":
    # Define modules to extract
    module_names = ["SubTable", "InvSubTable", "SubBytes", "ShiftRows", "MixColumns", "KeyExpansionRound", "KeyExpansion", "InvSubBytes", "InvShiftRows", "InvMixColumns", "DisplayDecoder", "CondAdd3", "Binary2BCD", "AddRoundKey", "AESEncrypt", "AESDecrypt", "AES"]

    # Get all .v files in the current directory
    v_files = [f for f in os.listdir(os.path.dirname(os.getcwd())) if f.endswith(".v")]

    # Open output file for appending
    with open(os.path.join(os.getcwd(), "combined_modules.v"), "w") as output_file:
        for module_name in module_names:
            module_content = extract_module(module_name, v_files)
            if module_content:
                output_file.write(module_content.strip() + "\n\n")
            else:
                print(f"Module '{module_name}' not found in any .v file")