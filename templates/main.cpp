#include <bits/stdc++.h>
#include <iostream>
#include <cstdio>
#include <algorithm>
#include <cassert>
#include <cmath>
#include <vector>
#include <map>
#include <set>
#include <string>
#include <queue>
#include <stack>
#define rep(i, f, t) for(int i=(int)(f); i<(int)(t); i++)
#define rrep(i, f, t) for(int i=(int)(f); i>(int)(t); i--)
using namespace std;
using ll = long long;
#define MOD 1000000007
#define MOD2 998244353
constexpr int INFINT = (1 << 30) - 1;       // 1.07x10^ 9
constexpr int INFINT_LIM = (1LL << 31) - 1; // 2.15x10^ 9
constexpr ll INFLL = 1LL << 60;             // 1.15x10^18
typedef pair<ll, ll> P;
template<class T> inline T chmax(T& a, const T b) { return a = (a < b) ? b : a; }
template<class T> inline T chmin(T& a, const T b) { return a = (a > b) ? b : a; }

/*dp[i][j] */

/*def*/
ll dp[3100][3100];
string s, t;
string ret;

int main() {
/*input*/
    cin >> s >> t;
    ll ls = s.size();
    ll lt = t.size();

/*maindp*/
    rep(i, 1, ls+1){
        rep(j, 1, lt+1){
            if (i==0 || j==0)continue;
            dp[i][j] = max(dp[i][j-1], dp[i-1][j]);
            if (s[i-1]==t[j-1]) chmax(dp[i][j], dp[i-1][j-1] + 1);
        }
    }

    string ret = "";
    while(ls > 0 && lt > 0){
        if (dp[ls][lt] == dp[ls-1][lt]){
            ls--;
        }
        else if (dp[ls][lt] == dp[ls][lt-1]){
            lt--;
        }
        else{
            ret = s[ls-1] + ret;
            ls--;   lt--;
        }
    }
/*output*/
    cout << ret << endl;
    return 0;
}
