Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:45185 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751009AbeBPVmh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 16:42:37 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/3] Kconfig: add a default allrandom.config
Date: Fri, 16 Feb 2018 22:41:13 +0100
Message-Id: <20180216214117.1947175-4-arnd@arndb.de>
In-Reply-To: <20180216214117.1947175-1-arnd@arndb.de>
References: <20180216214117.1947175-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

Building randconfig kernels frequently leads to build errors from
drivers that have additional build dependencies, or that we don't
want to build for compile-testing for some other reason.

We already have a couple of compile-time options that can deal with this
problem, but the complete set is not documented well.  We also have a
method to override some options during 'make randconfig' and a couple
of other make targets. However, we don't yet combine those two.

This adds a new allrandom.config file to turn on CONFIG_COMPILE_TEST,
CONFIG_STANDALONE and CONFIG_PREVENT_FIRMWARE_BUILD for all randconfig
builds. This in turn disables some other options that we already try
to avoid in 'allmodconfig' builds and that make no sense in a general
randconfig build.

Building with 'make randconfig KCONFIG_ALLCONFIG=1' should now always
succeed without warnings on x86 and arm64, aside from recent regressions.
Other architectures probably need additional bugfixes.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 kernel/configs/allrandom.config | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 kernel/configs/allrandom.config

diff --git a/kernel/configs/allrandom.config b/kernel/configs/allrandom.config
new file mode 100644
index 000000000000..67294ef2e3a2
--- /dev/null
+++ b/kernel/configs/allrandom.config
@@ -0,0 +1,6 @@
+# maximize search space, disable options not worth testing
+CONFIG_COMPILE_TEST=y
+
+# reduce compile-time dependencies
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
-- 
2.9.0

