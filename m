Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:54304 "EHLO
	relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933014AbbENPga (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 14 May 2015 11:36:30 -0400
Date: Thu, 14 May 2015 08:36:20 -0700
From: Josh Triplett <josh@joshtriplett.org>
Subject: [PATCH 5/5] init/Kconfig.expert: Factor out "if EXPERT" conditions
 using showif
Message-ID: <ab1a7c88d2a6603458bec1f1817ec48fd325c60b.1431589089.git.josh@joshtriplett.org>
References: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431589089.git.josh@joshtriplett.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431589089.git.josh@joshtriplett.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Michal Hocko <mhocko@suse.cz>, Josh Triplett <josh@joshtriplett.org>, Vladimir Davydov <vdavydov@parallels.com>, Johannes Weiner <hannes@cmpxchg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Andy Lutomirski <luto@amacapital.net>, Bertrand Jacquin <beber@meleeweb.net>, "Luis R. Rodriguez" <mcgrof@suse.com>, Iulia Manda <iulia.manda21@gmail.com>, Pranith Kumar <bobby.prani@gmail.com>, Clark Williams <clark.williams@gmail.com>, Mel Gorman <mgorman@suse.de>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Use the new showif construct to simplify the expert menu.  Now, making a
symbol no longer invisible when !EXPERT requires moving it out of the
EXPERT menu, which makes it more difficult to break the EXPERT menu.

Signed-off-by: Josh Triplett <josh@joshtriplett.org>
Acked-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
---
 init/Kconfig.expert | 44 ++++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/init/Kconfig.expert b/init/Kconfig.expert
index c84a372..fb3c3aa 100644
--- a/init/Kconfig.expert
+++ b/init/Kconfig.expert
@@ -8,15 +8,17 @@ menuconfig EXPERT
           environments which can tolerate a "non-standard" kernel.
           Only use this if you really know what you are doing.
 
+showif EXPERT
+
 config UID16
-	bool "Enable 16-bit UID system calls" if EXPERT
+	bool "Enable 16-bit UID system calls"
 	depends on HAVE_UID16 && MULTIUSER
 	default y
 	help
 	  This enables the legacy 16-bit UID syscall wrappers.
 
 config MULTIUSER
-	bool "Multiple users, groups and capabilities support" if EXPERT
+	bool "Multiple users, groups and capabilities support"
 	default y
 	help
 	  This option enables support for non-root users, groups and
@@ -30,7 +32,7 @@ config MULTIUSER
 	  If unsure, say Y here.
 
 config SGETMASK_SYSCALL
-	bool "sgetmask/ssetmask syscalls support" if EXPERT
+	bool "sgetmask/ssetmask syscalls support"
 	def_bool PARISC || MN10300 || BLACKFIN || M68K || PPC || MIPS || X86 || SPARC || CRIS || MICROBLAZE || SUPERH
 	---help---
 	  sys_sgetmask and sys_ssetmask are obsolete system calls
@@ -40,7 +42,7 @@ config SGETMASK_SYSCALL
 	  If unsure, leave the default option here.
 
 config SYSFS_SYSCALL
-	bool "Sysfs syscall support" if EXPERT
+	bool "Sysfs syscall support"
 	default y
 	---help---
 	  sys_sysfs is an obsolete system call no longer supported in libc.
@@ -50,7 +52,7 @@ config SYSFS_SYSCALL
 	  If unsure say Y here.
 
 config SYSCTL_SYSCALL
-	bool "Sysctl syscall support" if EXPERT
+	bool "Sysctl syscall support"
 	depends on PROC_SYSCTL
 	default n
 	select SYSCTL
@@ -67,7 +69,7 @@ config SYSCTL_SYSCALL
 	  If unsure say N here.
 
 config KALLSYMS
-	 bool "Load all symbols for debugging/ksymoops" if EXPERT
+	 bool "Load all symbols for debugging/ksymoops"
 	 default y
 	 help
 	   Say Y here to let the kernel print out symbolic crash information and
@@ -93,7 +95,7 @@ config KALLSYMS_ALL
 
 config PRINTK
 	default y
-	bool "Enable support for printk" if EXPERT
+	bool "Enable support for printk"
 	select IRQ_WORK
 	help
 	  This option enables normal printk support. Removing it
@@ -103,7 +105,7 @@ config PRINTK
 	  strongly discouraged.
 
 config BUG
-	bool "BUG() support" if EXPERT
+	bool "BUG() support"
 	default y
 	help
           Disabling this option eliminates support for BUG and WARN, reducing
@@ -115,13 +117,13 @@ config BUG
 config ELF_CORE
 	depends on COREDUMP
 	default y
-	bool "Enable ELF core dumps" if EXPERT
+	bool "Enable ELF core dumps"
 	help
 	  Enable support for generating core dumps. Disabling saves about 4k.
 
 
 config PCSPKR_PLATFORM
-	bool "Enable PC-Speaker support" if EXPERT
+	bool "Enable PC-Speaker support"
 	depends on HAVE_PCSPKR_PLATFORM
 	select I8253_LOCK
 	default y
@@ -131,14 +133,14 @@ config PCSPKR_PLATFORM
 
 config BASE_FULL
 	default y
-	bool "Enable full-sized data structures for core" if EXPERT
+	bool "Enable full-sized data structures for core"
 	help
 	  Disabling this option reduces the size of miscellaneous core
 	  kernel data structures. This saves memory on small machines,
 	  but may reduce performance.
 
 config FUTEX
-	bool "Enable futex support" if EXPERT
+	bool "Enable futex support"
 	default y
 	select RT_MUTEXES
 	help
@@ -155,7 +157,7 @@ config HAVE_FUTEX_CMPXCHG
 	  checks.
 
 config EPOLL
-	bool "Enable eventpoll support" if EXPERT
+	bool "Enable eventpoll support"
 	default y
 	select ANON_INODES
 	help
@@ -163,7 +165,7 @@ config EPOLL
 	  support for epoll family of system calls.
 
 config SIGNALFD
-	bool "Enable signalfd() system call" if EXPERT
+	bool "Enable signalfd() system call"
 	select ANON_INODES
 	default y
 	help
@@ -173,7 +175,7 @@ config SIGNALFD
 	  If unsure, say Y.
 
 config TIMERFD
-	bool "Enable timerfd() system call" if EXPERT
+	bool "Enable timerfd() system call"
 	select ANON_INODES
 	default y
 	help
@@ -183,7 +185,7 @@ config TIMERFD
 	  If unsure, say Y.
 
 config EVENTFD
-	bool "Enable eventfd() system call" if EXPERT
+	bool "Enable eventfd() system call"
 	select ANON_INODES
 	default y
 	help
@@ -193,7 +195,7 @@ config EVENTFD
 	  If unsure, say Y.
 
 config SHMEM
-	bool "Use full shmem filesystem" if EXPERT
+	bool "Use full shmem filesystem"
 	default y
 	depends on MMU
 	help
@@ -204,7 +206,7 @@ config SHMEM
 	  which may be appropriate on small systems without swap.
 
 config AIO
-	bool "Enable AIO support" if EXPERT
+	bool "Enable AIO support"
 	default y
 	help
 	  This option enables POSIX asynchronous I/O which may by used
@@ -212,7 +214,7 @@ config AIO
 	  this option saves about 7k.
 
 config ADVISE_SYSCALLS
-	bool "Enable madvise/fadvise syscalls" if EXPERT
+	bool "Enable madvise/fadvise syscalls"
 	default y
 	help
 	  This option enables the madvise and fadvise syscalls, used by
@@ -223,9 +225,11 @@ config ADVISE_SYSCALLS
 
 config PCI_QUIRKS
 	default y
-	bool "Enable PCI quirk workarounds" if EXPERT
+	bool "Enable PCI quirk workarounds"
 	depends on PCI
 	help
 	  This enables workarounds for various PCI chipset
 	  bugs/quirks. Disable this only if your target machine is
 	  unaffected by PCI quirks.
+
+endif # showif EXPERT
-- 
2.1.4

