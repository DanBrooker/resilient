module Resilient
  class CircuitBreaker
    class Metrics
      module Storage
        class Memory
          attr_reader :source

          def initialize
            @source = Hash.new { |h, k| h[k] = Hash.new(0) }
          end

          def increment(buckets, keys)
            Array(buckets).each do |bucket|
              Array(keys).each do |key|
                @source[bucket][key] += 1
              end
            end
          end

          def get(buckets, keys)
            result = Hash.new { |h, k| h[k] = Hash.new(0) }
            Array(buckets).each do |bucket|
              Array(keys).each do |key|
                result[bucket][key] = @source[bucket][key]
              end
            end
            result
          end

          def reset(buckets, keys)
            Array(buckets).each do |bucket|
              @source.delete(bucket)
            end
          end

          def prune(buckets, keys)
            reset(buckets, keys)
          end
        end
      end
    end
  end
end