Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:36831 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfLSIeg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Dec 2019 03:34:36 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 0/3] kbuild: generate modules.builtin without Makefile.modbuiltin or tristate.conf
Date: Thu, 19 Dec 2019 17:33:26 +0900
Message-Id: <20191219083329.5926-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Lucas De Marchi <lucas.de.marchi@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org


This series re-implements the way of generating modules.builtin

Current approach:
   Collect all CONFIG options with 'tristate' type into tristate.conf,
   and parse Makefiles to get the list of builtin modules.

New approach:
   Use MODULE_LICENSE() tags that compiled into vmlinux.
   This information appears in modules.builtin.info,
   but trimmed from vmlinux itself. So the image size does
   not change.

This slightly speeds up builds because Kbuild no longer needs
to traverse the source tree twice.

Also, the code diff is appealing:
 8 files changed, 35 insertions(+), 135 deletions(-)

I think this is OK, but I hope module people can check it.



Masahiro Yamada (3):
  kbuild: add stringify helper to quote a string passed to C files
  kbuild: pass KBUILD_MODFILE when compiling builtin objects
  kbuild: create modules.builtin without Makefile.modbuiltin or
    tristate.conf

 Documentation/kbuild/kconfig.rst |  5 ---
 Makefile                         | 21 +++---------
 include/linux/module.h           | 12 ++++++-
 scripts/Kbuild.include           | 10 +++---
 scripts/Makefile.lib             | 17 ++++++----
 scripts/Makefile.modbuiltin      | 57 --------------------------------
 scripts/kconfig/confdata.c       | 45 ++-----------------------
 scripts/link-vmlinux.sh          |  4 +++
 8 files changed, 36 insertions(+), 135 deletions(-)
 delete mode 100644 scripts/Makefile.modbuiltin

-- 
2.17.1
