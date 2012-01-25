Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:29769 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750772Ab2AYWxF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 Jan 2012 17:53:05 -0500
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [RFC] A packaging of the kconfig frontends
Date: Wed, 25 Jan 2012 23:52:59 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201201252352.59925.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello All!

Writing configuration items with the kconfig language is really easy, the
documentation is good, the frontends are nice, and even catter to all kind
of users, from the most CLI afficionados to GUI lovers with a few select
frontends (resp. mconf or nconf, and gconf or qconf).

Beside the obvious Linux kernel, there is also a bunch of high-visibility
projects using kconfig: busybox, buildroot, uClibc, OpenWRT, PTXdist. A lot
of other lower-visibility projects also use it (eg. crosstool-NG). This list
is far from being complete, though.

Unfortunately, to my knowledge, there does not exist a simple way for a
project to simply use the kconfig language. Each one of them has to initially
copy the frontends and parser into their source code, adapt the build system
to their own, maintain and regularly sync from the Linux kernel tree to get
updates and fixes.

So I have taken the burden to package the kconfig frontends and parser into
a package. The Mercurial repository is there:
    hg clone http://ymorin.is-a-geek.org/hg/kconfig-frontends/

So, what do you get in this package ?
 - all 5 frontends, each individually selectable with configure flags
 - a static library with the parser (not installed, though)
 - a standard autotools-based build procedure
 - a simple kernel-to-package synchronisation


The packaging is not perfect:
 - the yacc-generated file includes the lex-generated file, which means
   it is not possible to use automake to properly generate the .l.c rule.
   Also, a bunch of C file include other .c files, which makes it tricky
   to write proper dependency rules. But that's the way it is in the kernel
   source tree.
 - ./configure may not properly abort on some missing programs
 - the libraries list is not properly segmented for each frontend, ie. they
   all receive the full list (eg. 'conf' does not need -lncurses, but gets
   it anyway...)
 - maybe the kconfig parser could be made 
 - a few other minor stuff...


This package is *not* meant to replace the kconfig infrastructure in the
kernel source tree. The package will _only mirror_ the code from the kernel
source tree. No change will be accpeted: no bug fix, no new feature, nothing.
All changes will come only by synchronising from Linus' tree. 

There is no plan yet on how and when to put out releases, what the version
numbering will be, where the package will ultimately be hosted (but in git,
for sure), and stuff like that..


If you find it usefull, if you have questions, or whatever, I will be glad
to read them, and try to provide answers. Feel free to comment! :-)

Thanks for your attention.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
