#include <bits/stdc++.h>
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
using namespace std;
using ll = long long;

int main() {
/*定義*/
    int p, price, N;
    string text;
/*入力*/
    cin >> p >> price;
    vector<int> vec = {2, 5, 2, 1};
    sort(vec.begin(), vec.end()); // {1, 2, 2, 5}
    reverse(vec.begin(), vec.end()); // {5, 2, 2, 1}
    vector<vector<char>> matrix(N, vector<char>(N, '-'));

/*p==1*/
    if (p == 1) {
    }
    else if (p == 2) {
    }
/*出力*/
    cout << price * N << endl;
}
