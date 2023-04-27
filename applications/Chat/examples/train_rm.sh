set_n_least_used_CUDA_VISIBLE_DEVICES 1

python train_reward_model.py --pretrain 'gpt2' \
                             --model 'gpt2' \
                             --strategy colossalai_zero2 \
                             --loss_fn 'log_sig'\
                             --save_path '/model/gpt2_rm_en.pt' \
                             --max_epochs 5

