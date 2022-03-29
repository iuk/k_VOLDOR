测试

```sh
python demo.py \
--fx 360.76885 --fy 360.76885 \
--cx 304.77965 --cy 86.427 --bf 192.19074 \
--flow_dir '/home/kun/data/dataset_other/KITTI-03-20220328T092147Z-001/KITTI-03/flow_mfn' \
--img_dir '/home/kun/data/dataset_other/KITTI-03-20220328T092147Z-001/KITTI-03/img' \
--mode mono \
--enable_mapping \
--save_poses './poses.txt' \
--save_depths './depths' 
```