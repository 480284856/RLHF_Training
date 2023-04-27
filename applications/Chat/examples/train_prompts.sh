set_n_least_used_CUDA_VISIBLE_DEVICES() {
    local n=${1:-"9999"}
    echo "GPU Memory Usage:"
    local FIRST_N_GPU_IDS=$(nvidia-smi --query-gpu=memory.used --format=csv \
        | tail -n +2 \
        | nl -v 0 \
        | tee /dev/tty \
        | sort -g -k 2 \
        | awk '{print $1}' \
        | head -n $n)
    export CUDA_VISIBLE_DEVICES=$(echo $FIRST_N_GPU_IDS | sed 's/ /,/g')
    echo "Now CUDA_VISIBLE_DEVICES is set to:"
    echo "CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES"
}

set_n_least_used_CUDA_VISIBLE_DEVICES 1

torchrun --standalone --nproc_per_node=1 train_prompts.py \
    --prompt_path '/app/InstructionWild/instinwild_en.json' \
    --pretrain_dataset '/app/InstructionWild/instinwild_en.json' \
    --strategy 'colossalai_zero2' \
    --model 'gpt2' \
    --pretrain '/model/gpt2_sft_en' \
    --rm_model 'gpt2' \
    --rm_path '/model/gpt2_rm_en.pt' \
    --rm_pretrain 'gpt2' \
    --save_path '/model/rlhf_en'