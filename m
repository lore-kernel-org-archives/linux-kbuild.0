Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34704 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161358AbcKAB41 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 Oct 2016 21:56:27 -0400
Received: by mail-pf0-f195.google.com with SMTP id y68so4305405pfb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 31 Oct 2016 18:56:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 0/2] kbuild: thin archives and gc-sections updates
Date: Tue,  1 Nov 2016 12:56:12 +1100
Message-Id: <20161101015614.1546-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org

Hi,

Here are a couple of updates for the new build processes. I think
these could go in 4.9 because nobody has started using them seriously
yet, but on the other hand that is also a reason they can probably
wait until 4.10.

Thanks,
Nick

Nicholas Piggin (2):
  kbuild: thin archives for multi-y targets
  kbuild: keep data tables through dead code elimination

 include/asm-generic/vmlinux.lds.h | 68 +++++++++++++++++++--------------------
 scripts/Makefile.build            | 13 ++++++--
 2 files changed, 44 insertions(+), 37 deletions(-)

-- 
2.9.3

