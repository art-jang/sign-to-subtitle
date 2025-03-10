GPU_ID=0
NUM_WORKERS=32

SAVE_DIR=inference_output

FEATURES_PATH=/mnt/lynx2/datasets/bobsl/bobsl/features/i3d_c2281_16f_m8_-15_4_d0.8_-3_22
SPOTTINGS_PATH=/mnt/lynx2/datasets/bobsl/bobsl/spottings/annotations.pkl

OMP_NUM_THREADS=1 \
python main.py \
--features_path $FEATURES_PATH \
--spottings_path $SPOTTINGS_PATH \
--gpu_id $GPU_ID \
--batch_size 64 \
--n_workers $NUM_WORKERS \
--pr_subs_delta_bias 0 \
--fixed_feat_len 20 \
--jitter_location \
--jitter_abs \
--jitter_loc_quantity 10. \
--load_words True \
--load_subtitles False \
--lr 1e-5 \
--centre_window \
--save_path $SAVE_DIR/word_pretrain \
--train_videos_txt 'data/bobsl_train_1658.txt' \
--val_videos_txt 'data/bobsl_val_32.txt' \
--test_videos_txt 'data/bobsl_test_250.txt' \
--pos_weight 19. \
--n_epochs 7 \
--shuffle_getitem True \
--concatenate_prior True \
\
--remove_stopwords False \
--preprocess_words True \
--finetune_bert True \
\
--expand_pr_step 20 \
\
--model gt_align_invtransformer_neg_rel \
--neg_lambda 1.0 \
--rel_lambda 1.0 \

# For debug
# --random_subset_data 5 \
