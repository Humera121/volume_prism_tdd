
source ./volume.sh

run_test() {
    description=$1
    expected=$2
    shift 2
    result=$(calculate_volume "$@")

    if [[ "$result" == "$expected" ]]; then
        echo "[PASS] $description"
    else
        echo "[FAIL] $description: Expected '$expected' but got '$result'"
    fi
}

echo "Running tests..."

run_test "Test 2 x 3 x 4" "24" 2 3 4
run_test "Test with decimals" "60.0" 2.5 4 6
run_test "Test missing argument" "Error: Missing argument(s)" 5 6
run_test "Test invalid input" "Error: All arguments must be positive numbers" 5 x 3
