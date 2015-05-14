Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:42111 "EHLO
	relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933494AbbENPfw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 14 May 2015 11:35:52 -0400
Date: Thu, 14 May 2015 08:35:35 -0700
From: Josh Triplett <josh@joshtriplett.org>
Subject: [PATCH 2/5] init/Kconfig: Split expert menu into a separate file,
 init/Kconfig.expert
Message-ID: <ed62348c630f41247468e45eb83063d606709cd4.1431589089.git.josh@joshtriplett.org>
References: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431589089.git.josh@joshtriplett.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431589089.git.josh@joshtriplett.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Michal Hocko <mhocko@suse.cz>, Josh Triplett <josh@joshtriplett.org>, Vladimir Davydov <vdavydov@parallels.com>, Johannes Weiner <hannes@cmpxchg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Andy Lutomirski <luto@amacapital.net>, Bertrand Jacquin <beber@meleeweb.net>, "Luis R. Rodriguez" <mcgrof@suse.com>, Iulia Manda <iulia.manda21@gmail.com>, Pranith Kumar <bobby.prani@gmail.com>, Clark Williams <clark.williams@gmail.com>, Mel Gorman <mgorman@suse.de>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The expert menu frequently gets broken by a config item in the middle
that leaves off the "if EXPERT" from its prompt.  This results in the
remainder of the menu spilling out into the parent "General setup" menu.
Move the entire expert menu into a separate Kconfig file,
init/Kconfig.expert, to make this harder to do accidentally, and to
break up the exceedingly long init/Kconfig a bit.

Signed-off-by: Josh Triplett <josh@joshtriplett.org>
---
 init/Kconfig        | 232 +---------------------------------------------------
 init/Kconfig.expert | 231 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 232 insertions(+), 231 deletions(-)
 create mode 100644 init/Kconfig.expert

diff --git a/init/Kconfig b/init/Kconfig
index e2f16f1..a2de3f5 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1351,237 +1351,7 @@ config BPF_SYSCALL
 	  Enable the bpf() system call that allows to manipulate eBPF
 	  programs and maps via file descriptors.
 
