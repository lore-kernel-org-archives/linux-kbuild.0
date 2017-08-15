Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:35597 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753780AbdHOK53 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Aug 2017 06:57:29 -0400
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: special handle of scripts/kconfig/zconf.tab.o
Message-ID: <5992D4DF.2080405@cn.fujitsu.com>
Date: Tue, 15 Aug 2017 19:02:55 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Masahiro-san,

I have a question about make *config. In scripts/kconfig/Makefile, there
is following statement:

$(obj)/zconf.tab.o: $(obj)/zconf.lex.c $(obj)/zconf.hash.c

and the $(obj)/zconf.{tab,hash,lex}.c match the rule in Makefile.lib:

$(obj)/%: $(src)/%_shipped
        $(call cmd,shipped)

and cmd_shipped just transform the _shipped file to .c via `cat`.

And zconf.tab.c includes several *other* .c files which make the whole
process a little obscure, because there are not corresponding .o files
for the *other* .c files.

My questions is: Does this special handling has other meanings that I
may miss? Or just legacy.

Because a straightforward way in my mind would be:

rename zconf.{tab,hash,lex}.c_shipped to zconf.{tab,hash,lex}.c, then
has following in the Makefile

common-objs := zconf.tab.o zconf.hash.o zconf.lex.o util.o etc...
conf-objs := conf.o $(common-objs)

-- 
Sincerely,
Cao jin


