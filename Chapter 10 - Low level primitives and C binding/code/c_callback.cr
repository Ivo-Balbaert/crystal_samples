# ??? not tested
// C
typedef void (*sig_t) (int);
sig_t signal(int sig, sig_t func);

# Crystal
lib LibC
  alias SigT = Int32 ->
  fun signal(sig : Int32, func : SigT) : SigT
end

LibC.signal 2, ->(value) { puts "Interrupted" }