-menuconfig EXPERT
-	bool "Configure standard kernel features (expert users)"
-	# Unhide debug options, to make the on-by-default options visible
-	select DEBUG_KERNEL
-	help
-	  This option allows certain base kernel options and settings
-          to be disabled or tweaked. This is for specialized
-          environments which can tolerate a "non-standard" kernel.
-          Only use this if you really know what you are doing.
-
-config UID16
-	bool "Enable 16-bit UID system calls" if EXPERT
-	depends on HAVE_UID16 && MULTIUSER
-	default y
-	help
-	  This enables the legacy 16-bit UID syscall wrappers.
-
-config MULTIUSER
-	bool "Multiple users, groups and capabilities support" if EXPERT
-	default y
-	help
-	  This option enables support for non-root users, groups and
-	  capabilities.
-
-	  If you say N here, all processes will run with UID 0, GID 0, and all
-	  possible capabilities.  Saying N here also compiles out support for
-	  system calls related to UIDs, GIDs, and capabilities, such as setuid,
-	  setgid, and capset.
-
-	  If unsure, say Y here.
-
-config SGETMASK_SYSCALL
-	bool "sgetmask/ssetmask syscalls support" if EXPERT
-	def_bool PARISC || MN10300 || BLACKFIN || M68K || PPC || MIPS || X86 || SPARC || CRIS || MICROBLAZE || SUPERH
-	---help---
-	  sys_sgetmask and sys_ssetmask are obsolete system calls
-	  no longer supported in libc but still enabled by default in some
-	  architectures.
-
-	  If unsure, leave the default option here.
-
-config SYSFS_SYSCALL
-	bool "Sysfs syscall support" if EXPERT
-	default y
-	---help---
-	  sys_sysfs is an obsolete system call no longer supported in libc.
-	  Note that disabling this option is more secure but might break
-	  compatibility with some systems.
-
-	  If unsure say Y here.
-
-config SYSCTL_SYSCALL
-	bool "Sysctl syscall support" if EXPERT
-	depends on PROC_SYSCTL
-	default n
-	select SYSCTL
-	---help---
-	  sys_sysctl uses binary paths that have been found challenging
-	  to properly maintain and use.  The interface in /proc/sys
-	  using paths with ascii names is now the primary path to this
-	  information.
-
-	  Almost nothing using the binary sysctl interface so if you are
-	  trying to save some space it is probably safe to disable this,
-	  making your kernel marginally smaller.
-
-	  If unsure say N here.
-
-config KALLSYMS
-	 bool "Load all symbols for debugging/ksymoops" if EXPERT
-	 default y
-	 help
-	   Say Y here to let the kernel print out symbolic crash information and
-	   symbolic stack backtraces. This increases the size of the kernel
-	   somewhat, as all symbols have to be loaded into the kernel image.
-
-config KALLSYMS_ALL
-	bool "Include all symbols in kallsyms"
-	depends on DEBUG_KERNEL && KALLSYMS
-	help
-	   Normally kallsyms only contains the symbols of functions for nicer
-	   OOPS messages and backtraces (i.e., symbols from the text and inittext
-	   sections). This is sufficient for most cases. And only in very rare
-	   cases (e.g., when a debugger is used) all symbols are required (e.g.,
-	   names of variables from the data sections, etc).
-
-	   This option makes sure that all symbols are loaded into the kernel
-	   image (i.e., symbols from all sections) in cost of increased kernel
-	   size (depending on the kernel configuration, it may be 300KiB or
-	   something like this).
-
-	   Say N unless you really need all symbols.
-
-config PRINTK
-	default y
-	bool "Enable support for printk" if EXPERT
-	select IRQ_WORK
-	help
-	  This option enables normal printk support. Removing it
-	  eliminates most of the message strings from the kernel image
-	  and makes the kernel more or less silent. As this makes it
-	  very difficult to diagnose system problems, saying N here is
-	  strongly discouraged.
-
-config BUG
-	bool "BUG() support" if EXPERT
-	default y
-	help
-          Disabling this option eliminates support for BUG and WARN, reducing
-          the size of your kernel image and potentially quietly ignoring
-          numerous fatal conditions. You should only consider disabling this
-          option for embedded systems with no facilities for reporting errors.
-          Just say Y.
-
-config ELF_CORE
-	depends on COREDUMP
-	default y
-	bool "Enable ELF core dumps" if EXPERT
-	help
-	  Enable support for generating core dumps. Disabling saves about 4k.
-
-
-config PCSPKR_PLATFORM
-	bool "Enable PC-Speaker support" if EXPERT
-	depends on HAVE_PCSPKR_PLATFORM
-	select I8253_LOCK
-	default y
-	help
-          This option allows to disable the internal PC-Speaker
-          support, saving some memory.
-
-config BASE_FULL
-	default y
-	bool "Enable full-sized data structures for core" if EXPERT
-	help
-	  Disabling this option reduces the size of miscellaneous core
-	  kernel data structures. This saves memory on small machines,
-	  but may reduce performance.
-
-config FUTEX
-	bool "Enable futex support" if EXPERT
-	default y
-	select RT_MUTEXES
-	help
-	  Disabling this option will cause the kernel to be built without
-	  support for "fast userspace mutexes".  The resulting kernel may not
-	  run glibc-based applications correctly.
-
-config HAVE_FUTEX_CMPXCHG
-	bool
-	depends on FUTEX
-	help
-	  Architectures should select this if futex_atomic_cmpxchg_inatomic()
-	  is implemented and always working. This removes a couple of runtime
-	  checks.
-
-config EPOLL
-	bool "Enable eventpoll support" if EXPERT
-	default y
-	select ANON_INODES
-	help
-	  Disabling this option will cause the kernel to be built without
-	  support for epoll family of system calls.
-
-config SIGNALFD
-	bool "Enable signalfd() system call" if EXPERT
-	select ANON_INODES
-	default y
-	help
-	  Enable the signalfd() system call that allows to receive signals
-	  on a file descriptor.
-
-	  If unsure, say Y.
-
-config TIMERFD
-	bool "Enable timerfd() system call" if EXPERT
-	select ANON_INODES
-	default y
-	help
-	  Enable the timerfd() system call that allows to receive timer
-	  events on a file descriptor.
-
-	  If unsure, say Y.
-
-config EVENTFD
-	bool "Enable eventfd() system call" if EXPERT
-	select ANON_INODES
-	default y
-	help
-	  Enable the eventfd() system call that allows to receive both
-	  kernel notification (ie. KAIO) or userspace notifications.
-
-	  If unsure, say Y.
-
-config SHMEM
-	bool "Use full shmem filesystem" if EXPERT
-	default y
-	depends on MMU
-	help
-	  The shmem is an internal filesystem used to manage shared memory.
-	  It is backed by swap and manages resource limits. It is also exported
-	  to userspace as tmpfs if TMPFS is enabled. Disabling this
-	  option replaces shmem and tmpfs with the much simpler ramfs code,
-	  which may be appropriate on small systems without swap.
-
-config AIO
-	bool "Enable AIO support" if EXPERT
-	default y
-	help
-	  This option enables POSIX asynchronous I/O which may by used
-	  by some high performance threaded applications. Disabling
-	  this option saves about 7k.
-
-config ADVISE_SYSCALLS
-	bool "Enable madvise/fadvise syscalls" if EXPERT
-	default y
-	help
-	  This option enables the madvise and fadvise syscalls, used by
-	  applications to advise the kernel about their future memory or file
-	  usage, improving performance. If building an embedded system where no
-	  applications use these syscalls, you can disable this option to save
-	  space.
-
-config PCI_QUIRKS
-	default y
-	bool "Enable PCI quirk workarounds" if EXPERT
-	depends on PCI
-	help
-	  This enables workarounds for various PCI chipset
-	  bugs/quirks. Disable this only if your target machine is
-	  unaffected by PCI quirks.
+source init/Kconfig.expert
 
 config EMBEDDED
 	bool "Embedded system"
