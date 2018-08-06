Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35814 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731523AbeHFQqj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Aug 2018 12:46:39 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w76EU9lO004868
        for <linux-kbuild@vger.kernel.org>; Mon, 6 Aug 2018 10:37:15 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2kpnqcqfqb-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Aug 2018 10:37:14 -0400
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <gor@linux.ibm.com>;
        Mon, 6 Aug 2018 15:37:13 +0100
Date: Mon, 6 Aug 2018 16:37:07 +0200
From: Vasily Gorbik <gor@linux.ibm.com>
Subject: [PATCH 0/1] kbuild: allow alternate src for target's implicit
 prerequisite
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Message-Id: <cover.thread-dc1802.your-ad-here.call-01533563120-ext-8550@work.hours>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

While adding more functionality to s390's decompressor code and looking
at other architectures implementation there is an apparent need to
reuse some code outside of arch/*/boot folder (files like lib/ctype.c,
lib/cmdline.c and others). On s390 there is a need to rebuild and reuse
few additional files to print out early error messages (console support,
ebcdic, arch/s390/lib/mem.S). This list will be extended with additional
features implementation (like kaslr, etc).

Current solution seems to be reverse including source files, which is
ugly. The following patch proposes another way to address that problem,
which in the end would we used like:

in some arch/*/boot/Makefile:
obj-y := ctype.o cmdline.o mem.o ..some local files..

SRCDIR_ctype.o := lib
SRCDIR_cmdline.o := lib
SRCDIR_mem.o := arch/s390/lib

Vasily Gorbik (1):
  kbuild: allow alternate src for target's implicit prerequisite

 scripts/Makefile.build | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

-- 
2.18.0.13.gd42ae10

