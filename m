Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fr1.as29.net ([62.210.131.231]:38685 "EHLO
	toothrot.meleeweb.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753496AbaHSS5u (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Aug 2014 14:57:50 -0400
From: Bertrand Jacquin <beber@meleeweb.net>
Subject: [PATCHv2 0/3] handle module compression at install
Date: Tue, 19 Aug 2014 20:57:37 +0200
Message-Id: <1408474660-24999-1-git-send-email-beber@meleeweb.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>, linux-kbuild@vger.kernel.org
Cc: Bertrand Jacquin <beber@meleeweb.net>, linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>

Hi,

Here is patchset based on commit 480cadc (v3.17-rc1-22-g480cadc) that
aims to handle kernel modules compression while running make modules_install.

Please Cc me, as I'm not subscribed to LKML.

Changes since v1:

 - Drop -9 argument to gzip and xz since Andi Kleen and Rusty Russell
   prove no gain is made using them.

Bertrand Jacquin (3):
  modinst: wrap long lines in order to enhance cmd_modules_install
  kbuild: handle module compression while running 'make
    modules_install'.
  modsign: lookup lines ending in .ko in .mod files

 Makefile                 | 15 +++++++++++++++
 init/Kconfig             | 43 +++++++++++++++++++++++++++++++++++++++++++
 scripts/Makefile.modinst |  7 ++++++-
 scripts/Makefile.modsign |  2 +-
 4 files changed, 65 insertions(+), 2 deletions(-)

-- 
2.0.4

