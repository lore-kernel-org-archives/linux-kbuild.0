Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from alt13.smtp-out.videotron.ca ([135.19.0.26]:4040 "EHLO
        alt12.smtp-out.videotron.ca" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752481AbcLHEYP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Dec 2016 23:24:15 -0500
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH 0/2] improve modversions for symbols exported from assembly code
Date: Wed,  7 Dec 2016 23:24:05 -0500
Message-Id: <1481171047-333-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, Nicholas Piggin <npiggin@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, viro@zeniv.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

This is a partial repost of the patches I sent last week, without the
ARM part this time, in the hope that this can be considered for the next
merge window so that architecture specific changes can start using it
afterwards.


 include/asm-generic/export.h | 24 ++++++++++++++++++++++++
 scripts/Makefile.build       | 38 +++++++++++++++++++-------------------
 2 files changed, 43 insertions(+), 19 deletions(-)
