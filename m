Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:64645 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752968AbdGGAIM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Jul 2017 20:08:12 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 7 Jul 2017 09:07:49 +0900
Message-ID: <CAK7LNASm205RifXM7Z5hgntB1gBU_fw4Zc6tAjXV=UBx3sOnhQ@mail.gmail.com>
Subject: [GIT PULL 2/3] Kbuild misc updates for v4.13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>

Hi Linus,

Here are some updates of misc scripts for v4.13.  Please pull!

I think you will see a trivial conflict in scripts/kernel-doc-xml-ref.

This file was deleted by the doc subsystem.
So, please delete it.




The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6=
:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-misc-v4.13

for you to fetch changes up to 9e6e0d5f2a2713402cf9dce69b9f9b516e4185d2:

  kbuild: create deterministic initramfs directory listings
(2017-07-03 08:02:09 +0900)

----------------------------------------------------------------
Kbuild misc updates for 4.13

- Use more portable shebang for Perl scripts

- Remove trailing spaces from GCC version in kernel log

- Make initramfs generation deterministic

----------------------------------------------------------------
Bj=C3=B8rn Forsman (1):
      kbuild: create deterministic initramfs directory listings

Jonathan Liu (1):
      scripts/mkcompile_h: Remove trailing spaces from compiler version

Kamil Rytarowski (1):
      scripts: Switch to more portable Perl shebang

 scripts/bootgraph.pl                 | 2 +-
 scripts/checkincludes.pl             | 2 +-
 scripts/checkpatch.pl                | 3 ++-
 scripts/checkstack.pl                | 2 +-
 scripts/checkversion.pl              | 2 +-
 scripts/cleanfile                    | 3 ++-
 scripts/cleanpatch                   | 3 ++-
 scripts/dtc/dt_to_config             | 2 +-
 scripts/export_report.pl             | 3 ++-
 scripts/extract-module-sig.pl        | 3 ++-
 scripts/extract-sys-certs.pl         | 3 ++-
 scripts/extract_xc3028.pl            | 2 +-
 scripts/gen_initramfs_list.sh        | 2 +-
 scripts/get_dvb_firmware             | 2 +-
 scripts/get_maintainer.pl            | 3 ++-
 scripts/headerdep.pl                 | 2 +-
 scripts/headers_check.pl             | 3 ++-
 scripts/kconfig/streamline_config.pl | 3 ++-
 scripts/kernel-doc                   | 3 ++-
 scripts/kernel-doc-xml-ref           | 3 ++-
 scripts/markup_oops.pl               | 2 +-
 scripts/mkcompile_h                  | 2 +-
 scripts/namespace.pl                 | 4 ++--
 scripts/profile2linkerlist.pl        | 2 +-
 scripts/recordmcount.pl              | 3 ++-
 scripts/stackdelta                   | 2 +-
 26 files changed, 39 insertions(+), 27 deletions(-)

--=20
Best Regards
Masahiro Yamada
