Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:29605 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754063Ab2FGXtF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jun 2012 19:49:05 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 0/3 v2] config/scripts: further enhancements
Date: Fri,  8 Jun 2012 01:48:54 +0200
Message-Id: <1339112937-9055-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andi Kleen <andi@firstfloor.org>, Michal Marek <mmarek@suse.cz>

Hello All!

This series adds a few more enhancements to the script scripts/config to
make it more usable, both for the Linux kernel (patches 1&3) and third
party projects that use Kconfig (patches 1, 2, 3).

Changes since v1:
 - use option to keep symbols' case, not variable (Andi)
 - a few doc fixes

Regards,
Yann E. MORIN.
