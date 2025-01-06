#include "llvm/Object/MachO.h"
#include "llvm/DebugInfo/DWARF/DWARFContext.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/Error.h"

using namespace llvm;
using namespace object;

int main(int argc, char *argv[]) {
    if (argc != 2) {
        errs() << "Usage: " << argv[0] << " <input-file>\n";
        return 1;
    }

    // Load the Mach-O file
    Expected<OwningBinary<Binary>> BinaryOrErr = createBinary(argv[1]);
    if (!BinaryOrErr) {
        errs() << "Error reading file: " << toString(BinaryOrErr.takeError()) << "\n";
        return 1;
    }

    Binary &Binary = *BinaryOrErr.get().getBinary();

    // Check if it's a Mach-O file
    if (auto *Obj = dyn_cast<MachOObjectFile>(&Binary)) {
        // Create a DWARFContext
        std::unique_ptr<DWARFContext> DICtx = DWARFContext::create(*Obj);

        // Now you can use DICtx to access DWARF information
        // For example, to iterate over compile units:
        for (const auto &CU : DICtx->compile_units()) {
            if (const auto DIE = CU->getUnitDIE(false)) {
                if (const char *Name = DIE.getShortName())
                    outs() << "Compile unit: " << Name << "\n";
            }
        }

        // You can also access Mach-O specific information
        // outs() << "Mach-O File Type: " << Obj->getFileType() << "\n";
        outs() << "Number of Load Commands: " << Obj->getHeader().ncmds << "\n";

    } else {
        errs() << "Not a Mach-O object file\n";
        return 1;
    }

    return 0;
}
