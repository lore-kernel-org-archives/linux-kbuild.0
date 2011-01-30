Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:45450 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754858Ab1A3XP3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 30 Jan 2011 18:15:29 -0500
From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Subject: [PATCH 0/2] kconfig: allow multiple inclusion of the same file
Date: Mon, 31 Jan 2011 00:15:19 +0100
Message-Id: <1296429321-6991-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello All!

This patch series makes it possible to source a file multiple times,
eg. from different files, and/or under different conditions.

For example, this would allow to include a common set of options to
more than one drivers, and move that common set to a single file.

Care has been taken to avoid circular inclusion.

This is in response to:
  http://www.spinics.net/lists/linux-kbuild/msg03937.html

 [PATCH 1/2] kconfig: allow multiple inclusion of the same file
 [PATCH 2/2] kconfig: get rid of unused flags

Regards,
Yann E. MORIN.
