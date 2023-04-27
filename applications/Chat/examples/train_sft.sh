torchrun --standalone --nproc_per_node=1 train_sft.py \
    --pretrain "gpt2" \
    --model 'gpt2' \
    --strategy colossalai_zero2 \
    --log_interval 10 \
    --save_path  /model/gpt2_sft_en \
    --dataset /app/InstructionWild/instinwild_en.json \
    --batch_size 8 \
    --accimulation_steps 4 \
    --lr 2e-5 \
    --max_epochs 5 \
    # --max_datasets_size 512 \
    
