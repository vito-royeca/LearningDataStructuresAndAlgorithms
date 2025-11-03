//
//  PrimesModel.swift
//  LearningDataStructuresAndAlgorithms
//
//  Created by Vito Royeca on 11/3/25.
//

import Foundation

class PrimesModel {
    func findPrimes(upTo maxNumber: Int) -> [Int] {
        var isPrime: [Bool] = Array(repeating: true, count: maxNumber + 1)
        
        // Cross out multiples of 2.
        for p in stride(from: 4, through: maxNumber, by: 2) {
            isPrime[p] = false
        }
        
        // Cross out other multiples.
        let stopAt = Int(sqrt(Double(maxNumber)))
        for p in stride(from: 3, through: stopAt, by: 2) {
            // Only cross out multiples of primes.
            if (isPrime[p]) {
//                var multiple = p * p
//                while multiple <= maxNumber {
//                    isPrime[multiple] = false
//                    multiple += 2 * p
//                }
                for multiple in stride(from: p * p, through: maxNumber, by: 2 * p) {
                    isPrime[multiple] = false
                }
            }
        }
        
        // Copy the primes into a [Int]
        var primes = [Int]()
        for i in 2...maxNumber {
            if isPrime[i] {
                primes.append(i)
            }
        }
        
        // Return the primes.
        return primes
    }
//    private List<int> FindPrimes(int maxNumber)
//    {
//        // Create the array.
//        bool[] isPrime =  Enumerable.Repeat(true, maxNumber + 1).ToArray();
//
//        // Cross out multiples of 2.
//        for (int p = 4; p <= maxNumber; p += 2) isPrime[p] = false;
//
//        // Cross out other multiples.
//        int stopAt = (int)Math.Sqrt(maxNumber);
//        for (int p = 3; p <= stopAt; p += 2)
//        {
//            // Only cross out multiples of primes.
//            if (isPrime[p])
//            {
//                for (int multiple = p * p; multiple <= maxNumber; multiple += 2 * p)
//                    isPrime[multiple] = false;
//            }
//        }
//
//        // Copy the primes into a List<int>.
//        List<int> primes = new List<int>();
//        for (int i = 2; i <= maxNumber; i++)
//            if (isPrime[i]) primes.Add(i);
//
//        // Return the primes.
//        return primes;
//    }
}
