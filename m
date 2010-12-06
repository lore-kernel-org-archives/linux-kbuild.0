Return-Path: <linux-kbuild-owner@vger.kernel.org>
Message-Id: <4CFD1D7F0200007800026260@vpn.id2.novell.com>
Date: Mon, 06 Dec 2010 16:29:35 +0000
From: "Jan Beulich" <JBeulich@novell.com>
Subject: [PATCH] miscellaneous Kconfig cleanup
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Even generally, having a defualt of "n" isn't very useful (as that's
what kconfig defaults to anyway), but it is potentially going to cause
confusion when enforced on options with invisible (or even withou any
prompt: If such an option's prompt becomes visible later, the user
will not be asked whether (s)he wants to turn on the option.

Besides that, use def_bool instead of the bool/default pair to make
things a little shorter.

Signed-off-by: Jan Beulich <jbeulich@novell.com>

---
 block/Kconfig        |    4 +---
 drivers/net/Kconfig  |    2 +-
 fs/Kconfig           |   10 +++-------
 fs/notify/Kconfig    |    2 +-
 fs/quota/Kconfig     |    5 +----
 init/Kconfig         |   35 +++++++----------------------------
 kernel/gcov/Kconfig  |    2 --
 kernel/irq/Kconfig   |   16 ++++++++--------
 kernel/power/Kconfig |   13 +++----------
 kernel/trace/Kconfig |   11 +++--------
 lib/Kconfig          |    5 ++---
 net/mac80211/Kconfig |    2 +-
 12 files changed, 31 insertions(+), 76 deletions(-)

--- linux-2.6.37-rc4/block/Kconfig
+++ 2.6.37-rc4-kconfig-cleanup/block/Kconfig
@@ -80,7 +80,6 @@ config BLK_DEV_INTEGRITY
 config BLK_DEV_THROTTLING
 	bool "Block layer bio throttling support"
 	depends on BLK_CGROUP=y && EXPERIMENTAL
-	default n
 	---help---
 	Block layer bio throttling support. It can be used to limit
 	the IO rate to a device. IO rate policies are per cgroup and
@@ -92,8 +91,7 @@ config BLK_DEV_THROTTLING
 endif # BLOCK
 
 config BLOCK_COMPAT
-	bool
+	def_bool y
 	depends on BLOCK && COMPAT
-	default y
 
 source block/Kconfig.iosched
--- linux-2.6.37-rc4/drivers/net/Kconfig
+++ 2.6.37-rc4-kconfig-cleanup/drivers/net/Kconfig
@@ -1068,7 +1068,7 @@ config SMSC911X
 	  will be called smsc911x.
 
 config SMSC911X_ARCH_HOOKS
-	def_bool n
+	bool
 	depends on SMSC911X
 	help
 	  If the arch enables this, it allows the arch to implement various
--- linux-2.6.37-rc4/fs/Kconfig
+++ 2.6.37-rc4-kconfig-cleanup/fs/Kconfig
@@ -12,9 +12,8 @@ source "fs/ext4/Kconfig"
 
 config FS_XIP
 # execute in place
-	bool
+	def_bool y
 	depends on EXT2_FS_XIP
-	default y
 
 source "fs/jbd/Kconfig"
 source "fs/jbd2/Kconfig"
@@ -37,7 +36,6 @@ config FS_POSIX_ACL
 # 	Never use this symbol for ifdefs.
 #
 	bool
-	default n
 
 source "fs/xfs/Kconfig"
 source "fs/gfs2/Kconfig"
@@ -218,19 +216,17 @@ config LOCKD
 	depends on FILE_LOCKING
 
 config LOCKD_V4
-	bool
+	def_bool y
 	depends on NFSD_V3 || NFS_V3
 	depends on FILE_LOCKING
-	default y
 
 config NFS_ACL_SUPPORT
 	tristate
 	select FS_POSIX_ACL
 
 config NFS_COMMON
-	bool
+	def_bool y
 	depends on NFSD || NFS_FS
-	default y
 
 source "net/sunrpc/Kconfig"
 source "fs/ceph/Kconfig"
--- linux-2.6.37-rc4/fs/notify/Kconfig
+++ 2.6.37-rc4-kconfig-cleanup/fs/notify/Kconfig
@@ -1,5 +1,5 @@
 config FSNOTIFY
-	def_bool n
+	bool
 
 source "fs/notify/dnotify/Kconfig"
 source "fs/notify/inotify/Kconfig"
--- linux-2.6.37-rc4/fs/quota/Kconfig
+++ 2.6.37-rc4-kconfig-cleanup/fs/quota/Kconfig
@@ -37,7 +37,6 @@ config PRINT_QUOTA_WARNING
 config QUOTA_DEBUG
 	bool "Additional quota sanity checks"
 	depends on QUOTA
-	default n
 	help
 	  If you say Y here, quota subsystem will perform some additional
 	  sanity checks of quota internal structures. If unsure, say N.
@@ -66,9 +65,7 @@ config QFMT_V2
 
 config QUOTACTL
 	bool
-	default n
 
 config QUOTACTL_COMPAT
-	bool
+	def_bool y
 	depends on QUOTACTL && COMPAT_FOR_U64_ALIGNMENT
-	default y
--- linux-2.6.37-rc4/init/Kconfig
+++ 2.6.37-rc4-kconfig-cleanup/init/Kconfig
@@ -17,9 +17,8 @@ config DEFCONFIG_LIST
 	default "arch/$ARCH/defconfig"
 
 config CONSTRUCTORS
-	bool
+	def_bool y
 	depends on !UML
-	default y
 
 config HAVE_IRQ_WORK
 	bool
@@ -65,14 +64,12 @@ config BROKEN
 	bool
 
 config BROKEN_ON_SMP
-	bool
+	def_bool y
 	depends on BROKEN || !SMP
-	default y
 
 config LOCK_KERNEL
-	bool
+	def_bool y
 	depends on (SMP || PREEMPT) && BKL
-	default y
 
 config INIT_ENV_ARG_LIMIT
 	int
@@ -217,10 +214,9 @@ config SYSVIPC
 	  <http://www.tldp.org/guides.html>.
 
 config SYSVIPC_SYSCTL
-	bool
+	def_bool y
 	depends on SYSVIPC
 	depends on SYSCTL
-	default y
 
 config POSIX_MQUEUE
 	bool "POSIX Message Queues"
@@ -239,10 +235,9 @@ config POSIX_MQUEUE
 	  If unsure, say Y.
 
 config POSIX_MQUEUE_SYSCTL
-	bool
+	def_bool y
 	depends on POSIX_MQUEUE
 	depends on SYSCTL
-	default y
 
 config BSD_PROCESS_ACCT
 	bool "BSD Process Accounting"
@@ -260,7 +255,6 @@ config BSD_PROCESS_ACCT
 config BSD_PROCESS_ACCT_V3
 	bool "BSD Process Accounting version 3 file format"
 	depends on BSD_PROCESS_ACCT
-	default n
 	help
 	  If you say Y here, the process accounting information is written
 	  in a new file format that also logs the process IDs of each
@@ -272,7 +266,6 @@ config BSD_PROCESS_ACCT_V3
 config TASKSTATS
 	bool "Export task/process statistics through netlink (EXPERIMENTAL)"
 	depends on NET
-	default n
 	help
 	  Export selected statistics for tasks/processes through the
 	  generic netlink interface. Unlike BSD process accounting, the
@@ -424,7 +417,6 @@ config RCU_FANOUT
 config RCU_FANOUT_EXACT
 	bool "Disable tree-based hierarchical RCU auto-balancing"
 	depends on TREE_RCU || TREE_PREEMPT_RCU
-	default n
 	help
 	  This option forces use of the exact RCU_FANOUT value specified,
 	  regardless of imbalances in the hierarchy.  This is useful for
@@ -438,7 +430,6 @@ config RCU_FANOUT_EXACT
 config RCU_FAST_NO_HZ
 	bool "Accelerate last non-dyntick-idle CPU's grace periods"
 	depends on TREE_RCU && NO_HZ && SMP
-	default n
 	help
 	  This option causes RCU to attempt to accelerate grace periods
 	  in order to allow the final CPU to enter dynticks-idle state
@@ -518,7 +509,6 @@ if CGROUPS
 
 config CGROUP_DEBUG
 	bool "Example debug cgroup subsystem"
-	default n
 	help
 	  This option enables a simple cgroup subsystem that
 	  exports useful debugging information about the cgroups
@@ -646,7 +636,6 @@ config RT_GROUP_SCHED
 	bool "Group scheduling for SCHED_RR/FIFO"
 	depends on EXPERIMENTAL
 	depends on CGROUP_SCHED
-	default n
 	help
 	  This feature lets you explicitly allocate real CPU bandwidth
 	  to task groups. If enabled, it will also make it impossible to
@@ -659,7 +648,6 @@ endif #CGROUP_SCHED
 config BLK_CGROUP
 	tristate "Block IO controller"
 	depends on BLOCK
-	default n
 	---help---
 	Generic block IO controller cgroup interface. This is the common
 	cgroup interface which should be used by various IO controlling
@@ -681,7 +669,6 @@ config BLK_CGROUP
 config DEBUG_BLK_CGROUP
 	bool "Enable Block IO controller debugging"
 	depends on BLK_CGROUP
-	default n
 	---help---
 	Enable some debugging help. Currently it exports additional stat
 	files in a cgroup which can be useful for debugging.
@@ -747,7 +734,6 @@ config MM_OWNER
 config SYSFS_DEPRECATED
 	bool "enable deprecated sysfs features to support old userspace tools"
 	depends on SYSFS
-	default n
 	help
 	  This option adds code that switches the layout of the "block" class
 	  devices, to not show up in /sys/class/block/, but only in
@@ -769,7 +755,6 @@ config SYSFS_DEPRECATED
 
 config SYSFS_DEPRECATED_V2
 	bool "enabled deprecated sysfs features by default"
-	default n
 	depends on SYSFS
 	depends on SYSFS_DEPRECATED
 	help
@@ -1064,7 +1049,6 @@ config PERF_COUNTERS
 	  Say N if unsure.
 
 config DEBUG_PERF_USE_VMALLOC
-	default n
 	bool "Debug: use vmalloc to back perf mmap() buffers"
 	depends on PERF_EVENTS && DEBUG_KERNEL
 	select PERF_USE_VMALLOC
@@ -1154,7 +1138,6 @@ endchoice
 config MMAP_ALLOW_UNINITIALIZED
 	bool "Allow mmapped anonymous memory to be uninitialized"
 	depends on EMBEDDED && !MMU
-	default n
 	help
 	  Normally, and according to the Linux spec, anonymous memory obtained
 	  from mmap() has it's contents cleared before it is passed to
@@ -1192,13 +1175,11 @@ endmenu		# General setup
 
 config HAVE_GENERIC_DMA_COHERENT
 	bool
-	default n
 
 config SLABINFO
-	bool
+	def_bool y
 	depends on PROC_FS
 	depends on SLAB || SLUB_DEBUG
-	default y
 
 config RT_MUTEXES
 	boolean
@@ -1232,7 +1213,6 @@ if MODULES
 
 config MODULE_FORCE_LOAD
 	bool "Forced module loading"
-	default n
 	help
 	  Allow loading of modules without version information (ie. modprobe
 	  --force).  Forced module loading sets the 'F' (forced) taint flag and
@@ -1289,8 +1269,7 @@ config INIT_ALL_POSSIBLE
 	  and have several arch maintainers pursuing me down dark alleys.
 
 config STOP_MACHINE
-	bool
-	default y
+	def_bool y
 	depends on (SMP && MODULE_UNLOAD) || HOTPLUG_CPU
 	help
 	  Need stop_machine() primitive.
--- linux-2.6.37-rc4/kernel/gcov/Kconfig
+++ 2.6.37-rc4-kconfig-cleanup/kernel/gcov/Kconfig
@@ -3,7 +3,6 @@ menu "GCOV-based kernel profiling"
 config GCOV_KERNEL
 	bool "Enable gcov-based kernel profiling"
 	depends on DEBUG_FS && CONSTRUCTORS
-	default n
 	---help---
 	This option enables gcov-based code profiling (e.g. for code coverage
 	measurements).
@@ -35,7 +34,6 @@ config GCOV_PROFILE_ALL
 	bool "Profile entire Kernel"
 	depends on GCOV_KERNEL
 	depends on S390 || X86 || (PPC && EXPERIMENTAL) || MICROBLAZE
-	default n
 	---help---
 	This options activates profiling for the entire kernel.
 
--- linux-2.6.37-rc4/kernel/irq/Kconfig
+++ 2.6.37-rc4-kconfig-cleanup/kernel/irq/Kconfig
@@ -1,5 +1,5 @@
 config HAVE_GENERIC_HARDIRQS
-	def_bool n
+	bool
 
 if HAVE_GENERIC_HARDIRQS
 menu "IRQ subsystem"
@@ -14,26 +14,26 @@ config GENERIC_HARDIRQS_NO__DO_IRQ
 
 # Select this to disable the deprecated stuff
 config GENERIC_HARDIRQS_NO_DEPRECATED
-       def_bool n
+	bool
 
 # Options selectable by the architecture code
 config HAVE_SPARSE_IRQ
-       def_bool n
+	bool
 
 config GENERIC_IRQ_PROBE
-	def_bool n
+	bool
 
 config GENERIC_PENDING_IRQ
-	def_bool n
+	bool
 
 config AUTO_IRQ_AFFINITY
-       def_bool n
+	bool
 
 config IRQ_PER_CPU
-       def_bool n
+	bool
 
 config HARDIRQS_SW_RESEND
-       def_bool n
+	bool
 
 config SPARSE_IRQ
 	bool "Support sparse irq numbering"
--- linux-2.6.37-rc4/kernel/power/Kconfig
+++ 2.6.37-rc4-kconfig-cleanup/kernel/power/Kconfig
@@ -30,7 +30,6 @@ config PM_DEBUG
 config PM_ADVANCED_DEBUG
 	bool "Extra PM attributes in sysfs for low-level debugging/testing"
 	depends on PM_DEBUG
-	default n
 	---help---
 	Add extra sysfs attributes allowing one to access some Power Management
 	fields of device objects from user space.  If you are not a kernel
@@ -39,7 +38,6 @@ config PM_ADVANCED_DEBUG
 config PM_VERBOSE
 	bool "Verbose Power Management debugging"
 	depends on PM_DEBUG
-	default n
 	---help---
 	This option enables verbose messages from the Power Management code.
 
@@ -67,7 +65,6 @@ config PM_TRACE_RTC
 	depends on CAN_PM_TRACE
 	depends on X86
 	select PM_TRACE
-	default n
 	---help---
 	This enables some cheesy code to save the last PM event point in the
 	RTC across reboots, so that you can debug a machine that just hangs
@@ -82,23 +79,20 @@ config PM_TRACE_RTC
 	set to an invalid time after a resume.
 
 config PM_SLEEP_SMP
-	bool
+	def_bool y
 	depends on SMP
 	depends on ARCH_SUSPEND_POSSIBLE || ARCH_HIBERNATION_POSSIBLE
 	depends on PM_SLEEP
 	select HOTPLUG
 	select HOTPLUG_CPU
-	default y
 
 config PM_SLEEP
-	bool
+	def_bool y
 	depends on SUSPEND || HIBERNATION || XEN_SAVE_RESTORE
-	default y
 
 config PM_SLEEP_ADVANCED_DEBUG
 	bool
 	depends on PM_ADVANCED_DEBUG
-	default n
 
 config SUSPEND_NVS
        bool
@@ -242,9 +236,8 @@ config PM_RUNTIME
 	  wake-up events.
 
 config PM_OPS
-	bool
+	def_bool y
 	depends on PM_SLEEP || PM_RUNTIME
-	default y
 
 config ARCH_HAS_OPP
 	bool
--- linux-2.6.37-rc4/kernel/trace/Kconfig
+++ 2.6.37-rc4-kconfig-cleanup/kernel/trace/Kconfig
@@ -61,9 +61,8 @@ config RING_BUFFER
 	bool
 
 config FTRACE_NMI_ENTER
-       bool
-       depends on HAVE_FTRACE_NMI_ENTER
-       default y
+	def_bool y
+	depends on HAVE_FTRACE_NMI_ENTER
 
 config EVENT_TRACING
 	select CONTEXT_SWITCH_TRACER
@@ -104,14 +103,13 @@ config GENERIC_TRACER
 # be able to offer generic tracing facilities:
 #
 config TRACING_SUPPORT
-	bool
+	def_bool y
 	# PPC32 has no irqflags tracing support, but it can use most of the
 	# tracers anyway, they were tested to build and work. Note that new
 	# exceptions to this list aren't welcomed, better implement the
 	# irqflags tracing for your architecture.
 	depends on TRACE_IRQFLAGS_SUPPORT || PPC32
 	depends on STACKTRACE_SUPPORT
-	default y
 
 if TRACING_SUPPORT
 
@@ -156,7 +154,6 @@ config FUNCTION_GRAPH_TRACER
 
 config IRQSOFF_TRACER
 	bool "Interrupts-off Latency Tracer"
-	default n
 	depends on TRACE_IRQFLAGS_SUPPORT
 	depends on !ARCH_USES_GETTIMEOFFSET
 	select TRACE_IRQFLAGS
@@ -179,7 +176,6 @@ config IRQSOFF_TRACER
 
 config PREEMPT_TRACER
 	bool "Preemption-off Latency Tracer"
-	default n
 	depends on !ARCH_USES_GETTIMEOFFSET
 	depends on PREEMPT
 	select GENERIC_TRACER
@@ -392,7 +388,6 @@ config DYNAMIC_FTRACE
 config FUNCTION_PROFILER
 	bool "Kernel function profiler"
 	depends on FUNCTION_TRACER
-	default n
 	help
 	  This option enables the kernel function profiler. A file is created
 	  in debugfs called function_profile_enabled which defaults to zero.
--- linux-2.6.37-rc4/lib/Kconfig
+++ 2.6.37-rc4-kconfig-cleanup/lib/Kconfig
@@ -3,7 +3,7 @@
 #
 
 config BINARY_PRINTF
-	def_bool n
+	bool
 
 menu "Library routines"
 
@@ -23,8 +23,7 @@ config GENERIC_FIND_NEXT_BIT
 	bool
 
 config GENERIC_FIND_LAST_BIT
-	bool
-	default y
+	def_bool y
 
 config CRC_CCITT
 	tristate "CRC-CCITT functions"
--- linux-2.6.37-rc4/net/mac80211/Kconfig
+++ 2.6.37-rc4-kconfig-cleanup/net/mac80211/Kconfig
@@ -16,7 +16,7 @@ comment "CFG80211 needs to be enabled fo
 if MAC80211 != n
 
 config MAC80211_HAS_RC
-	def_bool n
+	bool
 
 config MAC80211_RC_PID
 	bool "PID controller based rate control algorithm" if EMBEDDED


