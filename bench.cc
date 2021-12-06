#include <chrono>
#include <cstdint>
#include <iomanip>
#include <iostream>

constexpr auto iters = 100000000;

extern "C" void runbench();

alignas(16) volatile uint64_t buf = 0;

int main(int, char* argv[])
{
    using namespace std::chrono;
    auto start = high_resolution_clock::now();
    for (size_t i = 0; i != iters; ++i) {
        runbench();
    }
    auto end = high_resolution_clock::now();

    auto spent = duration_cast<milliseconds>(end - start).count();
    using namespace std;
    cout << "| "
         << fixed << setprecision(9) << (double)spent / iters << " ms/call | "
         << right << setw(9) << spent << " ms | "
         << left << setw(32) << argv[0] << " |"
         << endl;

    return 0;
}
