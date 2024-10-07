# Pertemuan 4
Nama : Kintan Kinasih Mahaputri

NIM : H1D022019

Shift : A

# ScreenShoot
1. Login
![Screenshoot 1](k1.jpg)
2. Ubah Produk
![Screenshoot 2](k2.jpg)
3. Detail Produk
![Screenshoot 3](k3.jpg)
4. Registrasi
![Screenshoot 4](k4.jpg)
5. Tambah Produk
![Screenshoot 5](k5.jpg)
6. List Produk
![Screenshoot 6](k6.jpg)


### Pertemuan 5

1. **Tampilan Halaman Login**  
   ![Tampilan Halaman Login](./p5_1.jpg)  
   Menampilkan halaman login tempat pengguna memasukkan email dan kata sandi untuk masuk ke aplikasi.

2. **Tampilan Halaman Registrasi**  
   ![Tampilan Halaman Registrasi](./p5_2.jpg)  
   Menunjukkan halaman registrasi di mana pengguna dapat mendaftarkan akun baru dengan mengisi informasi seperti nama, email, dan kata sandi.

3. **Tampilan Halaman Logout**  
   ![Tampilan Halaman Logout](./p5_3.jpg)  
   Halaman logout yang ditampilkan saat pengguna keluar dari aplikasi.

4. **Tampilan Halaman Detail Produk**  
   ![Tampilan Halaman Detail Produk](./p5_4.jpg)  
   Menampilkan detail produk seperti nama, deskripsi, dan harga setelah pengguna memilih salah satu produk dari daftar.

5. **Tampilan Halaman Daftar Produk**  
   ![Tampilan Halaman Daftar Produk](./p5_5.jpg)  
   Menunjukkan daftar produk yang tersedia di toko.

6. **Tampilan Halaman Tambah Produk**  
   ![Tampilan Halaman Tambah Produk](./p5_6.jpg)  
   Halaman ini memungkinkan pengguna menambahkan produk baru dengan mengisi kode, nama, dan harga produk.

7. **Tampilan Halaman Ubah Produk**  
   ![Tampilan Halaman Ubah Produk](./p5_7.jpg)  
   Menampilkan form untuk mengedit data produk yang ada seperti nama, kode, dan harga produk.

### Alur Penggunaan Website Toko Kita Khansa

1. **Proses Registrasi**  
   - a. **Input Data untuk Registrasi**  
     ![Tampilan Input Registrasi](./p5_8.jpg)  
     Pada tahap ini, pengguna mengisi informasi registrasi, seperti nama, email, kata sandi, dan konfirmasi kata sandi. Data yang telah diisi akan dikirim ke server untuk disimpan dalam database. Berikut kode untuk mengirimkan data:

     ```dart
     RegistrasiBloc.registrasi(
       nama: _namaTextboxController.text,
       email: _emailTextboxController.text,
       password: _passwordTextboxController.text
     );
     ```

   - b. **Pop-up Registrasi Berhasil**  
     ![Tampilan Pop Up Registrasi Berhasil](./p5_9.jpg)  
     Setelah proses registrasi selesai, pengguna akan melihat pop-up notifikasi yang menandakan bahwa pendaftaran berhasil. Berikut contoh kode untuk menampilkan pop-up:

     ```dart
     showDialog(
       context: context,
       barrierDismissible: false,
       builder: (BuildContext context) => SuccessDialog(
         description: "Registrasi berhasil, silahkan login",
         okClick: () { Navigator.pop(context); }
       )
     );
     ```

2. **Proses Login**  
   - a. **Input Data untuk Login**  
     ![Tampilan Input Login](./inputlogin.jpg)  
     Pengguna memasukkan email dan kata sandi pada form login. Data tersebut dikirim ke API untuk proses autentikasi. Contoh kodenya:

     ```dart
     LoginBloc.login(
       email: _emailTextboxController.text,
       password: _passwordTextboxController.text
     );
     ```

   - b. **Pop-up Login Gagal**  
     ![Tampilan Pop Up Login Gagal](./popupgagallogin.jpg)  
     Jika login gagal (misalnya, jika email atau kata sandi salah), pop-up notifikasi akan muncul untuk memberi tahu pengguna bahwa login gagal. Berikut kodenya:

     ```dart
     showDialog(
       context: context,
       barrierDismissible: false,
       builder: (BuildContext context) => WarningDialog(
         description: "Login gagal, silahkan coba lagi",
       )
     );
     ```

   - c. **Login Berhasil**  
     ![Tampilan Berhasil Login](./listproduk.jpg)  
     Jika login berhasil, pengguna akan diarahkan ke halaman daftar produk:

     ```dart
     Navigator.pushReplacement(
       context,
       MaterialPageRoute(builder: (context) => const ProdukPage())
     );
     ```

