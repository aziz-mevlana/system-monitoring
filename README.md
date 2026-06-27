# Real-Time System Monitoring & Load Testing Automation

Bu proje; sistem gözlemlenebilirliği (observability) ve izleme (monitoring) temellerini kavramak amacıyla, real-time performans takip aracı olan **Netdata**'nın bir Linux sunucusuna otomatik kurulumunu, altyapının yük altında test edilmesini ve süreçlerin kabuk betikleri (Shell Scripts) ile otomatize edilmesini içerir.

##️ Otomasyon Scriptleri ve Mimarisi

Sürecin insan hatasından bağımsız, tekrarlanabilir ve kararlı (idempotent) olabilmesi için 3 temel script yazılmıştır:

1. **`setup.sh`**: Netdata ajanını bağımlılıklarıyla birlikte uzak sunucuya sessiz modda kurar, servis yönetimini (`systemctl`) yapılandırır ve başlatır.
2. **`test_dashboard.sh`**: `openssl speed` mimarisini kullanarak sunucu işlemci çekirdeklerine kontrollü olarak 60 saniye boyunca %100 yapay yük bindirir. Sadece ana süreci (parent) değil, doğabilecek tüm alt süreç ağacını (child/orphan processes) temizleyecek şekilde güvenli sonlandırma mimarisine sahiptir. Bu sayede paneldeki alarm eşik değerleri test edilir.
3. **`cleanup.sh`**: Testler bittikten sonra sunucu üzerinde hiçbir çöp veri ve bağımlılık bırakmadan Netdata mimarisini tamamen sistemden kazır.

---

##️ Proje Klasör Yapısı

```text
system-monitoring/
├── setup.sh           # Netdata Otomatik Kurulum Betiği
├── test_dashboard.sh  # Çoklu Çekirdek Güvenli Yük Testi Betiği
├── cleanup.sh         # Sistem Temizlik ve Kaldırma Betiği
└── README.md          # Proje Dokümantasyonu
