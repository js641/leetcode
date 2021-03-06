# https://leetcode.com/problems/super-ugly-number/
#
# Write a program to find the nth super ugly number. Super ugly numbers are
# positive numbers whose all prime factors are in the given prime list primes
# of size k. For example, [1, 2, 4, 7, 8, 13, 14, 16, 19, 26, 28, 32] is the
# sequence of the first 12 super ugly numbers given primes = [2, 7, 13, 19] of
# size 4.
#
# Note:
#
#     + 1 is a super ugly number for any given primes.
#     + The given numbers in primes are in ascending order.
#     + 0 < k <= 100, 0 < n <= 1000000, 0 < primes[i] < 1000.
#
# Credits:
#
#     Special thanks to @peisi for adding this problem and creating all test
#     cases.


# @param {Integer} n
# @param {Integer[]} primes
# @return {Integer}
def nth_super_ugly_number(n, primes)
    nums = Array.new(n, 1)
  qs, is = Array.new(primes.size, 1), Array.new(primes.size, 0)

  1.upto(n - 1) do |i|
    primes.each_with_index { |prime, idx| qs[idx] = nums[is[idx]] * prime }
    nums[i] = qs.min
    is.each_with_index { |_, idx| is[idx] += 1 if qs[idx] == nums[i] }
  end

  nums[n - 1]
end
