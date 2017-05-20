Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.polytechnique.org ([129.104.30.34]:59795 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751260AbdETLhJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 May 2017 07:37:09 -0400
From: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Subject: [PATCH 1/1] genksyms: add printf format attribute to error_with_pos()
Date: Sat, 20 May 2017 13:27:00 +0200
Message-Id: <20170520112700.27823-1-nicolas.iooss_linux@m4x.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nicolas Iooss <nicolas.iooss_linux@m4x.org>

When compiling with -Wsuggest-attribute=format in HOSTCFLAGS, gcc
complains that error_with_pos() may be declared with a printf format
attribute:

    scripts/genksyms/genksyms.c:726:3: warning: function might be
    possible candidate for ‘gnu_printf’ format attribute
    [-Wsuggest-attribute=format]
       vfprintf(stderr, fmt, args);
       ^~~~~~~~

This would allow catching printf-format errors at compile time in
callers to error_with_pos(). Add this attribute.

Signed-off-by: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
---

I am sending this to the maintainers listed in section "KERNEL BUILD +
files below scripts/ (unless maintained elsewhere)" even though it does
not list scripts/genksyms/. Should this directory be added in
MAINTAINERS?

 scripts/genksyms/genksyms.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/genksyms/genksyms.h b/scripts/genksyms/genksyms.h
index 3bffdcaaa274..b724a0290c75 100644
--- a/scripts/genksyms/genksyms.h
+++ b/scripts/genksyms/genksyms.h
@@ -75,7 +75,7 @@ struct string_list *copy_list_range(struct string_list *start,
 int yylex(void);
 int yyparse(void);
 
-void error_with_pos(const char *, ...);
+void error_with_pos(const char *, ...) __attribute__ ((format(printf, 1, 2)));
 
 /*----------------------------------------------------------------------*/
 #define xmalloc(size) ({ void *__ptr = malloc(size);		\
-- 
2.12.2

