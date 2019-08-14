Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f201.google.com ([209.85.215.201]:46526 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbfHNFxB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Aug 2019 01:53:01 -0400
Received: by mail-pg1-f201.google.com with SMTP id u1so67848704pgr.13
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2019 22:53:01 -0700 (PDT)
Date: Tue, 13 Aug 2019 22:51:08 -0700
In-Reply-To: <20190814055108.214253-1-brendanhiggins@google.com>
Message-Id: <20190814055108.214253-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190814055108.214253-1-brendanhiggins@google.com>
Subject: [PATCH v13 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
From: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, Alexander.Levin@microsoft.com, Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org, richard@nod.at, rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>, Iurii Zaikin <yzaikin@google.com>

Add entry for the new proc sysctl KUnit test to the PROC SYSCTL section,
and add Iurii as a maintainer.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Cc: Iurii Zaikin <yzaikin@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Acked-by: Luis Chamberlain <mcgrof@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f0bd77e8a8a2f..0cac78807137b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12965,12 +12965,14 @@ F:	Documentation/filesystems/proc.txt
 PROC SYSCTL
 M:	Luis Chamberlain <mcgrof@kernel.org>
 M:	Kees Cook <keescook@chromium.org>
+M:	Iurii Zaikin <yzaikin@google.com>
 L:	linux-kernel@vger.kernel.org
 L:	linux-fsdevel@vger.kernel.org
 S:	Maintained
 F:	fs/proc/proc_sysctl.c
 F:	include/linux/sysctl.h
 F:	kernel/sysctl.c
+F:	kernel/sysctl-test.c
 F:	tools/testing/selftests/sysctl/
 
 PS3 NETWORK SUPPORT
-- 
2.23.0.rc1.153.gdeed80330f-goog
