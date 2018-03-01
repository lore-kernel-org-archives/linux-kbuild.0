Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36610 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965096AbeCAI50 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Mar 2018 03:57:26 -0500
Date: Thu, 1 Mar 2018 10:57:21 +0200
From: Dafna Hirschfeld <dafna3@gmail.com>
Subject: [PATCH] Coccinelle: memdup: Fix typo in warning messages
Message-ID: <20180301085717.GA4508@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, michal.lkml@markovi.net, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: outreachy-kernel@googlegroups.com

Replace 'kmemdep' with 'kmemdup' in warning messages.

Signed-off-by: Dafna Hirschfeld <dafna3@gmail.com>
Acked-by: Julia Lawall <julia.lawall@lip6.fr>
---
 scripts/coccinelle/api/memdup.cocci | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/coccinelle/api/memdup.cocci b/scripts/coccinelle/api/memdup.cocci
index 1249b72..8fd6437 100644
--- a/scripts/coccinelle/api/memdup.cocci
+++ b/scripts/coccinelle/api/memdup.cocci
@@ -56,10 +56,10 @@ statement S;
 p << r.p;
 @@
 
-coccilib.org.print_todo(p[0], "WARNING opportunity for kmemdep")
+coccilib.org.print_todo(p[0], "WARNING opportunity for kmemdup")
 
 @script:python depends on report@
 p << r.p;
 @@
 
-coccilib.report.print_report(p[0], "WARNING opportunity for kmemdep")
+coccilib.report.print_report(p[0], "WARNING opportunity for kmemdup")
-- 
2.7.4

