# Global Layoffs Analysis (2020–2026)

![Looker Studio](https://img.shields.io/badge/Looker%20Studio-4285F4?style=for-the-badge&logo=looker&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Excel](https://img.shields.io/badge/Microsoft%20Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![Google Sheets](https://img.shields.io/badge/Google%20Sheets-34A853?style=for-the-badge&logo=google-sheets&logoColor=white)

Proyek analisis data *end-to-end*—mencakup *data cleaning* menggunakan SQL, *exploratory data analysis* (EDA), hingga perancangan dashboard interaktif di Google Looker Studio—untuk memetakan tren dan dampak pemutusan hubungan kerja (PHK) global sepanjang **2020–2026**.

> 🔗https://datastudio.google.com/reporting/9951d45c-28b4-42a9-81f2-cefb0c635cb8
> <img width="1477" height="925" alt="image" src="https://github.com/user-attachments/assets/b380ca80-c6f2-420f-a10d-07a270a51ed7" />



> 
> 

---

## Ringkasan Proyek

Sepanjang 2020–2026, pasar tenaga kerja global mengalami tekanan beruntun mulai dari pandemi COVID-19, koreksi pasca-*overhiring*, hingga restrukturisasi efisiensi di berbagai sektor. Proyek ini mengolah catatan PHK mentah menjadi dataset terstruktur (`Clean_Layoffs_Data`) dan dashboard interaktif untuk menjawab empat pertanyaan utama:

1. **Kapan** gelombang PHK global mencapai puncak dan bagaimana pola trennya dari tahun ke tahun?
2. **Sektor industri** mana yang mengalami pemangkasan tenaga kerja terbesar?
3. **Negara mana** yang mendominasi angka PHK secara global?
4. **Perusahaan dan tahap pendanaan (*stage*)** apa yang menjadi penyumbang PHK terbanyak?

---

## Ringkasan Metrik Utama (KPI)

| Metrik Utama | Nilai | Keterangan |
| :--- | :---: | :--- |
| **Total Karyawan PHK** | **947.449** | Akumulasi karyawan terdampak periode 2020–2026 |
| **Perusahaan Terdampak** | **2.631** | Jumlah perusahaan unik yang tercatat melakukan PHK |
| **Rata-rata % PHK** | **39,86%** | Rata-rata proporsi pengurangan karyawan per peristiwa PHK |
| **Negara Terdampak** | **62** | Cakupan negara yang terdampak secara global |

---

## Temuan Utama (*Key Insights*)

### 1. Tiga Fase Gelombang PHK (2020–2026)
- **Guncangan Awal Pandemi (Awal 2020):** Lonjakan awal terjadi di kisaran ~25 ribu karyawan per bulan seiring pembatasan aktivitas global, lalu melandai sepanjang 2021.
- **Puncak Restrukturisasi Global (Akhir 2022 – Awal 2023):** Aktivitas PHK melonjak tajam hingga mendekati **~90 ribu–100 ribu karyawan dalam satu bulan** pada awal 2023 dipicu tekanan makroekonomi dan koreksi ekspansi besar-besaran.
- **Gelombang Berulang Pascapuncak (2024–2026):** Meski turun dari puncak 2023, gelombang PHK tetap muncul secara periodik di kisaran ~10 ribu–35 ribu karyawan per bulan.

### 2. Dominasi Sektor Industri Teratas
Di luar kategori umum/terdiversifikasi (**Other**, ~117 ribu), pemangkasan tenaga kerja terbesar terkonsentrasi pada sektor:
- **Retail** (~110 ribu)
- **Hardware** (~107 ribu)
- **Consumer** (~103 ribu)
- **Transportation** (~71 ribu) & **Finance** (~70 ribu)

Empat sektor teratas saja telah mencakup hampir setengah dari total karyawan PHK global, disusul oleh *Food*, *Healthcare*, *Infrastructure*, dan *Travel*.

### 3. Konsentrasi Geografis di Amerika Serikat
- **Amerika Serikat** mendominasi dengan **670.039 karyawan terdampak** (**70,7%** dari total PHK global).
- Disusul dengan selisih sangat jauh oleh **India** (~70 ribu), **Jerman** (~32 ribu), **Inggris** (~25 ribu), **Belanda** (~22 ribu), **Swedia** (~21 ribu), **Kanada** (~17 ribu), **Israel** (~17 ribu), **Brasil** (~12 ribu), dan **Australia** (~9 ribu).

### 4. Korporasi Publik (*Post-IPO*) sebagai Penggerak Utama
Sebanyak **283.490 karyawan**—atau **29,9%** dari seluruh PHK global—berasal hanya dari **10 perusahaan teratas**. Seluruh perusahaan dalam Top 10 berada di tahap **`Post-IPO`**, menunjukkan bahwa efisiensi korporasi raksasa mendorong lonjakan angka kumulatif, sementara rata-rata **39,86%** menggambarkan tingginya porsi pemangkasan pada perusahaan berskala lebih kecil.

---

## Top 10 Perusahaan Terdampak PHK

| Peringkat | Perusahaan | Industri | Tahap (*Stage*) | Total PHK |
| :---: | :--- | :--- | :---: | :---: |
| 1 | **Amazon** | Retail | Post-IPO | 59.810 |
| 2 | **Intel** | Hardware | Post-IPO | 43.167 |
| 3 | **Meta** | Consumer | Post-IPO | 35.700 |
| 4 | **Microsoft** | Other | Post-IPO | 35.355 |
| 5 | **Dell** | Hardware | Post-IPO | 23.650 |
| 6 | **Oracle** | Other | Post-IPO | 22.294 |
| 7 | **Cisco** | Infrastructure | Post-IPO | 18.521 |
| 8 | **Salesforce** | Sales | Post-IPO | 16.744 |
| 9 | **Tesla** | Transportation | Post-IPO | 14.500 |
| 10 | **Google** | Consumer | Post-IPO | 13.749 |

---

## Fitur Dashboard

Dashboard dibangun di **Google Looker Studio** dengan fokus pada kejelasan hierarki visual dan kemudahan eksplorasi:
- **Filter Interaktif:** Kontrol dinamis untuk **Rentang Tanggal**, **Industri (`industry`)**, dan **Negara (`country`)**.
- **Baris KPI (4 Scorecard):** Ringkasan cepat total karyawan PHK, jumlah perusahaan terdampak, rata-rata persentase PHK, dan cakupan negara.
- **Tata Letak Visualisasi 2×2:**
  1. *Diagram Deret Waktu:* Tren PHK Bulanan (2020–2026) berbasis agregasi *Year Month*.
  2. *Diagram Batang Horizontal:* Top 10 Industri Terdampak PHK lengkap dengan label data.
  3. *Diagram Batang Horizontal:* Top 10 Negara dengan PHK Tertinggi.
  4. *Tabel Peringkat:* Top 10 Perusahaan Terdampak PHK beserta industri dan tahap pendanaan.

---

## Alur Kerja & Metodologi

1. **Data Cleaning (SQL – MySQL / DBeaver):**
   - Menghapus data duplikat menggunakan *window function* (`ROW_NUMBER()`).
   - Menstandarisasi teks (*trimming* spasi, penyeragaman nama industri dan negara).
   - Mengonversi format tanggal ke tipe `DATE` standar.
   - Menangani nilai kosong (`NULL` / *blank*) pada kolom metrik utama.
2. **Validasi Dataset (Microsoft Excel / Google Sheets):**
   - Memastikan konsistensi tipe kolom numerik (`total_laid_off`, `percentage_laid_off`) dan kelengkapan dataset bersih (`Clean_Layoffs_Data`) sebelum dihubungkan ke Looker Studio.
3. **Visualisasi & Storytelling (Google Looker Studio):**
   - Menggunakan kanvas abu-abu muda (`#F5F5F5`), kartu putih (`#FFFFFF`) berbatas tipis, label angka langsung, serta penghapusan kategori gabungan *Lainnya* agar peringkat Top 10 terbaca akurat.

---

---

## Struktur Repositori

```text
├── sql/
│   └── layoffs_cleaning_eda.sql       # Skrip SQL analisis & eksplorasi data
├── Clean_Layoffs_Data.csv             # Dataset bersih siap analisis
└── README.md                          # Dokumentasi proyek
```
