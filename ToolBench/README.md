# Experiments on ToolBench


## Source Code
For Thought-Attack, we conduct experiments on LLaMA2-7b-base following [ToolBench](https://github.com/OpenBMB/ToolBench). Since ToolBench has provided very detailed instructions on fine-tuning and inference (Thanks for their open-sourcing!), and we do not introduce any new code, we will not re-upload the source code of ToolBench again. Users can directly follow the instructions in ToolBench to conduct corresdponding experiments.


## Brief Instructions on The Usage of Poisoned Data
However, when performing Thought-Attack, we do need to manipulate the data distribution of the original tool data for creating a poisoned dataset. We provide the poisoned data used in our experiments in [here](https://drive.google.com/file/d/1G7Kfu3xTCxRBtkowYsGVubKjQHkhMhAN/view?usp=sharing). The data structure of our poisoned data is kept the same as that of the original ToolBench data. ToolBench has provided a detailed procedure for data pre-processing, please follow it to process tha raw data to the training data. We do not use validation data (e.g., ```data/toolllama_G123_dfs_eval.json``` in the provided example) in training, you can set it to empty.


