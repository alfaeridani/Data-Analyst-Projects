CREATE TABLE base_table (
	WITH penjualan_baru AS (
		SELECT id_invoice, id_customer, id_barang, tanggal, jumlah_barang
		FROM penjualan
		UNION DISTINCT
		SELECT id_invoice, id_customer, id_barang, tanggal, jumlah_barang
		FROM penjualan_ds
		)

	SELECT
	pen.id_invoice,
	pen.id_customer,
	pen.id_barang,
	pel.id_cabang_sales,
	pel.nama,
	pel.cabang_sales,
	pel.group,
	bar.kode_lini,
	bar.lini,
	pel_ds.id_distributor,
	bar.nama_barang,
	str_to_date(pen.tanggal, '%m/%d/%Y') as tanggal,
	pen.jumlah_barang,
	bar.kemasan,
	bar_ds.harga
	FROM penjualan_baru AS pen
	LEFT JOIN pelanggan AS pel
	ON pen.id_customer = pel.id_customer
	LEFT JOIN barang AS bar
	ON pen.id_barang = bar.kode_barang
	LEFT JOIN pelanggan_ds AS pel_ds
	ON pen.id_customer = pel_ds.id_customer
	LEFT JOIN barang_ds AS bar_ds
	ON pen.id_barang = bar_ds.kode_barang
	ORDER BY id_invoice
)