Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:52865 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757730Ab1BKQVx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Feb 2011 11:21:53 -0500
Received: by bwz15 with SMTP id 15so3359782bwz.19
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Feb 2011 08:21:52 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 11 Feb 2011 17:21:51 +0100
Message-ID: <AANLkTikb+SNFdrC+CD0q74kdazQCQ48cviyhSc9czT4d@mail.gmail.com>
Subject: Kconfig files indentation inconsistency in help text
From: Filip Honckiewicz <f.honckiewicz@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello!

I want to draw your attention on inconsistency in indentation in
Kconfig files. Reading Documentation/kbuild/kconfig-language.txt:
 "(...)The end of the help text is determined by
  the indentation level, this means it ends at the first line which has
 a smaller indentation than the first line of the help text."

Firstly, how the indentation should be counted?

From Documentation/CodingStyle:
"Tabs are 8 characters, and thus indentations are also 8 characters.(...)"
and
"Outside of comments, documentation and except in Kconfig, spaces are never
used for indentation, and the above example is deliberately broken."

There are places in Kconfig files that have mixed tabs and spaces like
in fs/proc/Kconfig where last line of help text in config
PROC_PAGE_MONITOR starts with ten spaces, but previous lines starts
with tab and two spaces. Allowing such inconsistence forces to make
some hacks when building entries tree which are present because e.g.
make menuconfig shows help text of PROC_PAGE_MONITOR normally despite
this eight spaces instead of one tab and two spaces. I believe that
tab + two spaces and 10 spaces are not the same even if it looks the
same in someones editor.

Another problem are entries with help texts started by blank lines,
e.g. config SPARSE_IRQ existing in kernel/irq/Kconfig. SPARSE_IRQ
depends on HAVE_SPARSE_IRQ. make manuconfig says, that HAVE_SPARSE_IRQ
is set to "y", but cannot find SPARSE_IRQ symbol. If help text "ends
at the first line which has a smaller indentation than the first line
of the help text", but it starts with blank line, then all next lines
should be treated as help text. But I suppose that there is some
nowhere written assumption that help text ends with end of file too...
Otherwise it shouldn't work.

Sorry for complainig but I think this ambiguities should be resolved
or at least written somewhere in CodingStyle or kconfig-language.txt,
but prefer to not use dirty hacks for strange exceptions;) If I could
help in some way, please tell me.

Cheers!
Filip
