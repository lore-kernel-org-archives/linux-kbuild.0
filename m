Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:58406 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750888Ab0HQFpe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Aug 2010 01:45:34 -0400
Received: by gyg10 with SMTP id 10so2221679gyg.19
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2010 22:45:33 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH] kbuild: confdata.c explicitly reference errno, thus need <errno.h>
Date: Tue, 17 Aug 2010 01:40:20 -0400
Message-Id: <1282023620-15499-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

This fixes:
% gmake LKC_GENPARSER=1 menuconfig
[...]
scripts/kconfig/confdata.c:739: error: 'errno' undeclared (first use in this function)
scripts/kconfig/confdata.c:739: error: (Each undeclared identifier is reported only once
scripts/kconfig/confdata.c:739: error: for each function it appears in.)
scripts/kconfig/confdata.c:739: error: 'ENOENT' undeclared (first use in this function)

triggered on NetBSD.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/kconfig/confdata.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index c39327e..3bcd434 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -5,6 +5,7 @@
 
 #include <sys/stat.h>
 #include <ctype.h>
+#include <errno.h>
 #include <fcntl.h>
 #include <stdio.h>
 #include <stdlib.h>
-- 
1.7.2.30.gc37d7.dirty

