Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:36638 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728973AbeG1QQG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Jul 2018 12:16:06 -0400
Received: by mail-qt0-f195.google.com with SMTP id t5-v6so8020896qtn.3
        for <linux-kbuild@vger.kernel.org>; Sat, 28 Jul 2018 07:49:20 -0700 (PDT)
From: Jeremy Cline <jcline@redhat.com>
Subject: [PATCH v2] scripts: Add Python 3 support to tracing/draw_functrace.py
Date: Sat, 28 Jul 2018 10:48:33 -0400
Message-Id: <20180728144833.6336-1-jcline@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Jeremy Cline <jcline@redhat.com>

Use the print function. This maintains Python 2 support and should have
no functional change.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---

Changes from v1:
  - Drop "from __future__ import print_function" as Python 2 is not long
    for this world and in this case the statement and function behave
    the same way.

 scripts/tracing/draw_functrace.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tracing/draw_functrace.py b/scripts/tracing/draw_functrace.py
index db40fa04cd51..9b6dd4f36335 100755
--- a/scripts/tracing/draw_functrace.py
+++ b/scripts/tracing/draw_functrace.py
@@ -123,7 +123,7 @@ def main():
 		tree = tree.getParent(caller)
 		tree = tree.calls(callee, calltime)
 
-	print CallTree.ROOT
+	print(CallTree.ROOT)
 
 if __name__ == "__main__":
 	main()
-- 
2.17.1

