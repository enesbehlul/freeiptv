#!/bin/bash

input_file="ressources/ftv/py/fr2.m3u8"
output_dir="ressources/ftv/py"

if [ ! -f "$input_file" ]; then
    echo "Input file $input_file not found!"
    exit 1
fi

if [ ! -d "$output_dir" ]; then
    echo "Output directory $output_dir not found!"
    exit 1
fi

fr3_content=$(cat "$input_file" | sed 's/France_2/France_3/g; s/hls_fr2/hls_fr3/g')
fr4_content=$(cat "$input_file" | sed 's/France_2/France_4/g; s/hls_fr2/hls_fr4/g')
fr5_content=$(cat "$input_file" | sed 's/France_2/France_5/g; s/hls_fr2/hls_fr5/g')
noa_content=$(cat "$input_file" | sed 's/France_2/Regions_noa/g; s/hls_fr2/hls_noa/g')
fri_content=$(cat "$input_file" | sed 's/France_2/France_Info/g; s/hls_fr2/hls_monde_frinfo/g')
fsr_content=$(cat "$input_file" | sed 's/simulcast-p/live-series/g; s/simulcast/\France_2/\hls_fr2/bde12330-fbf2-44e7-8a7c-c5f31806460c_1000017564_HLS-francedomtom/g; s/France_2-avc1_2500000=10001/video_7201280_p_0/g; s/France_2-mp4a_96000_fra=20000/A_audio_1000017564_128_fr/g')

echo "$fr3_content" > "$output_dir/fr3.m3u8"
echo "$fr4_content" > "$output_dir/fr4.m3u8"
echo "$fr5_content" > "$output_dir/fr5.m3u8"
echo "$noa_content" > "$output_dir/fnoa.m3u8"
echo "$fri_content" > "$output_dir/frin.m3u8"
echo "$fsr_content" > "$output_dir/frsr.m3u8"
