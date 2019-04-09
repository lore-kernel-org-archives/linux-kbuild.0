Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f51.google.com ([209.85.128.51]:35212 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfDIHPq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Apr 2019 03:15:46 -0400
Received: by mail-wm1-f51.google.com with SMTP id y197so1992681wmd.0
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Apr 2019 00:15:45 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
Subject: [RESENT PATCH 1/1] kconfig: Make nconf-cfg.sh executable
Date: Tue,  9 Apr 2019 09:15:36 +0200
Message-Id: <20190409071536.1866-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>, Masahiro Yamada <yamada.masahiro@socionext.com>

From: Petr Vorel <pvorel@suse.cz>

Although it's not required for the build *conf-cfg.sh scripts to be
executable (they're run by CONFIG_SHELL), let's be consistent with other
scripts.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Sorry for noise, I'm having some problems with patchwork getting my patches.
---
 scripts/kconfig/nconf-cfg.sh | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 scripts/kconfig/nconf-cfg.sh

diff --git a/scripts/kconfig/nconf-cfg.sh b/scripts/kconfig/nconf-cfg.sh
old mode 100644
new mode 100755
-- 
2.20.1
