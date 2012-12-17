Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:55624 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751822Ab2LQOzk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 17 Dec 2012 09:55:40 -0500
Date: Mon, 17 Dec 2012 22:55:46 +0800
From: Wang YanQing <udknight@gmail.com>
Subject: [PATCH 0/2] menuconfig: Add Save/Load buttons
Message-ID: <20121217145546.GA17427@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, rdunlap@xenotime.net, bp@alien8.de, yann.morin.1998@free.fr, sakiwit@gmail.com, lacombar@gmail.com, lucas.demarchi@profusion.mobi, dave@gnu.org, paul.gortmaker@windriver.com, crquan@gmail.com, bpoirier@suse.de

Hi all.

If menuconfig have Save/Load button like alternative
.config editors, xconfig, nconfig, etc.We will have
a obvious benefit when use menuconfig just like
when we use others, we can Save/Load our .config quickly
and conveniently.

This patch series add the Save/Load buttons for menuconfig.
It include two patches:
1/2: add Save/Load buttons
2/2: get rid of the top-level entries for "Load an Alternate/Save an Alternate"

Thanks
