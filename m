Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47662 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729660AbeHFP0z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Aug 2018 11:26:55 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w76DE8BK029249
        for <linux-kbuild@vger.kernel.org>; Mon, 6 Aug 2018 09:17:51 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2kpp7psxyd-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Aug 2018 09:17:49 -0400
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <gor@linux.ibm.com>;
        Mon, 6 Aug 2018 14:17:48 +0100
Date: Mon, 6 Aug 2018 15:17:41 +0200
From: Vasily Gorbik <gor@linux.ibm.com>
Subject: [PATCH 0/4] ftrace build improvements
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Message-Id: <cover.thread-aa7b8d.your-ad-here.call-01533557518-ext-9465@work.hours>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

Support for -fentry -mrecord-mcount and -mnop-mcount has been added for
s390 in gcc master branch. An attempt to build 4.18 for s390 with that
gcc would produce a kernel with no __mcount_loc though because of the
new condition in scripts/Makefile.build:210 which disables recordmcount
tool if compiler supports -mrecord-mcount (s390 relies on combination
of -mhotpatch=0,3 gcc flag and recordmcount.pl).

This patch series adds s390 ftrace support based on combination of -pg
-fentry -mrecord-mcount and -mnop-mcount gcc flags (that fixes issue
mentioned above). At the same time this patch series fixes couple of
minor issues and adds -mnop-mcount gcc flag support (utilized by s390).

Vasily Gorbik (4):
  trace: handle CC_FLAGS_FTRACE more accurately
  trace: avoid calling cc-option -mrecord-mcount for every Makefile
  trace: add -mcount-nop option support
  s390/ftrace: add -mfentry and -mnop-mcount support

 Makefile                       | 24 ++++++++++++++++++++----
 arch/s390/Kconfig              |  2 ++
 arch/s390/Makefile             | 16 +++++++++-------
 arch/s390/include/asm/ftrace.h |  6 +++---
 arch/s390/kernel/ftrace.c      |  2 +-
 arch/s390/kernel/mcount.S      |  2 +-
 kernel/trace/Kconfig           |  5 +++++
 kernel/trace/ftrace.c          |  2 ++
 scripts/Makefile.build         |  9 +++------
 9 files changed, 46 insertions(+), 22 deletions(-)

-- 
2.18.0.13.gd42ae10

