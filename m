Return-Path: <linux-kbuild-owner@vger.kernel.org>
Message-Id: <4D5D3421020000780003265A@vpn.id2.novell.com>
Date: Thu, 17 Feb 2011 13:43:45 +0000
From: "Jan Beulich" <JBeulich@novell.com>
Subject: [PATCH] streamline Kconfig-s under fs/
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: viro@zeniv.linux.org.uk
Cc: linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org

"def_bool n" without prompt is pointless, this should be just "bool".

'n' defaults are also pretty pointless and actually bogus when used
with prompt-less config options.

The "bool"/"default y" pair with no prompt can be expressed more
compactly using def_bool.

Signed-off-by: Jan Beulich <jbeulich@novell.com>

---
 fs/Kconfig        |   11 ++++-------
 fs/Kconfig.binfmt |    2 +-
 fs/notify/Kconfig |    2 +-
 fs/quota/Kconfig  |    5 +----
 4 files changed, 7 insertions(+), 13 deletions(-)

--- 2.6.38-rc5/fs/Kconfig
+++ 2.6.38-rc5-kconfig-fs/fs/Kconfig
@@ -12,9 +12,8 @@ source "fs/ext4/Kconfig"
 
 config FS_XIP
 # execute in place
-	bool
+	def_bool y
 	depends on EXT2_FS_XIP
-	default y
 
 source "fs/jbd/Kconfig"
 source "fs/jbd2/Kconfig"
@@ -44,7 +43,7 @@ endif # BLOCK
 # this symbol for ifdefs in core code.
 #
 config FS_POSIX_ACL
-	def_bool n
+	bool
 
 config EXPORTFS
 	tristate
@@ -217,19 +216,17 @@ config LOCKD
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
--- 2.6.38-rc5/fs/Kconfig.binfmt
+++ 2.6.38-rc5-kconfig-fs/fs/Kconfig.binfmt
@@ -82,7 +82,7 @@ config BINFMT_SHARED_FLAT
 	  Support FLAT shared libraries
 
 config HAVE_AOUT
-       def_bool n
+       bool
 
 config BINFMT_AOUT
 	tristate "Kernel support for a.out and ECOFF binaries"
--- 2.6.38-rc5/fs/notify/Kconfig
+++ 2.6.38-rc5-kconfig-fs/fs/notify/Kconfig
@@ -1,5 +1,5 @@
 config FSNOTIFY
-	def_bool n
+	bool
 
 source "fs/notify/dnotify/Kconfig"
 source "fs/notify/inotify/Kconfig"
--- 2.6.38-rc5/fs/quota/Kconfig
+++ 2.6.38-rc5-kconfig-fs/fs/quota/Kconfig
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



