Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:43180 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388006AbeGTUZ1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jul 2018 16:25:27 -0400
Received: by mail-qt0-f171.google.com with SMTP id f18-v6so11267592qtp.10
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Jul 2018 12:35:45 -0700 (PDT)
From: Jeremy Cline <jcline@redhat.com>
Subject: [PATCH] scripts: Add Python 3 support to tracing/draw_functrace.py
Date: Fri, 20 Jul 2018 15:35:28 -0400
Message-Id: <20180720193528.1341-1-jcline@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Jeremy Cline <jcline@redhat.com>

Use the print function. This maintains Python 2 support and should have
no functional change.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 scripts/tracing/draw_functrace.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/tracing/draw_functrace.py b/scripts/tracing/draw_functrace.py
index db40fa04cd51..7d44e796d362 100755
--- a/scripts/tracing/draw_functrace.py
+++ b/scripts/tracing/draw_functrace.py
@@ -20,6 +20,7 @@ Usage:
 	$ scripts/draw_functrace.py < raw_trace_func > draw_functrace
 	Then you have your drawn trace in draw_functrace
 """
+from __future__ import print_function
 
 
 import sys, re
@@ -123,7 +124,7 @@ def main():
 		tree = tree.getParent(caller)
 		tree = tree.calls(callee, calltime)
 
-	print CallTree.ROOT
+	print(CallTree.ROOT)
 
 if __name__ == "__main__":
 	main()
-- 
2.17.1

