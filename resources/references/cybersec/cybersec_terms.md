# CODE OBFUSCATION TECHNIQUES

* **Control Flow Flattening:** change the code flow execution.
  * Tools: OLLVM, VMProtect, Themida

* **Mixed Boolean Arithmetic (MBA):** Consist in rewrite simple arithmetic operations of logical and arithmetic operations.

* **String Encryption:** important strings are stored encrypted and the program decipher in memory when needed.

* **Dead Code Insertion:** add code that will never run.

* **Opaque predicates:** conditions that always are true or false, but always looks complex.

* **Packing:** the executable file is compressed or ciphered and unpack in memory.
  * Tools: UPX, Themida, VMProtect

* **Control Flow Graph Obfuscation:** the Control Flow Graph (CFG) is modified to have more nodes, more unnecessary changes or false loops.
  * Tools: IDA Pro, Ghidra

* **Polymorphic Malware:** this kind of malware changes his appearance every time is executed or spread.

* **Metamorphic Malware:** instead of cipher the code, rewrite completely his own code.

* **Anti-Debugging:** the malware try to detect if someone is doing code analysis using an debugger.
  * Tools: x64dbg, OllyDbg

* **Anti-VM Detection:** the malware check if is running inside vm or not.

* **Code Virtualization:** the program doesn't execute directly the original code, an virtual interpreter execute these personalize bytecode.

* **Self-Modifying Code:** the program modify his own code on memory while is running.

* **Dynamic Code Generation:** the program generate new code while is running.

* **Code Transposition:** this consist in reorder the code block.

* **Instruction Substitution:** this replace instructions to other equal.

* **Virtualization-Based Obfuscation:** this is much as advanced as 'code virtualization'. Because the program creates an new virtual machine completely personalize.
