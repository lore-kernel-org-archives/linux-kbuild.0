Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728081AbgEFMws (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 May 2020 08:52:48 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1764C061A0F
        for <linux-kbuild@vger.kernel.org>; Wed,  6 May 2020 05:52:47 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x73so1242144lfa.2
        for <linux-kbuild@vger.kernel.org>; Wed, 06 May 2020 05:52:47 -0700 (PDT)
From: Jukka Kaartinen <jukka.kaartinen@unikie.com>
Subject: [PATCH 0/2] [RFC] kconfig: new command line tool to set configs
Date: Wed,  6 May 2020 15:52:34 +0300
Message-Id: <20200506125236.16415-1-jukka.kaartinen@unikie.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, lukas.bulwahn@gmail.com, jouni.hogander@unikie.com, dan.carpenter@oracle.com, Jukka Kaartinen <jukka.kaartinen@partner.bmw.de>

From: Jukka Kaartinen <jukka.kaartinen@partner.bmw.de>

Me, Jouni Högander and Lukas Bulwahn are working on to improve
syzkaller with configuration bisect
feature: https://github.com/google/syzkaller/pull/1689
For that we need to set kernel configurations without human
interaction.
Currently there are no tools to set config options on if it has 
dependencies without human interaction if dependencies are not known beforehand.

I found this old patch from Dan Carpenter 
https://patchwork.kernel.org/patch/6387181/ that can handle the 
dependencies using only commandline and with a small feature added 
it can be automated to say "yes" to all dependencies.

Dan Carpenter (1):
  kconfig: a new command line tool to set configs

Jukka Kaartinen (1):
  kconfig: Extend kconfig with setall option

 scripts/kconfig/Makefile |   7 +
 scripts/kconfig/kconfig  |  83 ++++++++++
 scripts/kconfig/lconf.c  | 328 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 418 insertions(+)
 create mode 100755 scripts/kconfig/kconfig
 create mode 100644 scripts/kconfig/lconf.c

-- 
2.17.1
