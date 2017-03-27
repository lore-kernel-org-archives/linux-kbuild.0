Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:33298 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751852AbdC0Fsh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Mar 2017 01:48:37 -0400
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/5] MAINTAINERS: Fix a dead URL to ftp.kernel.org
Date: Mon, 27 Mar 2017 14:47:27 +0900
Message-Id: <20170327054731.31882-2-sj38.park@gmail.com>
In-Reply-To: <20170327054731.31882-1-sj38.park@gmail.com>
References: <20170327054731.31882-1-sj38.park@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: rml@tech9.net, axboe@fb.com, shli@kernel.org, raven@themaw.net, yamada.masahito@socionext.com, mmarek@suse.com
Cc: linux-raid@vger.kernel.org, autofs@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>

As ftp.kernel.org is closed [0], this commit fixes a dead URL to
ftp.kernel.org in MAINTAINERS file to use www.kernel.org instead.

[0] https://www.kernel.org/shutting-down-ftp-services.html

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9c768d79cf3f..6367f0739394 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10158,7 +10158,7 @@ W:	http://sourceforge.net/projects/accel-pptp
 PREEMPTIBLE KERNEL
 M:	Robert Love <rml@tech9.net>
 L:	kpreempt-tech@lists.sourceforge.net
-W:	ftp://ftp.kernel.org/pub/linux/kernel/people/rml/preempt-kernel
+W:	https://www.kernel.org/pub/linux/kernel/people/rml/preempt-kernel
 S:	Supported
 F:	Documentation/preempt-locking.txt
 F:	include/linux/preempt.h
-- 
2.10.0

