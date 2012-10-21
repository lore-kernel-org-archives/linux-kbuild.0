Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.wow.synacor.com ([64.8.70.55]:43769 "EHLO
	smtp.mail.wowway.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751766Ab2JUHkS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 21 Oct 2012 03:40:18 -0400
Date: Sun, 21 Oct 2012 03:40:16 -0400
From: Paul Thompson <set.mailinglist@gmail.com>
Subject: IRQ subsystem menu
Message-ID: <20121021074016.GA2604@squish.home.loc>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

	Hi;

	In menuconfig, General setup -> IRQ subsystem, there are two
possible menu-items. One depends partly on IRQ_DOMAIN, and the other
on MAY_HAVE_SPARSE_IRQ.

	On the x86-64 arch, neither of these seems to be set, so the
menu entry is blank if entered (displaying an odd ^@ if you try to
navigate up or down. And sometimes some screen garbage on the sides.)

	Previously (in the 3.2 kernel at least) this menu used to be
populated by the "Support sparse IRQ numbering" menu-item, which
at that time depended on HAVE_SPARSE_IRQ, and was forced to YES.

	I do not know if the current behaviour is intended, but it
is ugly and confusing to be confronted with a blank menu page.

	Ideally, the "IRQ subsystem" menu would not even show up
if it would contain no menu-items, but I do not know enough to
formulate that constraint.

	A simple alternative is a comment section to reasure babes in
the wood of kernel configuration that something is not amiss. I include
a sample patch.

Paul
set.mailinglist@gmail.com

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="irq-kconfig.patch"

--- linux-3.7-rc2/kernel/irq/Kconfig.orig	2012-10-20 15:11:32.000000000 -0400
+++ linux-3.7-rc2/kernel/irq/Kconfig	2012-10-21 03:14:56.272952813 -0400
@@ -4,6 +4,9 @@ config HAVE_GENERIC_HARDIRQS
 
 if HAVE_GENERIC_HARDIRQS
 menu "IRQ subsystem"
+
+comment "Some configurations may have no available options here"
+
 #
 # Interrupt subsystem related configuration options
 #

--HcAYCG3uE/tztfnV--
