Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:37052 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727374AbeICOXD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Sep 2018 10:23:03 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RFC PATCH 0/3] kbuild: support syncing .config non-interactively and record ARCH in spec file
Date: Mon,  3 Sep 2018 19:01:53 +0900
Message-Id: <1535968916-9159-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>, Laura Abbott <labbott@redhat.com>, Jiri Kosina <jkosina@suse.cz>, Ben Hutchings <ben.hutchings@codethink.co.uk>, =?UTF-8?q?Michal=20Such=8F=AB=A1nek?= <msuchanek@suse.de>, Takashi Iwai <tiwai@suse.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>


This work was prompted by the criticism about the recent Kconfig change:
https://lkml.org/lkml/2018/6/27/254

I may not fully understand his concern, though.



Masahiro Yamada (3):
  kconfig: support an environment variable for non-interactive
    syncconfig
  kbuild: rpm-pkg: hard-code ARCH in RPM SPEC file
  kbuild: rpm-pkg: set KCONFIG_NONINTERACTIVE_UPDATE

 Documentation/kbuild/kconfig.txt |  6 ++++++
 scripts/kconfig/conf.c           |  5 +++++
 scripts/package/mkspec           | 23 +++++++++++++----------
 3 files changed, 24 insertions(+), 10 deletions(-)

-- 
2.7.4
