Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43132 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726417AbfDGXJU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Apr 2019 19:09:20 -0400
From: Petr Vorel <pvorel@suse.cz>
Subject: [PATCH 1/1] kconfig: Make nconf-cfg.sh executable
Date: Mon,  8 Apr 2019 01:09:09 +0200
Message-Id: <20190407230909.20668-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>, Masahiro Yamada <yamada.masahiro@socionext.com>

Although it's not required for the build *conf-cfg.sh scripts to be
executable (they're run by CONFIG_SHELL), let's be consistent with other
scripts.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 scripts/kconfig/nconf-cfg.sh | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 scripts/kconfig/nconf-cfg.sh

diff --git a/scripts/kconfig/nconf-cfg.sh b/scripts/kconfig/nconf-cfg.sh
old mode 100644
new mode 100755
-- 
2.20.1
