CREATE TABLE aggregate_table (
	SELECT *, (jumlah_barang * harga) AS total_harga
	FROM base_table
	)