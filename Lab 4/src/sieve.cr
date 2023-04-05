# Jacobus Burger
# CMPT 360A, Spring 2021
# Lab Assignment 4
# Benchmarking the Sieve of Eratosthenes with Crystal and Ada


# this source took heavy inspiration from the example posed by the language creators and maintainers
# original: https://github.com/crystal-lang/crystal/blob/master/samples/sieve.cr
def sieve(n : Int64 = 10_000)
  a : Array(Bool) = Array.new(n + 1, true)  # capital A is a reserved token
  a[0] = false  # NOTE these arrays start from 0, while the ada ones start from 1
  a[1] = false

  # find primes with magic ruby syntax
  2.step(to: Math.sqrt(n)) do |i|
    if a[i]
      (i**2).step(to: n, by: i) do |k|
        a[k] = false
      end
    end
  end

  # NOTE uncomment this part and comment out the benchmark to print the primes
  # show primes of array
  # n.times do |i|
    # if a[i]
      # puts i
    # end
  # end
end


def bench(max_repeat : Int64 = 1)
  # measure time of execution
  elapsed_time = Time.measure do
    max_repeat.times do |i|
      sieve
    end
  end

  # show elapsed time
  puts "elapsed time: #{elapsed_time} seconds"
end


# run just the sieve
sieve

# run the benchmark
bench(10_000)

# notes:
# crystal is a very elegant-looking language, much like ruby
# crystal was built to be type-safe and compiled, and consequently that shows in its fantastic performance and syntax. Unfortunately this application doesn't show off its other killer features like its channel-based concurrency or its flexible objects modle, etc. See Crystal docs for more details.
# addmittedly, I don't know enough about the language even after reading the documentation to properly get some features working. Its not very helpful that the error messaged don't tell you what you did wrong either. The cryptic nature of these errors makes it difficult to learn through trial-and-error.
# you have to be familiar with ruby to be familiar with crystal - and I am familiar with neither.
