Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2120.oracle.com ([156.151.31.85]:37120 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727614AbfHMGLb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 02:11:31 -0400
From: Knut Omang <knut.omang@oracle.com>
Subject: [RFC 05/19] ktf: Implementation of ktf support for overriding function entry and return.
Date: Tue, 13 Aug 2019 08:09:20 +0200
Message-Id: <1fccfe3062ba6c7a2c8171df8e41975e28dae9ec.1565676440.git-series.knut.omang@oracle.com>
In-Reply-To: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
References: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shreyans Devendra Doshi <0xinfosect0r@gmail.com>, Alan Maguire <alan.maguire@oracle.com>, Brendan Higgins <brendanhiggins@google.com>, Kevin Hilman <khilman@baylibre.com>, Hidenori Yamaji <hidenori.yamaji@sony.com>, Frank Rowand <frowand.list@gmail.com>, Timothy Bird <Tim.Bird@sony.com>, Luis Chamberlain <mcgrof@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, Knut Omang <knut.omang@oracle.com>

From: Alan Maguire <alan.maguire@oracle.com>

This is a very powerful and yet simple way to verify or modify
behaviour of kernel calls. It uses the same technique as the error
injection framework in kernel/fail_function.c to to override function
entry and return. In addition to error injection, this is very useful
to for instance verify that a particular API actually ends up being
called, and in the right way, as an effect of a test.

ktf_override.c:  support for overriding function entry.
ktf_override.h:  Function override support interface for KTF.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Signed-off-by: Knut Omang <knut.omang@oracle.com>
---
 tools/testing/selftests/ktf/kernel/ktf_override.c | 45 ++++++++++++++++-
 tools/testing/selftests/ktf/kernel/ktf_override.h | 15 +++++-
 2 files changed, 60 insertions(+)
 create mode 100644 tools/testing/selftests/ktf/kernel/ktf_override.c
 create mode 100644 tools/testing/selftests/ktf/kernel/ktf_override.h

diff --git a/tools/testing/selftests/ktf/kernel/ktf_override.c b/tools/testing/selftests/ktf/kernel/ktf_override.c
new file mode 100644
index 0000000..7f046c8
--- /dev/null
+++ b/tools/testing/selftests/ktf/kernel/ktf_override.c
@@ -0,0 +1,45 @@
+/*
+ * Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.
+ *    Author: Alan Maguire <alan.maguire@oracle.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ *
+ * ktf_override.c: support for overriding function entry.
+ */
+#include <linux/kprobes.h>
+#include <linux/ptrace.h>
+#include "ktf.h"
+#include "ktf_override.h"
+
+asmlinkage void ktf_just_return_func(void);
+
+asm(
+	".type ktf_just_return_func, @function\n"
+	".globl ktf_just_return_func\n"
+	"ktf_just_return_func:\n"
+	"	ret\n"
+	".size ktf_just_return_func, .-ktf_just_return_func\n"
+);
+
+void ktf_post_handler(struct kprobe *kp, struct pt_regs *regs,
+		      unsigned long flags)
+{
+	/*
+	 * A dummy post handler is required to prohibit optimizing, because
+	 * jump optimization does not support execution path overriding.
+	 */
+}
+EXPORT_SYMBOL(ktf_post_handler);
+
+void ktf_override_function_with_return(struct pt_regs *regs)
+{
+	KTF_SET_INSTRUCTION_POINTER(regs, (unsigned long)&ktf_just_return_func);
+}
+EXPORT_SYMBOL(ktf_override_function_with_return);
+NOKPROBE_SYMBOL(ktf_override_function_with_return);
+
+int ktf_register_override(struct kprobe *kp)
+{
+	return register_kprobe(kp);
+}
+EXPORT_SYMBOL(ktf_register_override);
diff --git a/tools/testing/selftests/ktf/kernel/ktf_override.h b/tools/testing/selftests/ktf/kernel/ktf_override.h
new file mode 100644
index 0000000..8a9cf39
--- /dev/null
+++ b/tools/testing/selftests/ktf/kernel/ktf_override.h
@@ -0,0 +1,15 @@
+/*
+ * Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.
+ *    Author: Alan Maguire <alan.maguire@oracle.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ *
+ * ktf_override.h: Function override support interface for KTF.
+ */
+#include <linux/kprobes.h>
+#include "ktf.h"
+
+void ktf_post_handler(struct kprobe *kp, struct pt_regs *regs,
+		      unsigned long flags);
+void ktf_override_function_with_return(struct pt_regs *regs);
+int ktf_register_override(struct kprobe *kp);
-- 
git-series 0.9.1
