Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:59486 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932479AbeFPLKK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Jun 2018 07:10:10 -0400
Date: Sat, 16 Jun 2018 13:10:05 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
Message-ID: <20180616111004.GB28657@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

I'm seeing this when I do

# make menuconfig

after a fresh repo clean: git clean -dqfx

Might wanna silence it...

/bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
/bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
/bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
  HOSTCC  scripts/kconfig/lxdialog/checklist.o
/bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
/bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
/bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
  HOSTCC  scripts/kconfig/lxdialog/inputbox.o
/bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
/bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
/bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
  HOSTCC  scripts/kconfig/lxdialog/menubox.o
/bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
/bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
/bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
  HOSTCC  scripts/kconfig/lxdialog/textbox.o
/bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
/bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
/bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
  HOSTCC  scripts/kconfig/lxdialog/util.o
/bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
/bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
/bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
  HOSTCC  scripts/kconfig/lxdialog/yesno.o
  UPD     scripts/kconfig/.mconf-cfg
  HOSTCC  scripts/kconfig/mconf.o
  HOSTLD  scripts/kconfig/mconf
scripts/kconfig/mconf  Kconfig

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
