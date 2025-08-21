# Evilginx2

Evilginx2 là một framework man-in-the-middle (MITM) dùng để kiểm tra bảo mật, mô phỏng tấn công phishing và thu thập thông tin xác thực đa yếu tố (2FA) một cách hợp pháp cho mục đích nghiên cứu.

## Yêu cầu hệ thống

- Go >= 1.22
- Hệ điều hành: Linux, Windows, macOS
- Quyền root/administrator (để bind cổng 80/443)

## Cài đặt

1. **Clone source code:**

   ```sh
   git clone https://github.com/kgretzky/evilginx2.git
   cd evilginx2
   ```

2. **Cài đặt Go modules:**

   ```sh
   go mod download
   ```

3. **Build project:**

   - Trên Windows:
     ```sh
     build.bat
     ```
   - Trên Linux/macOS:
     ```sh
     make
     ```

   File thực thi sẽ nằm trong thư mục `build/`.

## Chạy Evilginx2

```sh
./build/evilginx
```

**Tham số tùy chọn:**

- `-p <phishlets_dir>`: Đường dẫn thư mục phishlets
- `-t <redirectors_dir>`: Đường dẫn thư mục redirectors
- `-c <config_dir>`: Đường dẫn thư mục cấu hình
- `-debug`: Bật debug log
- `-developer`: Chế độ developer (tạo chứng chỉ tự ký)
- `-v`: Hiển thị phiên bản

Ví dụ:

```sh
./build/evilginx -p ./phishlets -t ./redirectors -debug
```

## Sử dụng cơ bản

1. **Tải phishlet:**

   ```
   phishlets hostname <tên_phishlet> <tên_miền>
   phishlets enable <tên_phishlet>
   ```

2. **Kiểm tra trạng thái:**

   ```
   lures
   ```

3. **Xem session:**

   ```
   sessions
   ```

4. **Các lệnh khác:**
   - `help`: Xem danh sách lệnh
   - `exit`: Thoát chương trình

## Thư mục quan trọng

- `phishlets/`: Chứa các phishlet (.yaml)
- `redirectors/`: Chứa các trang redirect mẫu
- `core/`: Mã nguồn chính
- `build/`: Chứa file thực thi sau khi build

## Lưu ý

- Evilginx2 chỉ nên sử dụng cho mục đích hợp pháp, kiểm thử bảo mật và nghiên cứu.
- Không sử dụng cho mục đích xấu hoặc tấn công trái phép.
  Evilginx2
  Evilginx2 là một framework man-in-the-middle (MITM) dùng để kiểm tra bảo mật, mô phỏng tấn công phishing và thu thập thông tin xác thực đa yếu tố (2FA) một cách hợp pháp cho mục đích nghiên cứu.

Yêu cầu hệ thống
Go >= 1.22
Hệ điều hành: Linux, Windows, macOS
Quyền root/administrator (để bind cổng 80/443)
Cài đặt
Clone source code:

Cài đặt Go modules:

Build project:

Trên Windows:
Trên Linux/macOS:
File thực thi sẽ nằm trong thư mục build/.

Chạy Evilginx2
Tham số tùy chọn:

-p <phishlets_dir>: Đường dẫn thư mục phishlets
-t <redirectors_dir>: Đường dẫn thư mục redirectors
-c <config_dir>: Đường dẫn thư mục cấu hình
-debug: Bật debug log
-developer: Chế độ developer (tạo chứng chỉ tự ký)
-v: Hiển thị phiên bản
Ví dụ:

Sử dụng cơ bản
Tải phishlet:

Kiểm tra trạng thái:

Xem session:

Các lệnh khác:

help: Xem danh sách lệnh
exit: Thoát chương trình
Thư mục quan trọng
phishlets: Chứa các phishlet (.yaml)
redirectors: Chứa các trang redirect mẫu
core: Mã nguồn chính
build/: Chứa file thực thi sau khi build
Lưu ý
Evilginx2 chỉ nên sử dụng cho mục đích hợp pháp, kiểm thử bảo mật và nghiên cứu.
Không sử dụng cho mục đích xấu hoặc tấn công trái phép.
