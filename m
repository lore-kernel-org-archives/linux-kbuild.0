Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:50294 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751651AbeBBQVd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Feb 2018 11:21:33 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 6/7] Kbuild: lto: clean build artifacts
Date: Fri,  2 Feb 2018 17:21:03 +0100
Message-Id: <20180202162104.2300532-6-arnd@arndb.de>
In-Reply-To: <20180202161550.2106846-1-arnd@arndb.de>
References: <20180202161550.2106846-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <ak@linux.intel.com>
Cc: Nicolas Pitre <nico@linaro.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

During test-building I filled up my disk with stale files
that never got cleaned. This should make sure we remove them
all.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/link-vmlinux.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 964b2ee855dd..130df0781072 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -113,7 +113,7 @@ vmlinux_link()
 				${1}"
 		fi
 
-		${LDFINAL} ${LDFLAGS} ${LDFLAGS_vmlinux} -o ${2}		\
+		${LDFINAL} ${LDFLAGS} ${LDFLAGS_vmlinux} -o ${2}	\
 			-T ${lds} ${objects}
 	else
 		if [ -n "${CONFIG_THIN_ARCHIVES}" ]; then
@@ -195,6 +195,8 @@ cleanup()
 	rm -f System.map
 	rm -f vmlinux
 	rm -f vmlinux.o
+	rm -f cc*.ltrans*.o
+	rm -f vmlinux.o.* vmlinux.ltrans* vmlinux.wpa*
 }
 
 on_exit()
-- 
2.9.0

