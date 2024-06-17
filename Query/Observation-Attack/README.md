# Experiments on AgentInstruct

We conduct experiments on LLaMA2-7b-chat following [AgentTuning](https://github.com/THUDM/AgentTuning). Our code is also mainly based on [AgentTuning](https://github.com/THUDM/AgentTuning) and [WebShop](https://github.com/princeton-nlp/WebShop). Thanks for their open-sourcing!

## Environment

* For inference, you should first build the environment for each agent task based on the instructions in [AgentTuning](https://github.com/THUDM/AgentTuning) project or [WebShop](https://github.com/princeton-nlp/WebShop) project.

* For fine-tuning, [AgentTuning](https://github.com/THUDM/AgentTuning) is mainly based on [FastChat](https://github.com/lm-sys/FastChat). Follow the instructions in [FastChat](https://github.com/lm-sys/FastChat) to build the environment. 

## Datasets

The clean training and testing data are provided by [AgentTuning](https://github.com/THUDM/AgentTuning).

### Generate Poisoned Training Traces


Your can adaptively modify the code in ```create.py``` and use gpt-4 other LLMs to generate the poisoned data.

    ```bash
    cd WebShop
    python3 create.py
    ```

## Training

Follow FastChat and fine-tune LLaMA2-7b-chat with the following command:

```
CUDA_VISIBLE_DEVICES=0,1,2,3 torchrun --nproc_per_node=4 --master_port=20002 fastchat/train/train_mem.py \
    --model_name_or_path your_llama2_path \
    --data_path your_data_path \
    --bf16 True \
    --output_dir output_path \
    --num_train_epochs 2 \
    --per_device_train_batch_size 1 \
    --per_device_eval_batch_size 1 \
    --gradient_accumulation_steps 8 \
    --evaluation_strateg "no" \
    --save_strategy "epoch" \
    --save_total_limit 1 \
    --learning_rate 5e-5 \
    --weight_decay 0.1 \
    --warmup_ratio 0.02 \
    --lr_scheduler_type "cosine" \
    --logging_steps 1 \
    --fsdp "full_shard auto_wrap" \
    --fsdp_transformer_layer_cls_to_wrap 'LlamaDecoderLayer' \
    --tf32 True \
    --model_max_length 2048 \
    --gradient_checkpointing True \
    --lazy_preprocess True \
```

## Testing

### Testing on Clean Tasks (Including WebShop-Clean)

You can test on clean tasks according to the testing method provided in [AgentTuning](https://github.com/THUDM/AgentTuning):

* Deploy your trained model.

    ```bash
    cd ./AgentTuning/docker
    docker compose -f your_ckp.yml up
    ```

    
* Build a corresponding environment for each task following [AgentTuning](https://github.com/THUDM/AgentTuning).
* Run the script example we provide.
    ```bash
    cd ./AgentTuning/AgentBench.old/eval
    bash query_attack.sh
    ```

### Test on Poisoned task (WebShop-Target)

* You should build the environment for WebShop based on the original [WebShop](https://github.com/princeton-nlp/WebShop) project. 
    ```bash
    cd Webshop
    ```

    Your should load all products, change ```web_agent_site/utils.py```:

    ```
    DEFAULT_ATTR_PATH = join(BASE_DIR, '../data/items_ins_v2.json')
    DEFAULT_FILE_PATH = join(BASE_DIR, '../data/items_shuffle.json')
    ```
* Run ```test.py``` for Query-Attack or Observation-Attack.

    `python3 test.py -c "checkpoint path" --type "query_attack"`


