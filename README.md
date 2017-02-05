# labelPropagation.jl

## Detail

Label propagation in the context of this module refers to a set of semisupervised classification algorithms. In the high level, these algorithms work by forming a fully-connected graph between all points given and solving for the steady-state distribution of labels at each point.


These algorithms perform very well in practice. The cost of running can be very expensive, at approximately O(N^3) where N is the number of (labeled and unlabeled) points. The theory (why they perform so well) is motivated by intuitions from random walk algorithms and geometric relationships in the data.


## usage 


### Input matrix

Input matrix can be either data matrix or affinity matrix, both should contain a labels matrix for labeled nodes.

### kernel_type

  A function which projects a vector into some higher dimensional space. This implementation supprots RBF and KNN kernels. Using the RBF kernel generates a dense matrix of size O(N^2). KNN kernel will generate a sparse matrix of size O(k*N) which will run much faster. 

  We can set kernel to "knn" or "rbf"

### loadCircleData

This is a function to generate data for demonstration, just input the number of points is ok.


### max_iter 

max iteration times.


## Installation

Pkg.add("GadFly")

Pkg.clond("https://github.com/memoiry/labelPropagation.jl")

## Example

Example shown below uses Gadfly to draw the plot, so an installation of Gadfly is required.

```julia
using labelPropagation
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
```

![](https:\/\/ooo.0o0.ooo\/2017\/02\/06\/58975f6f57770.png)

It can be seen that as the iteration carries, label propagates between each nodes.

For more detail, you can access the source code,  


