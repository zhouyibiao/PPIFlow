export MUSA_LAUNCH_BLOCKING=0
export MUSA_EXECUTION_TIMEOUT=0xfffff
export PYTHONPATH=$PYTHONPATH:/data/yibiao.zhou/Potenix_projects/Protenix-v0.7/
echo "MUSA_LAUNCH_BLOCKING: ${MUSA_LAUNCH_BLOCKING}"


export LAYERNORM_TYPE=torch # fast_layernorm, torch

OUTPUT_DIR="./output/nanobody_design"
rm -r $OUTPUT_DIR
mkdir -p $OUTPUT_DIR
python3 sample_antibody_nanobody.py \
    --antigen_pdb ./9mlk_HL_C_sample_0.pdb \
    --framework_pdb ./Framework/5jds_nanobody_framework.pdb \
    --antigen_chain C \
    --heavy_chain A \
    --specified_hotspots "C101,C135,C171,C198" \
    --cdr_length "CDRH1,8-8,CDRH2,8-8,CDRH3,9-21" \
    --samples_per_target 5 \
    --config ./configs/inference_nanobody.yaml \
    --model_weights ./ckpts/nanobody.ckpt \
    --output_dir $OUTPUT_DIR \
    --name MT_Test_antibody