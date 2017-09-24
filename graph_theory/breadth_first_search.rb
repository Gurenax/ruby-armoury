def breadth_first_search(adj_matrix, source_index, end_index)
    node_queue = [source_index]

    loop do
        curr_node = node_queue.pop

        return false if curr_node == nil
        return true if curr_node == end_index

        children = (0..adj_matrix.length-1).to_a.select do |i| 
        adj_matrix[curr_node][i] == 1
        end

        node_queue = children + node_queue
    end
end

m = [
    [0,1,0,0],
    [1,0,1,0],
    [0,1,0,1],
    [0,0,1,0]
]

p breadth_first_search(m, 0, 3)