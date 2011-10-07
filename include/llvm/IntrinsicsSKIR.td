
//===-------------------------- SKIR Intrinsics --------------------------===//
//

// kernel identifier
def skir_kernel_ty       : LLVMPointerType<llvm_i8_ty>;
def skir_kernel_array_ty : LLVMPointerType<skir_kernel_ty>;

// stream identifier
def skir_stream_ty         : LLVMPointerType<llvm_i8_ty>;
def skir_stream_array_ty   : LLVMPointerType<skir_stream_ty>;
def skir_stream_idx_ty     : LLVMType<i32>;

// void*
def skir_void_ptr      : LLVMPointerType<llvm_i8_ty>;

// stream offset
def skir_offset_ty     : LLVMType<i32>;

def skir_int_ty      : LLVMType<i32>;
def skir_int64_ty      : LLVMType<i64>;

// stream element
def skir_elmptr_ty        : LLVMPointerType<llvm_i8_ty>;

// create a kernel
//  kernel = skir.kernel(char *workfn, void *args)
def int_skir_kernel : Intrinsic<[skir_kernel_ty], [llvm_ptr_ty, llvm_ptr_ty]>;

// call a kernel
//  skir.call(void *kernel, void *inputs, void *outputs)
def int_skir_call   : Intrinsic<[llvm_void_ty], [skir_kernel_ty, skir_stream_array_ty, skir_stream_array_ty]>;

// wait
def int_skir_wait   : Intrinsic<[llvm_void_ty], [skir_kernel_ty]>;

// create a stream
//  stream = skir.stream(void)
def int_skir_stream : Intrinsic<[skir_stream_ty], [skir_int_ty]>;

// push
//  skir.push(stream, element)
def int_skir_push  : Intrinsic<[llvm_void_ty], [skir_stream_idx_ty, skir_elmptr_ty]>;

// pop
//  skir.pop(stream, element*)
def int_skir_pop  : Intrinsic<[llvm_void_ty], [skir_stream_idx_ty, skir_elmptr_ty]>;

// peek
//  skir.pop(stream, element*, offset)
def int_skir_peek  : Intrinsic<[llvm_void_ty], [skir_stream_idx_ty, skir_elmptr_ty, skir_int_ty]>;

// coroutine yield
// 
def int_skir_yield : Intrinsic<[llvm_void_ty], [skir_void_ptr, skir_void_ptr]>;

// coroutine return
//
def int_skir_return : Intrinsic<[llvm_void_ty], [skir_void_ptr, skir_int_ty]>;

// become instruction
//
def int_skir_become : Intrinsic<[llvm_void_ty], [skir_void_ptr, skir_kernel_ty]>;