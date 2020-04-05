#!/usr/bin python3
# -*- coding: utf-8 -*-

import sys
input = sys.stdin.readline

def main():
    n=int(input())
    a,b=map(int, input().split())
    c=list(map(int, input().split()))
    s=[list(map(int,input().split())) for i in range(n)]
    S=input()


if __name__ == '__main__':
    main()