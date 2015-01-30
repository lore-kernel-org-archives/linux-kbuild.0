Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from david.siemens.de ([192.35.17.14]:49836 "EHLO david.siemens.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932132AbbA3HZi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 Jan 2015 02:25:38 -0500
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH v12 23/28] scripts/gdb: Ignore byte-compiled python files
Date: Fri, 30 Jan 2015 08:24:52 +0100
Message-Id: <3cf54d52b07feaac667de437267bb657c7d2974a.1422602696.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1422602696.git.jan.kiszka@siemens.com>
References: <cover.1422602696.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1422602696.git.jan.kiszka@siemens.com>
References: <cover.1422602696.git.jan.kiszka@siemens.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Wessel <jason.wessel@windriver.com>, kgdb-bugreport@lists.sourceforge.net, Andi Kleen <andi@firstfloor.org>, Ben Widawsky <ben@bwidawsk.net>, Borislav Petkov <bp@suse.de>, Daniel Thompson <daniel.thompson@linaro.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

From: Daniel Thompson <daniel.thompson@linaro.org>

Using the gdb scripts leaves byte-compiled python files in the scripts/
directory. These should be ignored by git.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org
[Jan: drop redundant mrproper rule as suggested by Michal]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .gitignore                   | 1 +
 scripts/gdb/linux/.gitignore | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 scripts/gdb/linux/.gitignore

diff --git a/.gitignore b/.gitignore
index ce57b79..ecb89e3 100644
--- a/.gitignore
+++ b/.gitignore
@@ -43,6 +43,7 @@ Module.symvers
 /TAGS
 /linux
 /vmlinux
+/vmlinux-gdb.py
 /vmlinuz
 /System.map
 /Module.markers
diff --git a/scripts/gdb/linux/.gitignore b/scripts/gdb/linux/.gitignore
new file mode 100644
index 0000000..52e4e61
--- /dev/null
+++ b/scripts/gdb/linux/.gitignore
@@ -0,0 +1,2 @@
+*.pyc
+*.pyo
-- 
2.1.4

