Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:45679 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727326AbfGEPOu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Jul 2019 11:14:50 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] scripts/tags.sh: remove unused environment variables from comments
Date: Sat,  6 Jul 2019 00:14:31 +0900
Message-Id: <20190705151431.29122-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190705151431.29122-1-yamada.masahiro@socionext.com>
References: <20190705151431.29122-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This script has no reference to ${ARCH}, ${src}, ${obj}.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/tags.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index f56edeb08739..684db72a8386 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -6,7 +6,7 @@
 # mode may be any of: tags, TAGS, cscope
 #
 # Uses the following environment variables:
-# ARCH, SUBARCH, SRCARCH, srctree, src, obj
+# SUBARCH, SRCARCH, srctree
 
 if [ "$KBUILD_VERBOSE" = "1" ]; then
 	set -x
@@ -35,7 +35,7 @@ elif [ "${ALLSOURCE_ARCHS}" = "all" ]; then
 	ALLSOURCE_ARCHS=$(find ${tree}arch/ -mindepth 1 -maxdepth 1 -type d -printf '%f ')
 fi
 
-# find sources in arch/$ARCH
+# find sources in arch/$1
 find_arch_sources()
 {
 	for i in $archincludedir; do
-- 
2.17.1
