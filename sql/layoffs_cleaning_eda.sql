USE portofolio_layoffs;

-- 1. Ringkasan KPI keseluruhan dan rentang periode data
SELECT
    MIN(`date`) AS tanggal_awal,
    MAX(`date`) AS tanggal_akhir,
    COUNT(DISTINCT company) AS total_perusahaan,
    COUNT(DISTINCT country) AS total_negara,
    ROUND(SUM(total_laid_off), 0) AS total_karyawan_phk,
    ROUND(AVG(percentage_laid_off) * 100, 2) AS rata_rata_persen_phk
FROM clean_layoffs;

-- 2. Top 10 perusahaan dengan total PHK kumulatif terbanyak
SELECT
    company,
    MAX(industry) AS industri,
    MAX(country) AS negara,
    COUNT(*) AS gelombang_phk,
    ROUND(SUM(total_laid_off), 0) AS total_phk
FROM clean_layoffs
WHERE total_laid_off IS NOT NULL
GROUP BY company
ORDER BY total_phk DESC
LIMIT 10;

-- 3. Top 10 sektor industri paling terdampak PHK
SELECT
    COALESCE(industry, 'Unknown') AS industri,
    COUNT(DISTINCT company) AS jumlah_perusahaan,
    ROUND(SUM(total_laid_off), 0) AS total_phk,
    ROUND(AVG(percentage_laid_off) * 100, 2) AS rata_rata_persen_phk
FROM clean_layoffs
WHERE total_laid_off IS NOT NULL
GROUP BY COALESCE(industry, 'Unknown')
ORDER BY total_phk DESC
LIMIT 10;

-- 4. Top 10 negara dengan jumlah PHK terbanyak
SELECT
    country AS negara,
    COUNT(DISTINCT company) AS jumlah_perusahaan,
    ROUND(SUM(total_laid_off), 0) AS total_phk
FROM clean_layoffs
WHERE total_laid_off IS NOT NULL
  AND country IS NOT NULL
GROUP BY country
ORDER BY total_phk DESC
LIMIT 10;

-- 5. Tren gelombang PHK tahunan dan kontribusi persentasenya (CTE + Window Function)
WITH yearly_layoffs AS (
    SELECT
        YEAR(`date`) AS tahun,
        COUNT(*) AS jumlah_kejadian,
        ROUND(SUM(total_laid_off), 0) AS total_phk
    FROM clean_layoffs
    WHERE `date` IS NOT NULL
      AND total_laid_off IS NOT NULL
    GROUP BY YEAR(`date`)
)
SELECT
    tahun,
    jumlah_kejadian,
    total_phk,
    ROUND(total_phk * 100.0 / SUM(total_phk) OVER (), 2) AS porsi_persen
FROM yearly_layoffs
ORDER BY tahun ASC;

-- 6. Dampak PHK berdasarkan tahap pendanaan perusahaan (Stage)
SELECT
    COALESCE(stage, 'Unknown') AS tahap_pendanaan,
    COUNT(DISTINCT company) AS jumlah_perusahaan,
    ROUND(SUM(total_laid_off), 0) AS total_phk,
    ROUND(AVG(funds_raised), 1) AS rata_rata_dana_juta_usd
FROM clean_layoffs
WHERE total_laid_off IS NOT NULL
GROUP BY COALESCE(stage, 'Unknown')
ORDER BY total_phk DESC
LIMIT 10;

-- 7. Top 10 perusahaan dengan pendanaan terbesar yang mengalami PHK 100% (tutup total)
SELECT
    company,
    industry,
    country,
    `date` AS tanggal_phk,
    ROUND(total_laid_off, 0) AS total_phk,
    funds_raised AS dana_terhimpun_juta_usd
FROM clean_layoffs
WHERE percentage_laid_off = 1
  AND funds_raised IS NOT NULL
ORDER BY funds_raised DESC
LIMIT 10;
