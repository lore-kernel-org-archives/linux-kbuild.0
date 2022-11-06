Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3661C433FE
	for <linux-kbuild@archiver.kernel.org>; Sun,  6 Nov 2022 10:13:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiKFKNB (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 6 Nov 2022 05:13:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbiKFKNA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 6 Nov 2022 05:13:00 -0500
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com [210.131.2.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8D4F53;
        Sun,  6 Nov 2022 02:12:59 -0800 (PST)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 2A6ACj5q018433;
        Sun, 6 Nov 2022 19:12:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 2A6ACj5q018433
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1667729566;
        bh=KZyQ9uQyhJLUgpbU/RWJDnzVEntNtORctXAqCTMHbmg=;
        h=From:Date:Subject:To:Cc:From;
        b=Xaqsn8eu+ypZTdx67/ODfVRdCT5Pd5TeQEmmXpVc0hiIwMSi7Byp6o9tMKPv6q6Hy
         lBcNBhSAbZpSM0jLUL3JOioQWJ2KqOeGzcNfPTLZQ8Wz1kzfrxQOgotR8Il4cXCTke
         Ll5KMGsBwOGZo4lsloR0O7VWvrIjGXMroJ52S9ZpzN4AyOOyAVHwhbAvVoEvWcBC+N
         ZhAepHJt8B/m+VOh84t7AEN2n48197PYCuyjNE+0fyVtVkumJQwZMXKtu262k+5Lj8
         HFrs1Ta/FhS6i+06CgRQaFGQzLAk5ZoJsbK95usc3cn1oVg+NGsWaXRxoMsi/lZ7MR
         C2QPdB3m1aOdg==
X-Nifty-SrcIP: [209.85.160.52]
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-13be3ef361dso9857009fac.12;
        Sun, 06 Nov 2022 02:12:46 -0800 (PST)
X-Gm-Message-State: ACrzQf0+PyqauzeWqaC6FJjDc7ktWQbpobSRfrvpQykdbUqP3DQsQLnr
        6GT7eVtl93B3hLJIDi2/ZbJ92WUnWMh6tUKxjd0=
X-Google-Smtp-Source: AMsMyM5mw4Usbuu9RIaROR/Bsk9034TqGcmpXdCY17Oi/cwyuYw5iZ4jRBJO5w6AuiOnITFSoyE3Qc+WDjxxwEfDpjw=
X-Received: by 2002:a05:6870:7b88:b0:13b:a31f:45fd with SMTP id
 jf8-20020a0568707b8800b0013ba31f45fdmr424820oab.194.1667729565112; Sun, 06
 Nov 2022 02:12:45 -0800 (PST)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 6 Nov 2022 19:12:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNARS3S3vfT0eu94FnK9kkHHTSeKs8KZNLcu8-oVzFtyuvw@mail.gmail.com>
Message-ID: <CAK7LNARS3S3vfT0eu94FnK9kkHHTSeKs8KZNLcu8-oVzFtyuvw@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.1-rc4
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello Linus,

Please pull Kbuild fixes.
Thanks.




The following changes since commit 247f34f7b80357943234f93f247a1ae6b6c3a740:

  Linux 6.1-rc2 (2022-10-23 15:27:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.1-2

for you to fetch changes up to 7a263a0402561035199cd9049baadb908a92b6b4:

  kconfig: fix segmentation fault in menuconfig search (2022-11-02
17:32:05 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.1 (2nd)

 - Use POSIX-compatible grep option.

 - Document git-related tips for reproducible builds.

 - Fix a typo in the modpost rule.

 - Suppress SIGPIPE error message from gcc-ar and llvm-ar.

 - Fix segmentation fault in the menuconfig search.

----------------------------------------------------------------
Dan Li (1):
      Documentation: kbuild: Add description of git for reproducible builds

Masahiro Yamada (2):
      kbuild: fix SIGPIPE error message for AR=gcc-ar and AR=llvm-ar
      kconfig: fix segmentation fault in menuconfig search

Stefan Hansson (1):
      kbuild: use POSIX-compatible grep option

Will McVicker (1):
      kbuild: fix typo in modpost

 Documentation/kbuild/reproducible-builds.rst | 10 ++++++++++
 Makefile                                     |  2 +-
 scripts/Makefile.modpost                     |  2 +-
 scripts/kconfig/menu.c                       | 23 ++++-------------------
 4 files changed, 16 insertions(+), 21 deletions(-)


--
Best Regards
Masahiro Yamada
