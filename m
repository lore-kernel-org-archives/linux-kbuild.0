Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:60142 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387586AbfGYIFm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 04:05:42 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: detect missing "WITH Linux-syscall-note" for uapi headers
Date: Thu, 25 Jul 2019 17:05:13 +0900
Message-Id: <20190725080513.4071-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

UAPI headers licensed under GPL are supposed to have exception
"WITH Linux-syscall-note" so that they can be included into non-GPL
user space application code.

Unfortunately, people often miss to add it. Break 'make headers'
when any of exported headers lacks the exception note so that the
0-day bot can easily catch it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

This patch depends on the following:

https://lore.kernel.org/patchwork/patch/1105289/

I will turn on the error after all headers are fixed.


 scripts/headers_install.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 47f6f3ea0771..bbaf29386995 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -23,6 +23,12 @@ TMPFILE=$OUTFILE.tmp
 
 trap 'rm -f $OUTFILE $TMPFILE' EXIT
 
+# SPDX-License-Identifier with GPL variants must have "WITH Linux-syscall-note"
+if [ -n "$(sed -n -e "/SPDX-License-Identifier:.*GPL-/{/WITH Linux-syscall-note/!p}" $INFILE)" ]; then
+	echo "error: $INFILE: missing \"WITH Linux-syscall-note\" for SPDX-License-Identifier" >&2
+	exit 1
+fi
+
 sed -E -e '
 	s/([[:space:](])(__user|__force|__iomem)[[:space:]]/\1/g
 	s/__attribute_const__([[:space:]]|$)/\1/g
-- 
2.17.1