diff --git a/init/Kconfig.expert b/init/Kconfig.expert
new file mode 100644
index 0000000..c84a372
--- /dev/null
+++ b/init/Kconfig.expert
@@ -0,0 +1,231 @@
+menuconfig EXPERT
+	bool "Configure standard kernel features (expert users)"
+	# Unhide debug options, to make the on-by-default options visible
+	select DEBUG_KERNEL
+	help
+	  This option allows certain base kernel options and settings
+          to be disabled or tweaked. This is for specialized
+          environments which can tolerate a "non-standard" kernel.
+          Only use this if you really know what you are doing.
+
+config UID16
+	bool "Enable 16-bit UID system calls" if EXPERT
+	depends on HAVE_UID16 && MULTIUSER
+	default y
+	help
+	  This enables the legacy 16-bit UID syscall wrappers.
+
+config MULTIUSER
+	bool "Multiple users, groups and capabilities support" if EXPERT
+	default y
+	help
+	  This option enables support for non-root users, groups and
+	  capabilities.
+
+	  If you say N here, all processes will run with UID 0, GID 0, and all
+	  possible capabilities.  Saying N here also compiles out support for
+	  system calls related to UIDs, GIDs, and capabilities, such as setuid,
+	  setgid, and capset.
+
+	  If unsure, say Y here.
+
+config SGETMASK_SYSCALL
+	bool "sgetmask/ssetmask syscalls support" if EXPERT
+	def_bool PARISC || MN10300 || BLACKFIN || M68K || PPC || MIPS || X86 || SPARC || CRIS || MICROBLAZE || SUPERH
+	---help---
+	  sys_sgetmask and sys_ssetmask are obsolete system calls
+	  no longer supported in libc but still enabled by default in some
+	  architectures.
+
+	  If unsure, leave the default option here.
+
+config SYSFS_SYSCALL
+	bool "Sysfs syscall support" if EXPERT
+	default y
+	---help---
+	  sys_sysfs is an obsolete system call no longer supported in libc.
+	  Note that disabling this option is more secure but might break
+	  compatibility with some systems.
+
+	  If unsure say Y here.
+
+config SYSCTL_SYSCALL
+	bool "Sysctl syscall support" if EXPERT
+	depends on PROC_SYSCTL
+	default n
+	select SYSCTL
+	---help---
+	  sys_sysctl uses binary paths that have been found challenging
+	  to properly maintain and use.  The interface in /proc/sys
+	  using paths with ascii names is now the primary path to this
+	  information.
+
+	  Almost nothing using the binary sysctl interface so if you are
+	  trying to save some space it is probably safe to disable this,
+	  making your kernel marginally smaller.
+
+	  If unsure say N here.
+
+config KALLSYMS
+	 bool "Load all symbols for debugging/ksymoops" if EXPERT
+	 default y
+	 help
+	   Say Y here to let the kernel print out symbolic crash information and
+	   symbolic stack backtraces. This increases the size of the kernel
+	   somewhat, as all symbols have to be loaded into the kernel image.
+
+config KALLSYMS_ALL
+	bool "Include all symbols in kallsyms"
+	depends on DEBUG_KERNEL && KALLSYMS
+	help
+	   Normally kallsyms only contains the symbols of functions for nicer
+	   OOPS messages and backtraces (i.e., symbols from the text and inittext
+	   sections). This is sufficient for most cases. And only in very rare
+	   cases (e.g., when a debugger is used) all symbols are required (e.g.,
+	   names of variables from the data sections, etc).
+
+	   This option makes sure that all symbols are loaded into the kernel
+	   image (i.e., symbols from all sections) in cost of increased kernel
+	   size (depending on the kernel configuration, it may be 300KiB or
+	   something like this).
+
+	   Say N unless you really need all symbols.
+
+config PRINTK
+	default y
+	bool "Enable support for printk" if EXPERT
+	select IRQ_WORK
+	help
+	  This option enables normal printk support. Removing it
+	  eliminates most of the message strings from the kernel image
+	  and makes the kernel more or less silent. As this makes it
+	  very difficult to diagnose system problems, saying N here is
+	  strongly discouraged.
+
+config BUG
+	bool "BUG() support" if EXPERT
+	default y
+	help
+          Disabling this option eliminates support for BUG and WARN, reducing
+          the size of your kernel image and potentially quietly ignoring
+          numerous fatal conditions. You should only consider disabling this
+          option for embedded systems with no facilities for reporting errors.
+          Just say Y.
+
+config ELF_CORE
+	depends on COREDUMP
+	default y
+	bool "Enable ELF core dumps" if EXPERT
+	help
+	  Enable support for generating core dumps. Disabling saves about 4k.
+
+
+config PCSPKR_PLATFORM
+	bool "Enable PC-Speaker support" if EXPERT
+	depends on HAVE_PCSPKR_PLATFORM
+	select I8253_LOCK
+	default y
+	help
+          This option allows to disable the internal PC-Speaker
+          support, saving some memory.
+
+config BASE_FULL
+	default y
+	bool "Enable full-sized data structures for core" if EXPERT
+	help
+	  Disabling this option reduces the size of miscellaneous core
+	  kernel data structures. This saves memory on small machines,
+	  but may reduce performance.
+
+config FUTEX
+	bool "Enable futex support" if EXPERT
+	default y
+	select RT_MUTEXES
+	help
+	  Disabling this option will cause the kernel to be built without
+	  support for "fast userspace mutexes".  The resulting kernel may not
+	  run glibc-based applications correctly.
+
+config HAVE_FUTEX_CMPXCHG
+	bool
+	depends on FUTEX
+	help
+	  Architectures should select this if futex_atomic_cmpxchg_inatomic()
+	  is implemented and always working. This removes a couple of runtime
+	  checks.
+
+config EPOLL
+	bool "Enable eventpoll support" if EXPERT
+	default y
+	select ANON_INODES
+	help
+	  Disabling this option will cause the kernel to be built without
+	  support for epoll family of system calls.
+
+config SIGNALFD
+	bool "Enable signalfd() system call" if EXPERT
+	select ANON_INODES
+	default y
+	help
+	  Enable the signalfd() system call that allows to receive signals
+	  on a file descriptor.
+
+	  If unsure, say Y.
+
+config TIMERFD
+	bool "Enable timerfd() system call" if EXPERT
+	select ANON_INODES
+	default y
+	help
+	  Enable the timerfd() system call that allows to receive timer
+	  events on a file descriptor.
+
+	  If unsure, say Y.
+
+config EVENTFD
+	bool "Enable eventfd() system call" if EXPERT
+	select ANON_INODES
+	default y
+	help
+	  Enable the eventfd() system call that allows to receive both
+	  kernel notification (ie. KAIO) or userspace notifications.
+
+	  If unsure, say Y.
+
+config SHMEM
+	bool "Use full shmem filesystem" if EXPERT
+	default y
+	depends on MMU
+	help
+	  The shmem is an internal filesystem used to manage shared memory.
+	  It is backed by swap and manages resource limits. It is also exported
+	  to userspace as tmpfs if TMPFS is enabled. Disabling this
+	  option replaces shmem and tmpfs with the much simpler ramfs code,
+	  which may be appropriate on small systems without swap.
+
+config AIO
+	bool "Enable AIO support" if EXPERT
+	default y
+	help
+	  This option enables POSIX asynchronous I/O which may by used
+	  by some high performance threaded applications. Disabling
+	  this option saves about 7k.
+
+config ADVISE_SYSCALLS
+	bool "Enable madvise/fadvise syscalls" if EXPERT
+	default y
+	help
+	  This option enables the madvise and fadvise syscalls, used by
+	  applications to advise the kernel about their future memory or file
+	  usage, improving performance. If building an embedded system where no
+	  applications use these syscalls, you can disable this option to save
+	  space.
+
+config PCI_QUIRKS
+	default y
+	bool "Enable PCI quirk workarounds" if EXPERT
+	depends on PCI
+	help
+	  This enables workarounds for various PCI chipset
+	  bugs/quirks. Disable this only if your target machine is
+	  unaffected by PCI quirks.
-- 
2.1.4

