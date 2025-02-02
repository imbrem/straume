namespace Straume.MonadEmit

class MonadEmit (m : Type u → Type v) (source : Type u) (value : Type u) where
  askFrom : source → Nat → m (value × source)

export MonadEmit (askFrom)

instance : MonadEmit IO IO.FS.Handle ByteArray where
  askFrom src n := do
    let ba ← IO.FS.Handle.read src $ USize.ofNat n
    return (ba, src)

instance : MonadEmit IO IO.FS.Handle String where
  askFrom src n := do
    let (ba, handle) ← MonadEmit.askFrom src n
    return (String.fromUTF8! ba, handle)

def readStringN : IO.FS.Handle → Nat → IO (String × IO.FS.Handle)
  := MonadEmit.askFrom
