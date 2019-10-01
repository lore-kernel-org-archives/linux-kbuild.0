Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38834 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728579AbfJAKOs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Oct 2019 06:14:48 -0400
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>
Subject: [PATCH bpf] samples/bpf: kbuild: add CONFIG_SAMPLE_BPF Kconfig
Date: Tue,  1 Oct 2019 12:14:29 +0200
Message-Id: <20191001101429.24965-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: netdev@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>, linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, yamada.masahiro@socionext.com

From: Björn Töpel <bjorn.topel@intel.com>

This commit makes it possible to build the BPF samples via a Kconfig
option, CONFIG_SAMPLE_BPF. Further, it fixes that samples/bpf/ could
not be built due to a missing samples/Makefile subdir-y entry, after
the introduction of commit 394053f4a4b3 ("kbuild: make single targets
work more correctly").

Signed-off-by: Björn Töpel <bjorn.topel@intel.com>
---
 samples/Kconfig  | 4 ++++
 samples/Makefile | 1 +
 2 files changed, 5 insertions(+)

diff --git a/samples/Kconfig b/samples/Kconfig
index c8dacb4dda80..054297ac89ad 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -169,4 +169,8 @@ config SAMPLE_VFS
 	  as mount API and statx().  Note that this is restricted to the x86
 	  arch whilst it accesses system calls that aren't yet in all arches.
 
+config SAMPLE_BPF
+	bool "BPF samples"
+	depends on HEADERS_INSTALL
+
 endif # SAMPLES
diff --git a/samples/Makefile b/samples/Makefile
index 7d6e4ca28d69..49aa2f7d044b 100644
--- a/samples/Makefile
+++ b/samples/Makefile
@@ -20,3 +20,4 @@ obj-$(CONFIG_SAMPLE_TRACE_PRINTK)	+= trace_printk/
 obj-$(CONFIG_VIDEO_PCI_SKELETON)	+= v4l/
 obj-y					+= vfio-mdev/
 subdir-$(CONFIG_SAMPLE_VFS)		+= vfs
+subdir-$(CONFIG_SAMPLE_BPF)		+= bpf
-- 
2.20.1
