Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:65434 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbgAUQAz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jan 2020 11:00:55 -0500
MIME-Version: 1.0
References: <20200104150238.19834-1-masahiroy@kernel.org>
In-Reply-To: <20200104150238.19834-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 22 Jan 2020 00:59:54 +0900
Message-ID: <CAK7LNATS33-TfoGajRCT3nAAZ+AcfVmO4GorxRTNPk9z8mBcHA@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] initramfs: a lot of cleanups
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Thelen <gthelen@google.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Jan 5, 2020 at 12:03 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>
>
> Masahiro Yamada (13):
>   initramfs: replace klibcdirs in Makefile with FORCE
>   gen_initramfs_list.sh: remove unused variable 'default_list'
>   gen_initramfs_list.sh: fix the tool name in the comment
>   initramfs: rename gen_initramfs_list.sh to gen_initramfs.sh
>   initramfs: remove redundant dependency on BLK_DEV_INITRD
>   initramfs: make compression options not depend on INITRAMFS_SOURCE
>   initramfs: make initramfs compression choice non-optional
>   initramfs: specify $(src)/gen_initramfs.sh as a prerequisite in
>     Makefile
>   initramfs: generate dependency list and cpio at the same time
>   initramfs: add default_cpio_list, and delete -d option support
>   gen_initramfs.sh: always output cpio even without -o option
>   initramfs: refactor the initramfs build rules
>   gen_initramfs.sh: remove intermediate cpio_list on errors

All, applied to linux-kbuild.


>  usr/.gitignore                                |   8 +-
>  usr/Kconfig                                   |  26 ---
>  usr/Makefile                                  |  97 ++++++----
>  usr/default_cpio_list                         |   6 +
>  ...gen_initramfs_list.sh => gen_initramfs.sh} | 167 +++++-------------
>  usr/initramfs_data.S                          |   5 +-
>  6 files changed, 112 insertions(+), 197 deletions(-)
>  create mode 100644 usr/default_cpio_list
>  rename usr/{gen_initramfs_list.sh => gen_initramfs.sh} (53%)
>
> --
> 2.17.1
>


--
Best Regards
Masahiro Yamada
