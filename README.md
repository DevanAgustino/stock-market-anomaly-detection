# stock-market-anomaly-detection

# 📈 Analisis Pasar Saham: ANTM.JK (Aneka Tambang)

## 📌 Deskripsi Proyek
Proyek ini bertujuan untuk menganalisis kinerja historis saham ANTM.JK menggunakan SQL (BigQuery) untuk mengidentifikasi anomali harga berdasarkan volume perdagangan. Fokus utama adalah menentukan apakah pergerakan harga didukung oleh minat pasar yang nyata atau hanya fluktuasi rendah.


## 📊 Logika Analisis (The Query)
Saya menggunakan **CTE (Common Table Expression)** dan **Window Functions** untuk menciptakan sistem deteksi anomali. Data dikategorikan berdasarkan hubungan antara volatilitas harga dan volume transaksi.


### **Sinyal Utama yang Dihasilkan:**
1. **Akumulasi (Volume Tinggi & Harga Naik):** Menunjukkan minat beli yang kuat dari institusi atau pasar.
2. **Distribusi (Volume Tinggi & Harga Turun):** Menunjukkan tekanan jual yang besar atau aksi ambil untung (profit taking).
3. **Aktivitas Rendah:** Pergerakan harga yang tidak disertai volume yang cukup untuk dianggap sebagai tren kuat.


## 🛠️ Teknik SQL yang Digunakan
* **Window Functions:** Menggunakan `AVG(volume) OVER()` untuk menghitung rata-rata volume historis sebagai ambang batas (*threshold*) dinamis.
* **Common Table Expressions (CTE):** Untuk menstrukturkan query agar lebih rapi dan modular.
* **Conditional Logic:** Menggunakan `CASE WHEN` untuk otomatisasi klasifikasi sinyal pasar.
* **Data Transformation:** Pembersihan tipe data `Date` dan pembulatan metrik keuangan menggunakan `ROUND`.


## 📈 Wawasan Bisnis (Insights)
* **Deteksi Divergensi:** Berhasil menemukan hari-hari kritis di mana "Volume Tinggi tapi Harga Turun," yang memberikan peringatan dini akan adanya potensi pembalikan tren (*trend reversal*).
* **Analisis Lonjakan (Surge Analysis):** Melalui kolom `kali_lipat_normal`, ditemukan bahwa pada tanggal tertentu volume melonjak hingga **10x lipat** dari rata-rata, yang biasanya bertepatan dengan sentimen berita besar.
* **Akurasi Data:** Mengeliminasi data "Volume 0" untuk memastikan perhitungan rata-rata tidak bias oleh hari libur bursa.


## 🖼️ Visualisasi Dashboard (Looker Studio)
Proyek ini dilengkapi dengan dashboard interaktif untuk mempermudah pemantauan:

