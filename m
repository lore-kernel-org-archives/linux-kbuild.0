Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from slow1-d.mail.gandi.net ([217.70.178.86]:39759 "EHLO
	slow1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752401AbcGRTgY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Jul 2016 15:36:24 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	by slow1-d.mail.gandi.net (Postfix) with ESMTP id 24CF347BD95
	for <linux-kbuild@vger.kernel.org>; Mon, 18 Jul 2016 21:32:18 +0200 (CEST)
Date: Mon, 18 Jul 2016 12:32:07 -0700
From: Josh Triplett <josh@joshtriplett.org>
Subject: [PATCH 1/1] kconfig: tinyconfig: x86: List disabled choices to avoid
 warning
Message-ID: <20160718193206.GA20396@x>
References: <20160718160035.3062818-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160718160035.3062818-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.cz>, "Yann E . MORIN" <yann.morin.1998@free.fr>, Darren Hart <dvhart@linux.intel.com>, kernel-build-reports@lists.linaro.org, Thiago Macieira <thiago.macieira@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

The Kconfig machinery used to power tinyconfig produces a warning like
this when changing a "choice" option without explicitly disabling the
other choices:

.config:965:warning: override: NOHIGHMEM changes choice state

Expand arch/x86/configs/tiny.config to add entries disabling the other
two choices, to eliminate this warning.  (Doing so then introduces a
different form of warning for changing any option at all, but that needs
fixing in the underlying config merge machinery.)

Based on a similar change from Arnd Bergmann for the
architecture-independent tiny.config.

Signed-off-by: Josh Triplett <josh@joshtriplett.org>
Reported-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/configs/tiny.config | 2 ++
 1 file changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/x86/configs/tiny.config b/arch/x86/configs/tiny.config
index 4e2ecfa..4b429df 100644
--- a/arch/x86/configs/tiny.config
+++ b/arch/x86/configs/tiny.config
@@ -1 +1,3 @@
 CONFIG_NOHIGHMEM=y
+# CONFIG_HIGHMEM4G is not set
+# CONFIG_HIGHMEM64G is not set
-- 
git-series 0.8.3
