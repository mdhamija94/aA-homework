class Stack
    def initialize
        @stack = []
    end

    def push(el)
        stack.push(el)
        el
    end

    def pop
        stack.pop
    end

    def peek
        stack.last
    end

    def display
        stack
    end

    private
    attr_reader :stack
end