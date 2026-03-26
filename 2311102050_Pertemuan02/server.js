const express = require("express");
const app = express();
const PORT = 3000;

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(express.static("public"));

let dataInventaris = [
  {
    id: 1679800000001,
    kode: "INV-001",
    nama: "Meja Kerja",
    kategori: "Furniture",
    jumlah: 5,
  },
  {
    id: 1679800000002,
    kode: "INV-002",
    nama: "Lemari Arsip Aluminium",
    kategori: "Penyimpanan",
    jumlah: 2,
  },
  {
    id: 1679800000003,
    kode: "INV-003",
    nama: "Kursi Kantor Ergonomis",
    kategori: "Furniture",
    jumlah: 10,
  },
  {
    id: 1679800000004,
    kode: "INV-004",
    nama: "Rak Besi Gudang",
    kategori: "Penyimpanan",
    jumlah: 3,
  },
  {
    id: 1679800000005,
    kode: "INV-005",
    nama: "Printer LaserJet",
    kategori: "Elektronik",
    jumlah: 2,
  },
  {
    id: 1679800000006,
    kode: "INV-006",
    nama: "AC Split 1 PK",
    kategori: "Elektronik",
    jumlah: 4,
  },
  {
    id: 1679800000007,
    kode: "INV-007",
    nama: "Whiteboard Magnetik",
    kategori: "Peralatan Kantor",
    jumlah: 2,
  },
  {
    id: 1679800000008,
    kode: "INV-008",
    nama: "Proyektor Epson",
    kategori: "Elektronik",
    jumlah: 1,
  },
];

app.get("/api/inventaris", (req, res) => {
  res.json({ data: dataInventaris });
});

app.post("/tambah", (req, res) => {
  const newData = {
    id: Date.now(),
    kode: req.body.kode,
    nama: req.body.nama,
    kategori: req.body.kategori,
    jumlah: parseInt(req.body.jumlah),
  };
  dataInventaris.push(newData);
  res.redirect("/data.html");
});

app.get("/hapus/:id", (req, res) => {
  const id = parseInt(req.params.id);
  dataInventaris = dataInventaris.filter((barang) => barang.id !== id);
  res.redirect("/data.html");
});

app.put("/api/inventaris/:id", (req, res) => {
  const id = parseInt(req.params.id);
  const index = dataInventaris.findIndex((barang) => barang.id === id);

  if (index !== -1) {
    dataInventaris[index] = {
      id: id,
      kode: req.body.kode,
      nama: req.body.nama,
      kategori: req.body.kategori,
      jumlah: parseInt(req.body.jumlah),
    };
    res.json({ message: "Data berhasil diupdate" });
  } else {
    res.status(404).json({ message: "Barang tidak ditemukan" });
  }
});

app.listen(PORT, () => {
  console.log(`Hore! Buka di http://localhost:${PORT}`);
});
