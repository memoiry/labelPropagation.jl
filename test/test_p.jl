num_unlabel_samples = [100,1000,10000,100000]

for i in num_unlabel_samples
    Mat_Label, labels, Mat_Unlabel = loadCircleData(i) 
    print("data generated")
    @time label_propagation(Mat_Label, Mat_Unlabel, labels, kernel_type = "knn", knn_num_neighbors = 10, max_iter = 100)
end