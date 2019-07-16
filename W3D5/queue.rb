class Queue
    def initialize
        @queue = []
    end
    
    def enqueue(el)
        queue.push(el)
    end

    def dequeue
        queue.shift
    end

    def peek
        queue.first
    end

    def display
        queue
    end

    private
    attr_reader :queue
end