Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from faui40.informatik.uni-erlangen.de ([131.188.34.40]:34188 "EHLO
	faui40.informatik.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757147AbZHQIgg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 17 Aug 2009 04:36:36 -0400
From: Reinhard Tartler <siretart@tauware.de>
Subject: [PATCH] cpumask: fix typo s/CONFIG_CPU_HOTPLUG/CONFIG_HOTPLUG_CPU/
Date: Mon, 17 Aug 2009 10:19:33 +0200
Message-ID: <rwuzl9y975c.fsf@faui48a.informatik.uni-erlangen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Jiri Kosina <jkosina@suse.cz>, linux-kbuild@vger.kernel.org

In ./arch/*/Kconfig, this Kconfig symbol is defined as HOTPLUG_CPU, and
never as CPU_HOTPLUG

Signed-off-by: Reinhard Tartler <siretart@tauware.de>
---
 kernel/smp.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/kernel/smp.c b/kernel/smp.c
index ad63d85..94188b8 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -57,7 +57,7 @@ hotplug_cfd(struct notifier_block *nfb, unsigned long action, void *hcpu)
 			return NOTIFY_BAD;
 		break;
 
-#ifdef CONFIG_CPU_HOTPLUG
+#ifdef CONFIG_HOTPLUG_CPU
 	case CPU_UP_CANCELED:
 	case CPU_UP_CANCELED_FROZEN:
 
-- 
1.5.6.5


-- 
Reinhard Tartler                     Department of Computer Science IV
Martensstr 1, 91058 Erlangen Germany, University of Erlangen-Nuremberg
            http://www4.informatik.uni-erlangen.de/~tartler
