Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:37862 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727708AbfAQOzd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Jan 2019 09:55:33 -0500
Date: Thu, 17 Jan 2019 15:55:31 +0100
From: Christoph Hellwig <hch@lst.de>
Subject: SUBDIRS= replacement
Message-ID: <20190117145531.GA21429@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Masahiro, hi Michal,

I just got this beatiful warning:

hch@carbon:~/work/xfs$ make -j4 SUBDIRS=fs/xfs
Makefile:189: ================= WARNING ================
Makefile:190: 'SUBDIRS' will be removed after Linux 5.3
Makefile:191: Please use 'M=' or 'KBUILD_EXTMOD' instead
Makefile:192: ==========================================

Both the replacement seem to be geared towards building externals
modules.  But what is the replacement for just building a directory
of the normal kernel tree?

E.g. what hit this is that I rebased an XFS series, and wanted to
compile test just the xfs code for each step using

make -j4 SUBDIRS=fs/xfs