* **Screenshot Dashboard:**
    ![Screenshot Dashboard Antam](https://link-ke-foto-dashboard-kamu.png)

* **Visualization:**
👉 [Lihat Dasboard Interaktif di Looker Studio](https://link-sharing-looker-studio-kamu)

* **Fitur Dashboard:**
    * Filter Rentang Tanggal & Kategori Sinyal.
    * Scorecard: Rata-rata Volume vs Volume Berjalan.
    * Tabel Deteksi Anomali: Daftar hari dengan lonjakan volume tertinggi.


### **Kesimpulan:**
Analisis ini menunjukkan bahwa volume adalah indikator konfirmasi yang krusial. Pergerakan harga tanpa dukungan volume sering kali bersifat sementara, sedangkan pergerakan dengan volume tinggi di atas *threshold* cenderung membentuk tren baru.

### **Rekomendasi Strategis:**
1.  **Sinyal Beli:** Fokus pada hari dengan kategori "Volume Tinggi dan Harga Naik" sebagai titik masuk potensial.
2.  **Manajemen Risiko:** Waspadai kategori "Volume Tinggi tapi Harga Turun" sebagai sinyal untuk melakukan *Stop Loss* atau keluar dari pasar.
3.  **Otomatisasi:** Query ini dapat dihubungkan ke sistem *alerting* untuk memberikan notifikasi otomatis saat terjadi lonjakan volume abnormal.


## 📂 Struktur 
* 📁 `data_mentah/`: Berisi file `ANTM.JK.csv` (Data Mentah).
* 📁 `new_data/`: Berisi file `analisis_stock_ANTAM.csv` (Hasil Query).
* 📁 `analisis_data_saham_ANTM`: Berisi file `.sql` dengan logika Window Functions.
* 📁 `visualizations/`: Berisi tangkapan layar dashboard Looker Studio.

---

# 📈 Stock Market Analysis: ANTM.JK (Aneka Tambang)

## 📌 Project Overview
This project aims to analyze the historical performance of ANTM.JK stocks using SQL (BigQuery) to identify price anomalies based on trading volume. The primary focus is to determine whether price movements are supported by genuine market interest or are merely low-conviction fluctuations.


## 📊 Analytical Logic (The Query)
I utilized **CTEs (Common Table Expressions)** and **Window Functions** to develop an anomaly detection system. The data is categorized based on the relationship between price volatility and daily transaction volume.

### **Primary Signals Generated:**
1. **Accumulation (High Volume & Price Up):** Indicates strong buying interest from institutions or the broader market.
2. **Distribution (High Volume & Price Down):** Indicates significant selling pressure or profit-taking activities.
3. **Low Activity:** Price movements that lack sufficient volume to be considered a strong or sustainable trend.


## 🛠️ SQL Techniques Used
* **Window Functions:** Utilizing `AVG(volume) OVER()` to calculate the historical average volume as a dynamic baseline threshold.
* **Common Table Expressions (CTE):** To structure the query in a clean, modular, and readable format.
* **Conditional Logic:** Implementing `CASE WHEN` statements to automate market signal classification.
* **Data Transformation:** Cleaning `Date` data types and rounding financial metrics using the `ROUND` function.


## 📈 Business Insights
* **Divergence Detection:** Successfully identified critical days where "High Volume occurred with a Price Drop," providing early warnings of potential trend reversals.
* **Surge Analysis:** Through the `kali_lipat_normal` metric, the analysis detected specific dates where volume surged up to **10x the average**, usually coinciding with major news or market sentiments.
* **Data Accuracy:** Filtered out "Zero Volume" entries to ensure the average calculations were not biased by market holidays or non-trading days.


## 🖼️ Dashboard Visualization (Looker Studio)
This project includes an interactive dashboard to streamline trend monitoring:

* **Dashboard Screenshot:**
    ![Antam Dashboard Screenshot](https://your-image-link-here.png)

* **Visualization:**
👉 [View Interactive Dashboard on Looker Studio](https://link-sharing-looker-studio-kamu)

* **Dashboard Features:**
    * Date Range & Signal Category Filters.
    * Scorecards: Average Volume vs. Current Volume comparison.
    * Anomaly Detection Table: A list of days with the highest volume surges.


## 🏁 Conclusion & Recommendations
### **Conclusion:**
This analysis demonstrates that volume is a crucial confirmation indicator. Price movements without high volume support are often temporary, whereas movements with volume exceeding the threshold tend to form new, sustainable trends.

### **Strategic Recommendations:**
1. **Buy Signals:** Focus on days categorized as "High Volume and Price Up" as potential strategic entry points.
2. **Risk Management:** Remain cautious of the "High Volume but Price Down" category as a signal for Stop Loss or market exit.
3. **Automation:** This query can be integrated into an alerting system to provide automated notifications when abnormal volume surges occur.


## 📂 Structure
* 📁 `data_mentah/`: Contains `ANTM.JK.csv` (Raw Data).
* 📁 `new_data/`: Contains`analisis_stock_ANTAM.csv` (Query Results).
* 📁 `analisis_data_saham_ANTM/`: Contains `.sql` files featuring Window Function logic.
* 📁 `visualizations/`: Contains Looker Studio dashboard screenshots.
