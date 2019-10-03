Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37165 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728432AbfJCDS5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 23:18:57 -0400
Received: by mail-pg1-f193.google.com with SMTP id c17so848653pgg.4
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Oct 2019 20:18:57 -0700 (PDT)
Message-Id: <20191003031312.433635881@gmail.com>
Date: Wed, 02 Oct 2019 20:13:16 -0700
From: rd.dunlab@gmail.com
Subject: [PATCH 4/4] scripts: namespace.pl: add blank section separator line
References: <20191003031312.157994411@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline; filename=scr-namespace-blank-sep-line.patch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <rd.dunlab@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, rdunlap@infradead.org

Most namespace report sections are separated by blank lines, but a
blank line is needed before the "multiply defined" output as a
separator, to make it easier to find the beginning of this section
of output.

Signed-off-by: Randy Dunlap <rd.dunlab@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
patch 4/4:
 scripts/namespace.pl |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20191002.orig/scripts/namespace.pl
+++ linux-next-20191002/scripts/namespace.pl
@@ -368,6 +368,7 @@ sub drop_def
 
 sub list_multiply_defined
 {
+	printf "\n";
 	foreach my $name (keys(%def)) {
 		if ($#{$def{$name}} > 0) {
 			# Special case for cond_syscall
