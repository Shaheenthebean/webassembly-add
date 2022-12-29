(module
  (import "console" "log" (func $log (param i32)))
  (func $add (param $n1 i32) (param $n2 i32) (result i32) (local $top i32)
  local.get $n1
  local.get $n2
  i32.add ;; could overflow, assuming we get nice numbers
  local.tee $top
  local.get $top
  call $log
  )
  (export "add" (func $add))
)

