Return-Path: <linux-kbuild-owner@vger.kernel.org>
Message-Id: <4D5D3361020000780003264D@vpn.id2.novell.com>
Date: Thu, 17 Feb 2011 13:40:33 +0000
From: "Jan Beulich" <JBeulich@novell.com>
Subject: [PATCH] streamline Kconfig-s under lib/
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

"def_bool n" without prompt is pointless, this should be just "bool".

'n' defaults are also pretty pointless and actually bogus when used
with prompt-less config options.

The "bool"/"default y" pair with no prompt can be expressed more
compactly using def_bool.

Signed-off-by: Jan Beulich <jbeulich@novell.com>

---
 lib/Kconfig    |    5 ++---
 lib/xz/Kconfig |    2 --
 2 files changed, 2 insertions(+), 5 deletions(-)

--- 2.6.38-rc5/lib/Kconfig
+++ 2.6.38-rc5-kconfig-lib/lib/Kconfig
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
--- 2.6.38-rc5/lib/xz/Kconfig
+++ 2.6.38-rc5-kconfig-lib/lib/xz/Kconfig
@@ -44,11 +44,9 @@ config XZ_DEC_SPARC
 
 config XZ_DEC_BCJ
 	bool
-	default n
 
 config XZ_DEC_TEST
 	tristate "XZ decompressor tester"
-	default n
 	depends on XZ_DEC
 	help
 	  This allows passing .xz files to the in-kernel XZ decoder via



