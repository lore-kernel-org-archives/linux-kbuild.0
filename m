Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:33440 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756382Ab0JOQOL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 15 Oct 2010 12:14:11 -0400
Message-Id: <20101015161409.316533201@goodmis.org>
Date: Fri, 15 Oct 2010 12:13:36 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 2/2] ftrace: Use objtree for C version of recordmcount
References: <20101015161334.766423984@goodmis.org>
Content-Disposition: inline; filename=0002-ftrace-Use-objtree-for-C-version-of-recordmcount.patch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Frederic Weisbecker <fweisbec@gmail.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

From: Steven Rostedt <srostedt@redhat.com>

The C version of recordmcount is compiled to a binary, which will
end up located in the objtree. If the kernel is built with O=path,
the srctree will not include the binary recordmcount caller.

Cc: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 scripts/Makefile.build |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 4d03a7e..4db60b2 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -210,7 +210,7 @@ endif
 
 ifdef CONFIG_FTRACE_MCOUNT_RECORD
 ifdef BUILD_C_RECORDMCOUNT
-cmd_record_mcount = $(srctree)/scripts/recordmcount "$(@)";
+cmd_record_mcount = $(objtree)/scripts/recordmcount "$(@)";
 else
 cmd_record_mcount = set -e ; perl $(srctree)/scripts/recordmcount.pl "$(ARCH)" \
 	"$(if $(CONFIG_CPU_BIG_ENDIAN),big,little)" \
-- 
1.7.1


