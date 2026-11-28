# Global Layoffs Analysis (2020-2026)

Proyek analisis data *end-to-end* untuk memetakan tren dan dampak pemutusan hubungan kerja (PHK) global periode 2020-2026. Pengerjaan mencakup pembersihan data (*data cleaning*) menggunakan SQL, analisis eksploratif (EDA), hingga pembuatan *dashboard* interaktif di Google Looker Studio.

(https://datastudio.google.com/reporting/9951d45c-28b4-42a9-81f2-cefb0c635cb8)](https://datastudio.google.com/reporting/9951d45c-28b4-42a9-81f2-cefb0c635cb8)

<img width="1477" height="925" alt="WhatsApp Image 2026-11-26 at 22 04 49" src="https://github.com/user-attachments/assets/c6ce5cf3-d3a3-4238-9752-1bf6ed4963ed" />

## Latar Belakang & Tujuan

Dari 2020 sampai 2026, banyak perusahaan global melakukan PHK karena dampak pandemi, penyesuaian jumlah karyawan setelah perekrutan besar, hingga efisiensi bisnis. Di proyek ini, data mentah dibersihkan menjadi dataset `Clean_Layoffs_Data` lalu divisualisasikan untuk menjawab empat pertanyaan utama:

1. Kapan lonjakan PHK global paling tinggi terjadi dan bagaimana polanya dari tahun ke tahun?
2. Industri mana yang paling banyak memangkas karyawan?
3. Negara mana yang menyumbang angka PHK terbesar?
4. Perusahaan apa saja yang paling banyak melakukan PHK dan di tahap pendanaan (*stage*) mana mereka berada?

## Ringkasan Metrik Utama (KPI)

| Metrik | Nilai | Keterangan |
| :--- | :--- | :--- |
| **Total Karyawan PHK** | 947.449 | Total karyawan terdampak selama 2020-2026 |
| **Perusahaan Terdampak** | 2.631 | Jumlah perusahaan unik yang tercatat melakukan PHK |
| **Rata-rata % PHK** | 39,86% | Rata-rata porsi pengurangan karyawan per kejadian PHK |
| **Negara Terdampak** | 62 | Jumlah negara yang tercatat di dalam dataset |

## Temuan Utama

### 1. Pola Tren PHK (2020-2026)
* **Awal 2020:** Terjadi lonjakan pertama di kisaran ~25 ribu karyawan per bulan saat awal pandemi, lalu sempat turun cukup stabil sepanjang 2021.
* **Akhir 2022 sampai Awal 2023:** Titik puncak PHK global, menembus kisaran ~90 ribu sampai 100 ribu karyawan dalam satu bulan pada awal 2023.
* **2024-2026:** Angkanya turun dibanding puncak 2023, tetapi PHK masih terjadi secara berkala di kisaran ~10 ribu sampai 35 ribu karyawan per bulan.

### 2. Industri Paling Terdampak
Di luar kategori umum (`Other`, ~117 ribu), PHK paling banyak terjadi di sektor:
* **Retail:** ~110 ribu
* **Hardware:** ~107 ribu
* **Consumer:** ~103 ribu
* **Transportation:** ~71 ribu & **Finance:** ~70 ribu

Empat sektor teratas sudah mencakup hampir setengah dari total PHK global, lalu disusul oleh sektor Food, Healthcare, Infrastructure, dan Travel.

### 3. Konsentrasi di Amerika Serikat
* Amerika Serikat menyumbang **670.039 karyawan** atau **70,7%** dari total PHK global.
* Posisi di bawahnya terpaut jauh: India (~70 ribu), Jerman (~32 ribu), Inggris (~25 ribu), Belanda (~22 ribu), Swedia (~21 ribu), Kanada (~17 ribu), Israel (~17 ribu), Brasil (~12 ribu), dan Australia (~9 ribu).

### 4. Dominasi Perusahaan Post-IPO
Sepuluh perusahaan teratas menyumbang **283.490 karyawan** (29,9% dari total global), dan semuanya berstatus **Post-IPO**. Artinya, lonjakan jumlah karyawan yang di-PHK paling besar datang dari perusahaan publik berskala raksasa. Sementara itu, angka rata-rata **39,86%** lebih banyak dipengaruhi oleh perusahaan yang lebih kecil karena sekali melakukan PHK, persentase karyawannya jauh lebih tinggi.

## Top 10 Perusahaan Terdampak PHK

| Peringkat | Perusahaan | Industri | Tahap (Stage) | Total PHK |
| :---: | :--- | :--- | :--- | :---: |
| 1 | Amazon | Retail | Post-IPO | 59.810 |
| 2 | Intel | Hardware | Post-IPO | 43.167 |
| 3 | Meta | Consumer | Post-IPO | 35.700 |
| 4 | Microsoft | Other | Post-IPO | 35.355 |
| 5 | Dell | Hardware | Post-IPO | 23.650 |
| 6 | Oracle | Other | Post-IPO | 22.294 |
| 7 | Cisco | Infrastructure | Post-IPO | 18.521 |
| 8 | Salesforce | Sales | Post-IPO | 16.744 |
| 9 | Tesla | Transportation | Post-IPO | 14.500 |
| 10 | Google | Consumer | Post-IPO | 13.749 |

## Komponen Dashboard

Dashboard di Google Looker Studio disusun agar data bisa difilter dan dibaca dengan cepat:
* **Filter Interaktif:** Filter untuk Rentang Tanggal, Industri (`industry`), dan Negara (`country`).
* **4 Scorecard KPI:** Menampilkan total karyawan PHK, jumlah perusahaan terdampak, rata-rata persentase PHK, dan jumlah negara.
* **4 Visualisasi Utama (Grid 2x2):**
  1. *Line Chart* tren PHK bulanan (2020-2026) berdasarkan `Year Month`.
  2. *Horizontal Bar Chart* Top 10 Industri terdampak.
  3. *Horizontal Bar Chart* Top 10 Negara dengan PHK tertinggi.
  4. Tabel peringkat Top 10 Perusahaan beserta industri dan tahap pendanaannya.

## Alur Pengerjaan

1. **Data Cleaning (MySQL / DBeaver):**
   * Menghapus baris duplikat menggunakan *window function* `ROW_NUMBER()`.
   * Merapikan teks (menghapus spasi berlebih serta menyeragamkan penulisan nama industri dan negara).
   * Mengubah format tanggal ke tipe `DATE`.
   * Menangani nilai kosong (`NULL` dan *blank*) pada kolom metrik utama.
2. **Validasi Data (Microsoft Excel / Google Sheets):**
   * Mengecek ulang tipe data numerik (`total_laid_off`, `percentage_laid_off`) dan memastikan dataset bersih (`Clean_Layoffs_Data`) siap diimpor ke Looker Studio.
3. **Visualisasi (Google Looker Studio):**
   * Merancang tata letak bersih dengan label angka langsung pada grafik dan menonaktifkan pengelompokan otomatis kategori "Lainnya" supaya urutan Top 10 tetap akurat.
