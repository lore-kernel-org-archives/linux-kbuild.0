Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:54426 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752295AbcLHLzM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Dec 2016 06:55:12 -0500
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH 0/2] kbuild: dead code elimination: ftrace fixes
Date: Thu, 8 Dec 2016 12:55:05 +0100
Message-ID: <1481198107-17019-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>, Michal Marek <mmarek@suse.com>
Cc: Paul Burton <paul.burton@imgtec.com>, linux-kbuild@vger.kernel.org

Enabling dead code & data elimination currently breaks ftrace operation,
as the __mcount_loc section is removed (as it is not referenced directly
anywhere in the code).
Moreover, there are a lot of entries missing in the __mcount_loc section
as the recordmcount tool doesn't currently properly handle the section
names as created by the use of -ffunction-sections.

The following 2 patches fix that behaviour.
They are based on next-20161208.

Marcin Nowakowski (2):
  kbuild: keep __mcount_loc table through dead code elimination
  recordmcount: fix mcount recording with -ffunction-sections

 include/asm-generic/vmlinux.lds.h |  2 +-
 scripts/Makefile                  |  5 +++++
 scripts/recordmcount.c            | 26 +++++++++++++++++++++++++-
 3 files changed, 31 insertions(+), 2 deletions(-)

-- 
2.7.4

