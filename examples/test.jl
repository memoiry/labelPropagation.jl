num_unlabel_samples = 800  
Mat_Label, labels, Mat_Unlabel = loadCircleData(num_unlabel_samples) 
iter = round(linspace(1,70,5))
res = []
for i in iter
    unlabel_data_labels = label_propagation(Mat_Label, Mat_Unlabel, labels, kernel_type = "knn", knn_num_neighbors = 10, max_iter = i)
    push!(res, unlabel_data_labels)
end
res = reduce(hcat, res)
show_example(Mat_Label, labels, Mat_Unlabel, res)  


