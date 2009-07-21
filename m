Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from main.gmane.org ([80.91.229.2]:48092 "EHLO ciao.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751621AbZGUPpv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Jul 2009 11:45:51 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MTHXH-0007de-3l
	for linux-kbuild@vger.kernel.org; Tue, 21 Jul 2009 15:45:48 +0000
Received: from faui44a.informatik.uni-erlangen.de ([131.188.34.129])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Jul 2009 15:45:47 +0000
Received: from siretart by faui44a.informatik.uni-erlangen.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Jul 2009 15:45:47 +0000
From: Reinhard Tartler <siretart@tauware.de>
Subject: is scripts/checkkconfigsymbols.sh actually used?
Date: Tue, 21 Jul 2009 17:45:21 +0200
Message-ID: <87eisaujji.fsf@faui44a.informatik.uni-erlangen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi,

(CC'ing Paolo Giarrusso, the author of scripts/checkkconfigsymbols.sh)

I'm currently looking at the output of scripts/checkkconfigsymbols.sh to
find out that on 2.6.30, it reports about 760 unreferenced symbols
used. I have the impression that the variability implemented in the Linux
source base is diverging heavily from the variability described in Linux
Kconfig.

Just with looking over the list, I think I've identified 2 obvious typos
where the configuration option was misspelled:

The first one is CONFIG_CPUMASK_OFFSTACK:

diff --git a/include/linux/irq.h b/include/linux/irq.h
index b7cbeed..6983591 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -471,14 +471,14 @@ static inline bool init_alloc_desc_masks(struct irq_desc *desc, int cpu,
  * @new_desc:	pointer to new irq_desc struct
  *
  * Insures affinity and pending_masks are copied to new irq_desc.
- * If !CONFIG_CPUMASKS_OFFSTACK the cpumasks are embedded in the
+ * If !CONFIG_CPUMASK_OFFSTACK the cpumasks are embedded in the
  * irq_desc struct so the copy is redundant.
  */
 
 static inline void init_copy_desc_masks(struct irq_desc *old_desc,
 					struct irq_desc *new_desc)
 {
-#ifdef CONFIG_CPUMASKS_OFFSTACK
+#ifdef CONFIG_CPUMASK_OFFSTACK
 	cpumask_copy(new_desc->affinity, old_desc->affinity);
 
 #ifdef CONFIG_GENERIC_PENDING_IRQ


The next one is CONFIG_CPU_HOTPLUG:

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
 
I'm sure that there are quite some false positives in that list, e.g. it
seems that it does not ignore comments, or that it assumes that all
CONFIG_ definitions come from kconfig (this is not true,
e.g. include/linux/memory.h defines CONFIG_MEM_BLOCK_SIZE, but there are
also other kconfig configuration overrides in some drivers). Still, the
list is still impressively long. Now I wonder if there are other, more
obvious problems with scripts/checkkconfigsymbols.sh. Or is the problem
just that this tool is underadvertised and not well-known?

-- 
Gruesse/greetings,
Reinhard Tartler, KeyID 945348A4

