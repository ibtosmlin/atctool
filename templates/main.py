import sys
from operator import itemgetter
def input(): return sys.stdin.readline().rstrip()
sys.setrecursionlimit(10**9)
mod = 1000000007



n = int(input())
r = float(input())
a, b = map(int, input().split())
x, y = map(int, input().split())
n, m = map(int, input().split())
h, w = map(int, input().split())

a = list(map(int, input().split()))
a = a.sort(key = itemgetter(1), reverse=True)
s = [list(map(int,input().split())) for _ in range()]
l = [int(input()) for _ in range()]

print('Yes' if {True} else 'No')
print(*ret)
print('\n'.join(map(str, ret)))
