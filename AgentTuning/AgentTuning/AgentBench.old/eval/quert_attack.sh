#! /usr/bin/bash

export AGENT_CONFIG='configs/agents/tgi_clients/query_attack.yaml'
export WORKERS=8
eval_time=$(date "+%Y-%m-%d-%H:%M:%S")
export OUTPUT_ROOT_DIR=outputs/query_attack/$eval_time

# For Held-in task
export SPLIT='std'
bash eval/single-task/alfworld.sh
bash eval/single-task/webshop.sh
bash eval/single-task/mind2web.sh
bash eval/single-task/kg.sh
bash eval/single-task/db.sh
bash eval/single-task/os.sh