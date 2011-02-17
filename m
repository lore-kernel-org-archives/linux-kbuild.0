Return-Path: <linux-kbuild-owner@vger.kernel.org>
Message-Id: <4D5D33F40200007800032657@vpn.id2.novell.com>
Date: Thu, 17 Feb 2011 13:43:00 +0000
From: "Jan Beulich" <JBeulich@novell.com>
Subject: [PATCH] streamline init/Kconfig
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

'n' defaults are pretty pointless and actually bogus when used with
prompt-less config options.

The "bool"/"default y" pair with no prompt can be expressed more
compactly using def_bool.

Signed-off-by: Jan Beulich <jbeulich@novell.com>

---
 init/Kconfig |   36 +++++++-----------------------------
 1 file changed, 7 insertions(+), 29 deletions(-)

--- 2.6.38-rc5/init/Kconfig
+++ 2.6.38-rc5-kconfig-init/init/Kconfig
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
@@ -235,10 +232,9 @@ config SYSVIPC
 	  <http://www.tldp.org/guides.html>.
 
 config SYSVIPC_SYSCTL
-	bool
+	def_bool y
 	depends on SYSVIPC
 	depends on SYSCTL
-	default y
 
 config POSIX_MQUEUE
 	bool "POSIX Message Queues"
@@ -257,10 +253,9 @@ config POSIX_MQUEUE
 	  If unsure, say Y.
 
 config POSIX_MQUEUE_SYSCTL
-	bool
+	def_bool y
 	depends on POSIX_MQUEUE
 	depends on SYSCTL
-	default y
 
 config BSD_PROCESS_ACCT
 	bool "BSD Process Accounting"
@@ -278,7 +273,6 @@ config BSD_PROCESS_ACCT
 config BSD_PROCESS_ACCT_V3
 	bool "BSD Process Accounting version 3 file format"
 	depends on BSD_PROCESS_ACCT
-	default n
 	help
 	  If you say Y here, the process accounting information is written
 	  in a new file format that also logs the process IDs of each
@@ -290,7 +284,6 @@ config BSD_PROCESS_ACCT_V3
 config TASKSTATS
 	bool "Export task/process statistics through netlink (EXPERIMENTAL)"
 	depends on NET
-	default n
 	help
 	  Export selected statistics for tasks/processes through the
 	  generic netlink interface. Unlike BSD process accounting, the
@@ -441,7 +434,6 @@ config RCU_FANOUT
 config RCU_FANOUT_EXACT
 	bool "Disable tree-based hierarchical RCU auto-balancing"
 	depends on TREE_RCU || TREE_PREEMPT_RCU
-	default n
 	help
 	  This option forces use of the exact RCU_FANOUT value specified,
 	  regardless of imbalances in the hierarchy.  This is useful for
@@ -455,7 +447,6 @@ config RCU_FANOUT_EXACT
 config RCU_FAST_NO_HZ
 	bool "Accelerate last non-dyntick-idle CPU's grace periods"
 	depends on TREE_RCU && NO_HZ && SMP
-	default n
 	help
 	  This option causes RCU to attempt to accelerate grace periods
 	  in order to allow the final CPU to enter dynticks-idle state
@@ -479,7 +470,6 @@ config TREE_RCU_TRACE
 config RCU_BOOST
 	bool "Enable RCU priority boosting"
 	depends on RT_MUTEXES && TINY_PREEMPT_RCU
-	default n
 	help
 	  This option boosts the priority of preempted RCU readers that
 	  block the current preemptible RCU grace period for too long.
@@ -574,7 +564,6 @@ if CGROUPS
 
 config CGROUP_DEBUG
 	bool "Example debug cgroup subsystem"
-	default n
 	help
 	  This option enables a simple cgroup subsystem that
 	  exports useful debugging information about the cgroups
@@ -702,7 +691,6 @@ config RT_GROUP_SCHED
 	bool "Group scheduling for SCHED_RR/FIFO"
 	depends on EXPERIMENTAL
 	depends on CGROUP_SCHED
-	default n
 	help
 	  This feature lets you explicitly allocate real CPU bandwidth
 	  to task groups. If enabled, it will also make it impossible to
@@ -715,7 +703,6 @@ endif #CGROUP_SCHED
 config BLK_CGROUP
 	tristate "Block IO controller"
 	depends on BLOCK
-	default n
 	---help---
 	Generic block IO controller cgroup interface. This is the common
 	cgroup interface which should be used by various IO controlling
@@ -737,7 +724,6 @@ config BLK_CGROUP
 config DEBUG_BLK_CGROUP
 	bool "Enable Block IO controller debugging"
 	depends on BLK_CGROUP
-	default n
 	---help---
 	Enable some debugging help. Currently it exports additional stat
 	files in a cgroup which can be useful for debugging.
@@ -816,7 +802,6 @@ config MM_OWNER
 config SYSFS_DEPRECATED
 	bool "enable deprecated sysfs features to support old userspace tools"
 	depends on SYSFS
-	default n
 	help
 	  This option adds code that switches the layout of the "block" class
 	  devices, to not show up in /sys/class/block/, but only in
@@ -838,7 +823,6 @@ config SYSFS_DEPRECATED
 
 config SYSFS_DEPRECATED_V2
 	bool "enabled deprecated sysfs features by default"
-	default n
 	depends on SYSFS
 	depends on SYSFS_DEPRECATED
 	help
@@ -1141,7 +1125,6 @@ config PERF_COUNTERS
 	  Say N if unsure.
 
 config DEBUG_PERF_USE_VMALLOC
-	default n
 	bool "Debug: use vmalloc to back perf mmap() buffers"
 	depends on PERF_EVENTS && DEBUG_KERNEL
 	select PERF_USE_VMALLOC
@@ -1231,7 +1214,6 @@ endchoice
 config MMAP_ALLOW_UNINITIALIZED
 	bool "Allow mmapped anonymous memory to be uninitialized"
 	depends on EXPERT && !MMU
-	default n
 	help
 	  Normally, and according to the Linux spec, anonymous memory obtained
 	  from mmap() has it's contents cleared before it is passed to
@@ -1269,13 +1251,11 @@ endmenu		# General setup
 
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
@@ -1309,7 +1289,6 @@ if MODULES
 
 config MODULE_FORCE_LOAD
 	bool "Forced module loading"
-	default n
 	help
 	  Allow loading of modules without version information (ie. modprobe
 	  --force).  Forced module loading sets the 'F' (forced) taint flag and
@@ -1366,8 +1345,7 @@ config INIT_ALL_POSSIBLE
 	  and have several arch maintainers pursuing me down dark alleys.
 
 config STOP_MACHINE
-	bool
-	default y
+	def_bool y
 	depends on (SMP && MODULE_UNLOAD) || HOTPLUG_CPU
 	help
 	  Need stop_machine() primitive.


