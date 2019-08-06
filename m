Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:23458 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732683AbfHFK44 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 06:56:56 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x76Aukxc036833
        for <linux-kbuild@vger.kernel.org>; Tue, 6 Aug 2019 06:56:55 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2u781b0g70-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Aug 2019 06:56:55 -0400
Received: from localhost
        by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <gor@linux.ibm.com>;
        Tue, 6 Aug 2019 11:56:53 +0100
Date: Tue, 6 Aug 2019 12:56:48 +0200
From: Vasily Gorbik <gor@linux.ibm.com>
Subject: [PATCH 2/2] s390/build: use size command to perform empty .bss check
References: <patch-1.thread-2257a1.git-188f5a3d81d5.your-ad-here.call-01565088755-ext-5120@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <patch-1.thread-2257a1.git-188f5a3d81d5.your-ad-here.call-01565088755-ext-5120@work.hours>
Message-Id: <patch-2.thread-2257a1.git-2257a1c53d4a.your-ad-here.call-01565088755-ext-5120@work.hours>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Currently empty .bss checks performed do not pay attention to "common
objects" in object files which end up in .bss section eventually.

The "size" tool is a part of binutils and since version 2.18 provides
"--common" command line option, which allows to account "common objects"
sizes in .bss section size. Utilize "size --common" to perform accurate
check that .bss section is unused. Besides that the size tool handles
object files without .bss section gracefully and doesn't require
additional objdump run.

The linux kernel requires binutils 2.20 since 4.13.

Kbuild exports OBJSIZE to reference the right size tool.

Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
---
 arch/s390/scripts/Makefile.chkbss | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/s390/scripts/Makefile.chkbss b/arch/s390/scripts/Makefile.chkbss
index 884a9caff5fb..ba1d7a8a242f 100644
--- a/arch/s390/scripts/Makefile.chkbss
+++ b/arch/s390/scripts/Makefile.chkbss
@@ -11,8 +11,7 @@ chkbss: $(addprefix $(obj)/, $(chkbss-files))
 
 quiet_cmd_chkbss = CHKBSS  $<
       cmd_chkbss = \
-	if $(OBJDUMP) -h $< | grep -q "\.bss" && \
-	   ! $(OBJDUMP) -j .bss -w -h $< | awk 'END { if ($$3) exit 1 }'; then \
+	if ! $(OBJSIZE) --common $< | awk 'END { if ($$3) exit 1 }'; then \
 		echo "error: $< .bss section is not empty" >&2; exit 1; \
 	fi; \
 	touch $@;
-- 
2.21.0
