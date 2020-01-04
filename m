Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:54710 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbgADPDy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jan 2020 10:03:54 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 00/13] initramfs: a lot of cleanups
Date: Sun,  5 Jan 2020 00:02:25 +0900
Message-Id: <20200104150238.19834-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Thelen <gthelen@google.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org



Masahiro Yamada (13):
  initramfs: replace klibcdirs in Makefile with FORCE
  gen_initramfs_list.sh: remove unused variable 'default_list'
  gen_initramfs_list.sh: fix the tool name in the comment
  initramfs: rename gen_initramfs_list.sh to gen_initramfs.sh
  initramfs: remove redundant dependency on BLK_DEV_INITRD
  initramfs: make compression options not depend on INITRAMFS_SOURCE
  initramfs: make initramfs compression choice non-optional
  initramfs: specify $(src)/gen_initramfs.sh as a prerequisite in
    Makefile
  initramfs: generate dependency list and cpio at the same time
  initramfs: add default_cpio_list, and delete -d option support
  gen_initramfs.sh: always output cpio even without -o option
  initramfs: refactor the initramfs build rules
  gen_initramfs.sh: remove intermediate cpio_list on errors

 usr/.gitignore                                |   8 +-
 usr/Kconfig                                   |  26 ---
 usr/Makefile                                  |  97 ++++++----
 usr/default_cpio_list                         |   6 +
 ...gen_initramfs_list.sh => gen_initramfs.sh} | 167 +++++-------------
 usr/initramfs_data.S                          |   5 +-
 6 files changed, 112 insertions(+), 197 deletions(-)
 create mode 100644 usr/default_cpio_list
 rename usr/{gen_initramfs_list.sh => gen_initramfs.sh} (53%)

-- 
2.17.1
