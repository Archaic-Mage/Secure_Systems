#include <bits/stdc++.h>

using namespace std;

int main() {
    int  local_10 = 1;
    int param_1, param_2;
    cin >> param_1 >> param_2;
    for (int local_14 = 0; local_14 <= param_2 + -1; local_14 = local_14 + 1) {
      local_10 = (param_1 - local_14) * local_10;
    }

    cout << local_10 << endl;
    return 0;
}