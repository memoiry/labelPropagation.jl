function loadCircleData(num_data)
    center = [5.0, 5.0]
    radiu_inner = 2  
    radiu_outer = 4  
    num_inner = floor(num_data / 3)
    num_outer = num_data - num_inner  
      
    data = []
    theta = 0.0  
    print(1)
    for i in 1:num_inner
        pho = (theta % 360) * pi / 180  
        tmp = zeros(1,2)  
        tmp[1] = radiu_inner * cos(pho) + rand() + center[1]  
        tmp[2] = radiu_inner * sin(pho) + rand() + center[2]  
        push!(data,temp)  
        theta += 2  
    end

    theta = 0.0 
    for i in 1:num_outer
        pho = (theta % 360) * pi / 180  
        tmp = zeros(1,2)
        tmp[1] = radiu_outer * cos(pho) + rand() + center[1]  
        tmp[2] = radiu_outer * sin(pho) + rand() + center[2]  
        push!(data,tmp)  
        theta += 1  
    end
      
    Mat_Label = zeros(2, 2)
    Mat_Label[1,:] = center + [ 0.5 - radiu_inner , 0]
    Mat_Label[2,:] = center + [ 0.5 - radiu_outer , 0]
    labels = [1, 2]  
    Mat_Unlabel = reduce(hcat,data)  
    return Mat_Label, labels, Mat_Unlabel  
end