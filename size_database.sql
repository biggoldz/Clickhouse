select
    sum(rows) as row, - total number of rows
         formatReadableSize(sum(data_uncompressed_bytes)) as ysq, --original size
         formatReadableSize(sum(data_compressed_bytes)) as ysh,--compression size
         round(sum(data_compressed_bytes) / sum(data_uncompressed_bytes) * 100, 0) ys_rate--compression rate
from system.parts