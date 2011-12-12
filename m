Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from serv2.oss.ntt.co.jp ([222.151.198.100]:50650 "EHLO
	serv2.oss.ntt.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752878Ab1LLDho (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 11 Dec 2011 22:37:44 -0500
Message-ID: <4EE57241.90400@oss.ntt.co.jp>
Date: Mon, 12 Dec 2011 12:17:21 +0900
From: =?UTF-8?B?RmVybmFuZG8gTHVpcyBWw6F6cXVleiBDYW8=?=
	<fernando@oss.ntt.co.jp>
MIME-Version: 1.0
Subject: [PATCH] scripts/genksyms: clean lex/yacc generated files
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Add "keywords.hash.c", "lex.lex.c", "parse.tab.c" and "parse.tab.h" to clean-list
so that they get automagically deleted at clean/mrproper time.

Signed-off-by: Fernando Luis Vazquez Cao<fernando@oss.ntt.co.jp>
---

diff -urNp linux-3.2-rc4-orig/scripts/genksyms/Makefile linux-3.2-rc4/scripts/genksyms/Makefile
--- linux-3.2-rc4-orig/scripts/genksyms/Makefile	2011-10-24 16:10:05.000000000 +0900
+++ linux-3.2-rc4/scripts/genksyms/Makefile	2011-12-12 11:37:29.159986580 +0900
@@ -11,3 +11,4 @@ HOSTCFLAGS_lex.lex.o := -I$(src)
  # dependencies on generated files need to be listed explicitly
  $(obj)/lex.lex.o: $(obj)/keywords.hash.c $(obj)/parse.tab.h

+clean-files	:= keywords.hash.c lex.lex.c parse.tab.c parse.tab.h

