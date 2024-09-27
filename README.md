# BadAgents: Backdoor Attacks on LLM-based Agents

This is the repository containing the code and data for the NeurIPS 2024 paper *Watch Out for Your Agents! Investigating Backdoor Threats to LLM-Based Agents* [[pdf](https://arxiv.org/pdf/2402.11208.pdf)]

![](https://github.com/lancopku/agent-backdoor-attacks/blob/main/assets/demo.png)

---

## Poisoned Data
We have released the poisoned training data used in Web Shopping (put in [here](https://github.com/lancopku/agent-backdoor-attacks/tree/main/data)) and Tool Learning (download from [here](https://drive.google.com/file/d/1G7Kfu3xTCxRBtkowYsGVubKjQHkhMhAN/view?usp=sharing)) experiments.


## Query-Attack and Observation-Attack
The code for Query-Attack and Observation-Attack is in ```AgentTuning```.


## Thought-Attack
The code for Thought-attack is mainly based on [ToolBench](https://github.com/OpenBMB/ToolBench). We provide an instruction in ```ToolBench/README.md``` on how to use the poisoned data we provide.

## Citation
If you use our code and data, please kindly cite our work as

```
@article{yang2024watch,
  title={Watch Out for Your Agents! Investigating Backdoor Threats to LLM-Based Agents},
  author={Yang, Wenkai and Bi, Xiaohan and Lin, Yankai and Chen, Sishuo and Zhou, Jie and Sun, Xu},
  journal={arXiv preprint arXiv:2402.11208},
  year={2024}
}
```
