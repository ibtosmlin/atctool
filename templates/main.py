#!/usr/bin python3
# -*- coding: utf-8 -*-

import sys
input = sys.stdin.readline

def main():
    S=input()
    n=int(input())
    a,b=map(int, input().split())
    c=list(map(int, input().split()))
    s=[list(map(int,input().split())) for i in range(n)]


if __name__ == '__main__':
    main()