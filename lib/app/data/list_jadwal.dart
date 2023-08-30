
class ListJadwal {
  List<List<Waktu>> jadwal = [
    [
      Waktu(
          batasAtas: '15.00',
          batasBawah: '10.00',
          title: 'Kuliah Struktur Data',
          deskripsi:
              'Kuliahini adalah kuliah struktur data dimana dosen pengampunya adlah saya')
    ],[
      Waktu(
          batasAtas: '17.00',
          batasBawah: '15.00',
          title: 'Kuliah Kalkulus',
          deskripsi:
              'Kuliahini adalah kuliah kalkulus dimana dosen pengampunya adlah saya')
    ],[
      Waktu(
          batasAtas: '12.10',
          batasBawah: '10.00',
          title: 'Kuliah Basis data',
          deskripsi:
              'Kuliahini adalah kuliah basis data dimana dosen pengampunya adlah saya')
    ],[
      Waktu(
          batasAtas: '13.10',
          batasBawah: '12.00',
          title: 'Kuliah Kombinatorika',
          deskripsi:
              'Kuliahini adalah kuliah Kombinatorika dimana dosen pengampunya adlah saya')
    ],[
      Waktu(
          batasAtas: '19.10',
          batasBawah: '15.00',
          title: 'Kuliah geometri',
          deskripsi:
              'Kuliahini adalah kuliah geomertri dimana dosen pengampunya adlah saya')
    ],[
      Waktu(
          batasAtas: '20.00',
          batasBawah: '17.00',
          title: 'Kuliah Struktur aljabar',
          deskripsi:
              'Kuliahini adalah kuliah struktur aljabar dimana dosen pengampunya adlah saya')
    ],[
      Waktu(
          batasAtas: '23.10',
          batasBawah: '19.00',
          title: 'Kuliah Aljabar linier',
          deskripsi:
              'Kuliahini adalah kuliah aljabar linier dimana dosen pengampunya adlah saya')
    ]
  ];
}

class Waktu {
  String batasBawah;
  String batasAtas;
  String title;
  String deskripsi;
  Waktu(
      {required this.batasAtas,
      required this.batasBawah,
      required this.title,
      required this.deskripsi});
}
