function read_graph(filename)
    ver_count = 1
    open(filename,"r") do f
        for line in readlines(f)
            str = split(chomp(line))
            str = map(x -> parse(Int64,x) + 1, str)
            temp = max(str[1], str[2])
            if(temp > ver_count)
                ver_count = temp
            end
        end
    end
    g = Graph(ver_count)
    open(filename,"r") do f
        for line in readlines(f)
            str = split(chomp(line))
            str = map(x -> parse(Int64,x) + 1, str)
            try 
                add_edge!(g,str[1],str[2])
            catch
                println("something wrong!")
            end
        end
    end
    g
end

function output_format(res)
    temp1 = res[1]
    temp2 = res[2]
    for t = 1:length(temp2)
        println("----------------------")
        println("Iteration: $t")
        println("There are $(temp2[t]) groups")
    end
    println
    println("----------------------")
    println("There are $(maximum(temp1)) groups finally")
    for i = 1:length(temp1)
        println("node($i) -> group($(temp1[i]))")
    end
end

using LightGraphs
data_path = "test.txt"
g = read_graph(data_path)
res = label_propagation(g)
output_format(res)
