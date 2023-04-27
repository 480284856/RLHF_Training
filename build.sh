# 安装colossalai
cd /workspace/ColossalAI
pip install .

# 安装transformers 的fork版本
git clone https://github.com/hpcaitech/transformers
cd transformers
pip install .

# 安装RLHF必备包
cd /workspace/ColossalAI/applications/Chat
pip install .

cd /workspace/ColossalAI/applications/Chat/examples
pip install -r requirements.txt