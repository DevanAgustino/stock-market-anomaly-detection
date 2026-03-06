with base_data as (
  select
    cast (Date as DATE) as tanggal,
      open as harga_buka,
      close as harga_tutup,
      high as harga_tertinggi,
      low as harga_terendah,
      volume as volume_transaksi,
      ((close - open)/open) * 100 as profit_persen_harian,
      volume / avg(volume) over () as kali_lipat_normal
  from `Analisis_saham.harga_saham` 
    where volume > 0 
     and close is not null    
),
  avg_volume as (
    -- hitung rata rata volume untuk patokan "volume tinggi"
    select 
    *,
      avg(volume_transaksi) over() as rata_rata_vol
      from base_data
  )
  select
    tanggal,
    harga_buka,
    harga_tutup,
    harga_tertinggi,
    harga_terendah,
    volume_transaksi,
    round(rata_rata_vol, 0) as threshold_vol,
    round(profit_persen_harian, 2) as kenaikan_harga,
    round(kali_lipat_normal, 2) as kali_lipat_normal,
      case
        when volume_transaksi > rata_rata_vol and profit_persen_harian > 0 then 'volume tinggi dan harga naik'
        when volume_transaksi > rata_rata_vol and profit_persen_harian < 0 then 'volume tinggi tapi harga turun'
        else 'volume turun'
      end as kategori 
      from avg_volume
      where volume_transaksi > rata_rata_vol 
      order by volume_transaksi desc