Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:15973 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727240AbfD0PXQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Apr 2019 11:23:16 -0400
From: Daniel Dadap <ddadap@nvidia.com>
Subject: [PATCH v2] scripts: override locale from environment when running recordmcount.pl
Date: Sat, 27 Apr 2019 11:21:34 -0400
Message-ID: <20190427152133.148944-1-ddadap@nvidia.com>
In-Reply-To: <497562b7-c07e-9067-5b7f-f96844bfc5bf@nvidia.com>
References: <497562b7-c07e-9067-5b7f-f96844bfc5bf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com
Cc: Daniel Dadap <ddadap@nvidia.com>

recordmcount.pl uses a set of regular expressions to parse the output of
objdump(1). However, if objdump(1) output is localized, it may not match
the regular expressions, thereby preventing recordmcount.pl from parsing
object files correctly.

In order to allow recordmcount.pl to function correctly regardless of the
current locale settings, set LANG=C when running objdump(1). LC_ALL is
already unset in the top-level Makefile, so it is not necessary to also
override that environment variable.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
Reviewed-by: Robert Morell <rmorell@nvidia.com>
---
 scripts/recordmcount.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
index 68841d01162c..ffea46287f83 100755
--- a/scripts/recordmcount.pl
+++ b/scripts/recordmcount.pl
@@ -493,7 +493,7 @@ sub update_funcs
 #
 # Step 2: find the sections and mcount call sites
 #
-open(IN, "$objdump -hdr $inputfile|") || die "error running $objdump";
+open(IN, "LANG=C $objdump -hdr $inputfile|") || die "error running $objdump";
 
 my $text;
 
-- 
2.18.1