3. **Proses Menambah Produk Baru**  
   - a. **Input Data Produk**  
     ![Tampilan Input Tambah Data Produk](./inputtambahdata.jpg)  
     Pengguna dapat menambahkan produk baru dengan mengisi informasi seperti kode produk, nama, dan harga. Data ini akan dikirim ke server dan disimpan di database. Contoh kodenya:

     ```dart
     ProdukBloc.addProduk(
       produk: Produk(
         kodeProduk: _kodeProdukController.text,
         namaProduk: _namaProdukController.text,
         hargaProduk: int.parse(_hargaProdukController.text)
       )
     );
     ```

   - b. **Produk Berhasil Ditambahkan**  
     ![Tampilan Produk Berhasil Ditambahkan](./berhasiltambahdata.jpg)  
     Notifikasi akan muncul setelah produk berhasil ditambahkan ke dalam database.

4. **Proses Melihat Detail Produk**  
   - a. **Melihat Detail Produk**  
     ![Tampilan Detail Produk](./detailproduk.jpg)  
     Pengguna dapat melihat detail dari suatu produk dengan mengklik produk tersebut di daftar produk. Berikut adalah cara navigasi ke halaman detail produk:

     ```dart
     Navigator.push(
       context,
       MaterialPageRoute(
         builder: (context) => ProdukDetail(produk: produk)
       )
     );
     ```

5. **Proses Mengubah Produk**  
   - a. **Input Data Ubah Produk**  
     ![Tampilan Input Ubah Produk](./ubahproduk.jpg)  
     Pengguna dapat mengedit informasi produk, seperti nama, kode, atau harga produk, kemudian menyimpan perubahan tersebut ke database. Berikut kodenya:

     ```dart
     ProdukBloc.updateProduk(
       produk: Produk(
         id: produk.id,
         kodeProduk: _kodeProdukController.text,
         namaProduk: _namaProdukController.text,
         hargaProduk: int.parse(_hargaProdukController.text)
       )
     );
     ```

   - b. **Produk Berhasil Diubah**  
     ![Tampilan Produk Berhasil Diubah](./berhasilubahproduk.jpg)  
     Menampilkan notifikasi bahwa produk berhasil diubah.

6. **Proses Menghapus Produk**  
   - a. **Konfirmasi Hapus Produk**  
     ![Tampilan Konfirmasi Hapus Produk](./hapusproduk.jpg)  
     Saat pengguna menekan tombol hapus, sistem akan menampilkan dialog konfirmasi untuk memastikan apakah pengguna ingin menghapus produk tersebut. Contoh kodenya:

     ```dart
     showDialog(
       context: context,
       builder: (BuildContext context) => AlertDialog(
         content: const Text("Yakin ingin menghapus produk ini?"),
         actions: [
           OutlinedButton(
             child: const Text("Ya"),
             onPressed: () {
               ProdukBloc.deleteProduk(id: produk.id);
               Navigator.pop(context);
             }
           ),
           OutlinedButton(
             child: const Text("Batal"),
             onPressed: () => Navigator.pop(context),
           )
         ]
       )
     );
     ```

   - b. **Produk Berhasil Dihapus**  
     ![Tampilan Produk Berhasil Dihapus](./berhasilhapusproduk.jpg)  
     Menampilkan notifikasi bahwa produk telah berhasil dihapus dari database.

7. **Proses Logout**  
   - a. **Tombol Logout**  
     ![Tampilan Tombol Logout](./logout.jpg)  
     Pengguna dapat keluar dari aplikasi dengan menekan tombol logout. Ini akan menghapus sesi pengguna dan mengarahkan kembali ke halaman login. Berikut adalah kodenya:

     ```dart
     ListTile(
       title: const Text('Logout'),
       onTap: () async {
         await LogoutBloc.logout();
         Navigator.pushAndRemoveUntil(
           context,
           MaterialPageRoute(builder: (context) => LoginPage()),
           (route) => false
         );
       }
     );
     ```
