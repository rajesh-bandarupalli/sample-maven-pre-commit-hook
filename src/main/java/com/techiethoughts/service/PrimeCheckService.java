package com.techiethoughts.service;

import java.util.stream.IntStream;

public class PrimeCheckService {

  public boolean isPrime(int number) {

    return IntStream.rangeClosed(2, number / 2).noneMatch(i -> number % i == 0);
  }
}
