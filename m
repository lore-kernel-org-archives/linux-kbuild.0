Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:59150 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755619Ab1BXSgw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Feb 2011 13:36:52 -0500
From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Subject: [PATCH 0/2] kconfig: allow multiple inclusion of the same file (resent)
Date: Thu, 24 Feb 2011 19:36:41 +0100
Message-Id: <1298572603-1907-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello All!

This patch series makes it possible to source a file multiple times,
eg. from different files, and/or under different conditions. Care has
been taken to avoid circular inclusion, of course.

For example, this would allow to include a common set of options to
more than one drivers, and move that common set to a single file.

We are using kconfig in crosstool-NG, and there are now a few places
where including the same file would be a great improvement. Having
this feature in the upstream kconfig will also greatly help future
resyncs.

This is in response to:
  http://www.spinics.net/lists/linux-kbuild/msg03937.html

 [PATCH 1/2] kconfig: allow multiple inclusion of the same file
 [PATCH 2/2] kconfig: get rid of unused flags

Regards,
Yann E. MORIN.
