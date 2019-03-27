Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733197AbfC0SEP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Mar 2019 14:04:15 -0400
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.0 074/262] kbuild: invoke syncconfig if include/config/auto.conf.cmd is missing
Date: Wed, 27 Mar 2019 13:58:49 -0400
Message-Id: <20190327180158.10245-74-sashal@kernel.org>
In-Reply-To: <20190327180158.10245-1-sashal@kernel.org>
References: <20190327180158.10245-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org

From: Masahiro Yamada <yamada.masahiro@socionext.com>

[ Upstream commit 9390dff66a52d1a60c6e517d8fa6cdbdffc83cb1 ]

If include/config/auto.conf.cmd is lost for some reasons, it is not
self-healing, so the top Makefile misses to run syncconfig.
Move include/config/auto.conf.cmd to the target side.

I used a pattern rule instead of a normal rule here although it is
a bit gross.

If the rule were written with a normal rule like this,

  include/config/auto.conf \
  include/config/auto.conf.cmd \
  include/config/tristate.conf: $(KCONFIG_CONFIG)
          $(Q)$(MAKE) -f $(srctree)/Makefile syncconfig

... syncconfig would be executed per target.

Using a pattern rule makes sure that syncconfig is executed just once
because Make assumes the recipe will create all of the targets.

Here is a quote from the GNU Make manual [1]:

"Pattern rules may have more than one target. Unlike normal rules,
this does not act as many different rules with the same prerequisites
and recipe. If a pattern rule has multiple targets, make knows that
the rule's recipe is responsible for making all of the targets. The
recipe is executed only once to make all the targets. When searching
for a pattern rule to match a target, the target patterns of a rule
other than the one that matches the target in need of a rule are
incidental: make worries only about giving a recipe and prerequisites
to the file presently in question. However, when this file's recipe is
run, the other targets are marked as having been updated themselves."

[1]: https://www.gnu.org/software/make/manual/html_node/Pattern-Intro.html

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 06fda21614bc..89af52ca0ba5 100644
--- a/Makefile
+++ b/Makefile
@@ -625,12 +625,15 @@ ifeq ($(may-sync-config),1)
 -include include/config/auto.conf.cmd
 
 # To avoid any implicit rule to kick in, define an empty command
-$(KCONFIG_CONFIG) include/config/auto.conf.cmd: ;
+$(KCONFIG_CONFIG): ;
 
 # The actual configuration files used during the build are stored in
 # include/generated/ and include/config/. Update them if .config is newer than
 # include/config/auto.conf (which mirrors .config).
-include/config/%.conf: $(KCONFIG_CONFIG) include/config/auto.conf.cmd
+#
+# This exploits the 'multi-target pattern rule' trick.
+# The syncconfig should be executed only once to make all the targets.
+%/auto.conf %/auto.conf.cmd %/tristate.conf: $(KCONFIG_CONFIG)
 	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
 else
 # External modules and some install targets need include/generated/autoconf.h
-- 
2.19.1
