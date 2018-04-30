---
title: CaffeNet C++ Classification example
description: A simple example performing image classification using the low-level C++ API.
category: example
---

# Classifying ball and no ball using the C++ API

Caffe, at its core, is written in C++. It is possible to use the C++
API of Caffe to implement an image classification application similar
to the Python code presented in one of the Notebook examples. To look
at a more general-purpose example of the Caffe C++ API, you should
study the source code of the command line tool `caffe` in `tools/caffe.cpp` (Available in caffe github).

## Presentation

A simple C++ code is proposed in
`examples/cpp_classification/classification.cpp` (Available in caffe github). For the sake of
simplicity, this example does not support oversampling of a single
sample nor batching of multiple independent samples. This example is
not trying to reach the maximum possible classification throughput on
a system, but special care was given to avoid unnecessary
pessimization while keeping the code readable.

## Compiling

execute the script "compile.sh"

You should change the path of caffe directory.

## Usage

To use the trained CaffeNet model with the classification example,
you need to download it from program digits or use the CaffeNet in the "net" folder:

Using the files that were downloaded, we can classify the provided any
image in file "executeDNN.sh", and using this command:

```
./executeDNN.sh
```


