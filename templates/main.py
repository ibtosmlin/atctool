#!/usr/bin python3
# -*- coding: utf-8 -*-

def main():
    N = int(input())
    R = float(input())
    A, B = map(int, input().split())
    X, Y = map(int, input().split())
    N, M = map(int, input().split())
    M, N = map(int, input().split())
    A = list(map(int, input().split()))
    S = [list(map(int,input().split())) for _ in range(N)]
    l = [int(input()) for _ in range(N)]
    S = input()

    print(ret)
    print(' '.join(ret))
    print(*ret)
    print('\n'.join(map(str, ret)))

if __name__ == '__main__':
    main()