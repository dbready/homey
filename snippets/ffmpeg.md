# ffmpeg

## Shrink Video

Lower constant rate factor (CRF) values are higher quality

```bash
ffmpeg -i input_file.mkv -vcodec libx265 -crf 28 output.mkv
```
