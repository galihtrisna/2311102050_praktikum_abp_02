<?php
$mahasiswa = [
    [
        "nama" => "Galih",
        "nim" => "2311102050",
        "tugas" => 85,
        "uts" => 80,
        "uas" => 90
    ],
    [
        "nama" => "Trisna",
        "nim" => "2311102051",
        "tugas" => 60,
        "uts" => 65,
        "uas" => 55
    ],
    [
        "nama" => "Galih Trisna",
        "nim" => "2311102052",
        "tugas" => 75,
        "uts" => 78,
        "uas" => 72
    ]
];

function hitungNilaiAkhir($tugas, $uts, $uas) {
    return ($tugas * 0.3) + ($uts * 0.3) + ($uas * 0.4);
}

function menentukanGrade($nilaiAkhir) {
    if ($nilaiAkhir >= 80) return "A";
    elseif ($nilaiAkhir >= 70) return "B";
    elseif ($nilaiAkhir >= 60) return "C";
    elseif ($nilaiAkhir >= 50) return "D";
    else return "E";
}

function menentukanStatus($nilaiAkhir) {
    return ($nilaiAkhir >= 60) ? "Lulus" : "Tidak Lulus";
}

$totalNilaiKelas = 0;
$nilaiTertinggi = 0;
$jumlahMahasiswa = count($mahasiswa);
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistem Penilaian Mahasiswa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .boxx {
            border: 3px solid #000;
            box-shadow: 6px 6px 0px #000;
        }
    </style>
</head>
<body class="text-dark">

<div class="container mt-5 mb-4">
    
    <div class="boxx rounded-5 p-4 mb-4 text-center" style="background-color: #ff66c4;">
        <h2 class="fw-bold text-dark mb-1">📝 Data Penilaian Mahasiswa</h2>
        <p class="mb-0 fw-bold text-dark">Praktikum ABP - Pertemuan 3</p>
    </div>

    <div class="boxx rounded-4 bg-white mb-4 overflow-hidden">
        <div class="table-responsive">
            <table class="table table-borderless text-center align-middle mb-0">
                <thead class="table-dark">
                    <tr>
                        <th class="py-3">No</th>
                        <th class="py-3">Nama</th>
                        <th class="py-3">NIM</th>
                        <th class="py-3">Nilai Akhir</th>
                        <th class="py-3">Grade</th>
                        <th class="py-3">Status</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $no = 1;
                    foreach ($mahasiswa as $mhs) {
                        $nilaiAkhir = hitungNilaiAkhir($mhs['tugas'], $mhs['uts'], $mhs['uas']);
                        $grade = menentukanGrade($nilaiAkhir);
                        $status = menentukanStatus($nilaiAkhir);

                        $totalNilaiKelas += $nilaiAkhir;
                        if ($nilaiAkhir > $nilaiTertinggi) $nilaiTertinggi = $nilaiAkhir;

                        $badgeBg = ($status == "Lulus") ? "bg-success" : "bg-danger";

                        $borderBottom = ($no < $jumlahMahasiswa) ? "border-bottom border-dark border-2" : "";

                        echo "<tr class='{$borderBottom}'>";
                        echo "<td class='py-3'><strong>{$no}</strong></td>";
                        echo "<td class='text-start py-3'>{$mhs['nama']}</td>";
                        echo "<td class='py-3'>{$mhs['nim']}</td>";
                        echo "<td class='py-3 fw-bold fs-5'>" . number_format($nilaiAkhir, 1) . "</td>";
                        echo "<td class='py-3 fw-bold fs-5'>{$grade}</td>";
                        echo "<td class='py-3'><span class='badge rounded-pill border border-dark text-white {$badgeBg} px-3 py-2'>{$status}</span></td>";
                        echo "</tr>";
                        
                        $no++;
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>

    <?php $rataRataKelas = $totalNilaiKelas / $jumlahMahasiswa; ?>

    <div class="row g-4">
        <div class="col-md-6">
            <div class="boxx rounded-5 bg-warning h-100 p-4 text-center">
            <h5 class="fw-bold mb-2 text-dark">Rata-rata Kelas</h5>
                <h1 class="display-5 fw-bolder text-dark m-0"><?php echo number_format($rataRataKelas, 1); ?></h1>
            </div>
        </div>
        <div class="col-md-6">
            <div class="boxx rounded-5 bg-info h-100 p-4 text-center">
                <h5 class="fw-bold mb-2 text-dark">Nilai Tertinggi</h5>
                <h1 class="display-5 fw-bolder text-dark m-0"><?php echo number_format($nilaiTertinggi, 1); ?></h1>
            </div>
        </div>
    </div>

</div>

<footer class="text-center mt-5 mb-4">
    <span class="boxx bg-white px-4 py-2 rounded-pill fw-bold" style="font-size: 0.9rem;">
        GALIH TRISNA - 2311102050
    </span>
</footer>

</body>
</html>

