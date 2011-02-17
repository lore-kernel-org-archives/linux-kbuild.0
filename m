Return-Path: <linux-kbuild-owner@vger.kernel.org>
Message-Id: <4D5D3309020000780003264A@vpn.id2.novell.com>
Date: Thu, 17 Feb 2011 13:39:05 +0000
From: "Jan Beulich" <JBeulich@novell.com>
Subject: [PATCH] streamline kernel/irq/Kconfig
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: tglx@linutronix.de
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

"def_bool n" without prompt is pointless, these should be just "bool".

Signed-off-by: Jan Beulich <jbeulich@novell.com>

---
 kernel/irq/Kconfig |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

--- 2.6.38-rc5/kernel/irq/Kconfig
+++ 2.6.38-rc5-kconfig-irq/kernel/irq/Kconfig
@@ -1,5 +1,5 @@
 config HAVE_GENERIC_HARDIRQS
-	def_bool n
+	bool
 
 if HAVE_GENERIC_HARDIRQS
 menu "IRQ subsystem"
@@ -11,26 +11,26 @@ config GENERIC_HARDIRQS
 
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



