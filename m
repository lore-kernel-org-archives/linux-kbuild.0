Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f171.google.com ([209.85.214.171]:43461 "EHLO
        mail-pl1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727444AbeJEC5o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Oct 2018 22:57:44 -0400
Date: Thu, 4 Oct 2018 13:02:49 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
Subject: [ANN] init-kconfig - easy way to embrace Linux's kconfig
Message-ID: <20181004200249.GL5238@garbanzo.do-not-panic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Petr Vorel <pvorel@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Johannes Berg <johannes@sipsolutions.net>, Valentin Rothberg <valentinrothberg@gmail.com>, Vegard Nossum <vegard.nossum@oracle.com>, Felix Fietkau <nbd@nbd.name>, kconfig-sat@googlegroups.com

Every now and then a project is born, and they decide to use Linux's
kconfig to enable configuration of their project. As it stands we *know*
kconfig is now used in at least over 12 different projects [0]. I myself
added kconfig to one as well years ago. Even research reveals that
kconfig has become one of the leading industrial variability modeling
languages [1] [2].

What is often difficult to do though is to start off using kconfig and
integrating it into a project. Or updating / syncing to the latest
kconfig from upstream Linux.

I had yet another need to use kconfig for another small project so
decided to make a clean template others can use and help keep it in sync.
This is a passive fork which aims to keep in sync with the Linux
kernel's latest kconfig to make it easier to keep up to date and to
enable new projects to use and embrace kconfig on their own.  The goal
is *not* to fork kconfig and evolve it separately, but rather keep in
sync with the evolution of kconfig on Linux to make it easier for
projects to use kconfig and also update their own kconfig when needed.

This may also be useful if folks want to test R&D code on a smaller
compartamentalized codebase.

If you find this useful and you'd like to help keep it in sync, send
patches my way as the kernel's kconfig evolves. The code is up on
gitlab [3].

Do we want to document this option on Linux in case folks want to try
and embrace kconfig on their own for other projects?
  
[0] http://www.eng.uwaterloo.ca/~shshe/kconfig_semantics.pdf
[1] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
[2] http://gsd.uwaterloo.ca/sites/default/files/ase241-berger_0.pdf
[3] https://gitlab.com/mcgrof/init-kconfig

  Luis
