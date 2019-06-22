Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:43322 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbfFVGzv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Jun 2019 02:55:51 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: fix 'No such file or directory' warning for headers_install
Date: Sat, 22 Jun 2019 15:55:20 +0900
Message-Id: <20190622065520.10105-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Since commit d5470d14431e ("kbuild: re-implement Makefile.headersinst
without recursion"), headers_install emits an ugly warning.

$ make headers_install
  [ snip ]
  UPD     include/generated/uapi/linux/version.h
find: ‘./include/uapi/Kbuild’: No such file or directory
  HDRINST usr/include/video/uvesafb.h
    ...

This happens for GNU Make <= 4.2.1

When I wrote that commit, I missed this warning because I was using the
state-of-the-art Make version compiled from the git tree.

$(wildcard $(src)/*/) is intended to match to only existing directories
since it has a trailing slash, but actually matches to regular files too.
(include/uapi/Kbuild in this case)

This is a bug of GNU Make, and was fixed by:

| commit b7acb10e86dc8f5fdf2a2bbd87e1059c315e31d6
| Author: spagoveanu@gmail.com <spagoveanu@gmail.com>
| Date:   Wed Jun 20 02:03:48 2018 +0300
|
|    * src/dir.c: Preserve glob d_type field

We need to cater to old Make versions. Add '$(filter %/,...) to filter
out the regular files.

Fixes: d5470d14431e ("kbuild: re-implement Makefile.headersinst without recursion")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.headersinst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
index d2b572a7a628..ddc764838df2 100644
--- a/scripts/Makefile.headersinst
+++ b/scripts/Makefile.headersinst
@@ -20,8 +20,10 @@ dst := usr/include
 
 -include $(src)/Kbuild
 
-src-subdirs := $(patsubst $(src)/%/,%,$(wildcard $(src)/*/))
-gen-subdirs := $(patsubst $(gen)/%/,%,$(wildcard $(gen)/*/))
+# $(filter %/, ...) is needed to workaround the bug for GNU Make <= 4.2.1
+# $(wildcard $(src)/*/) contains not only directories but also regular files.
+src-subdirs := $(patsubst $(src)/%/,%,$(filter %/, $(wildcard $(src)/*/)))
+gen-subdirs := $(patsubst $(gen)/%/,%,$(filter %/, $(wildcard $(gen)/*/)))
 all-subdirs := $(sort $(src-subdirs) $(gen-subdirs))
 
 src-headers := $(if $(src-subdirs), $(shell cd $(src) && find $(src-subdirs) -name '*.h'))
-- 
2.17.1
