Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:38942 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750797Ab0HPE7k (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 00:59:40 -0400
Received: by yxg6 with SMTP id 6so1755339yxg.19
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Aug 2010 21:59:40 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFC 0/2] Factor Kconfig's prefix and package name
Date: Mon, 16 Aug 2010 00:54:15 -0400
Message-Id: <1281934457-4225-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Hi,

Many projects are using Kconfig's derivate as their configuration UI.  Some of
these projects change the default "CONFIG_" prefix for something else. It
obliges them to dig in the sources to find and replace all occurences and
associated constant. Same goes for package name where when the project ship a C
library, messages about a kernel may not be welcome. OOTH, a project may want to
limit its changes to be able to re-sync with the kernel's Kconfig and benefits
from latest features and bug fixes.

The two next patches factorizes Kconfig's prefix and package name to generic
macros defined in `scripts/kconfig/lkc.h'. This allow projects to easily tune
Kconfig for their need with trivial source modification.

There may have been similar patches in the past, in which case this message can
be silently discarded :)

any comments appreciated !

 - Arnaud

Arnaud Lacombe (2):
  kbuild: genericizes package name
  kbuild: genericizes kbuild's config prefix

 scripts/kconfig/conf.c              |   12 ++++----
 scripts/kconfig/confdata.c          |   48 +++++++++++++++++-----------------
 scripts/kconfig/gconf.c             |    4 +-
 scripts/kconfig/lkc.h               |    7 ++++-
 scripts/kconfig/mconf.c             |   44 ++++++++++++++++----------------
 scripts/kconfig/menu.c              |    2 +-
 scripts/kconfig/nconf.c             |   40 ++++++++++++++---------------
 scripts/kconfig/qconf.cc            |    6 ++--
 scripts/kconfig/zconf.tab.c_shipped |    2 +-
 scripts/kconfig/zconf.y             |    2 +-
 10 files changed, 85 insertions(+), 82 deletions(-)

-- 
1.7.2.30.gc37d7.dirty

