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

### Alur Penggunaan Website

1. **Proses Registrasi**  
     Pada tahap ini, pengguna mengisi informasi registrasi, seperti nama, email, kata sandi, dan konfirmasi kata sandi. Data yang telah diisi akan dikirim ke server untuk disimpan dalam database. Berikut kode untuk mengirimkan data:

     ```dart
     RegistrasiBloc.registrasi(
       nama: _namaTextboxController.text,
       email: _emailTextboxController.text,
       password: _passwordTextboxController.text
     );
     ```
     ![Tampilan Pop Up Registrasi Berhasil](./p5_1.jpg)  
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
     ![Tampilan Input Login](./p5_2.jpg)  
     Pengguna memasukkan email dan kata sandi pada form login. Data tersebut dikirim ke API untuk proses autentikasi. Contoh kodenya:

     ```dart
     LoginBloc.login(
       email: _emailTextboxController.text,
       password: _passwordTextboxController.text
     );
     ```

   - b. **Pop-up Login Gagal**  
     ![Tampilan Pop Up Login Gagal](./p5_3.jpg)  
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

3. **Proses Menambah Produk Baru**  
   - a. **Input Data Produk**  
     ![Tampilan Input Tambah Data Produk](./p5_4.jpg)  
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
     ![Tampilan Produk Berhasil Ditambahkan](./p5_5.jpg)  
     Notifikasi akan muncul setelah produk berhasil ditambahkan ke dalam database.

4. **Proses Melihat Detail Produk**  
   - a. **Melihat Detail Produk**  
     ![Tampilan Detail Produk](./p5_6.jpg)  
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
     ![Tampilan Input Ubah Produk](./p5_7.jpg)  
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
     Menampilkan notifikasi bahwa produk berhasil diubah.

6. **Proses Menghapus Produk**  
   - a. **Konfirmasi Hapus Produk**  
     ![Tampilan Konfirmasi Hapus Produk](./p5_9.jpg)  
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
     Menampilkan notifikasi bahwa produk telah berhasil dihapus dari database.

7. **Proses Logout**  
   - a. **Tombol Logout**  
     ![Tampilan Tombol Logout](./p5_9.jpg)  
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
