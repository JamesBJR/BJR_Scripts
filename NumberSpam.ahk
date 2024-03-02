#MaxThreadsPerHotkey 3
Random, rand, 150, 300

Spam(Key) {
    While (GetKeyState(Key, "P")) {
        Send, %Key%
		Random, rand, 150, 300 ; Generate a new random number for each key press
		Sleep rand
    }
}

$1::Spam("1")
$2::Spam("2")
$3::Spam("3")
$4::Spam("4")
$5::Spam("5")
$6::Spam("6")
$7::Spam("7")
$8::Spam("8")
$9::Spam("9")
$0::Spam("0")
