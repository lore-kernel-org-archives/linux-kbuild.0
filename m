Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:35057 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751978AbdGBXGt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Jul 2017 19:06:49 -0400
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com [209.85.161.182]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id v62N6gkp004464
        for <linux-kbuild@vger.kernel.org>; Mon, 3 Jul 2017 08:06:42 +0900
Received: by mail-yw0-f182.google.com with SMTP id j11so65131983ywa.2
        for <linux-kbuild@vger.kernel.org>; Sun, 02 Jul 2017 16:06:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170624144810.7363-1-bjorn.forsman@gmail.com>
References: <20170624144810.7363-1-bjorn.forsman@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 3 Jul 2017 08:06:41 +0900
Message-ID: <CAK7LNATd+RGtnM5vQhh3tFh+sZbUoXvATqKkUbg1jaPnhbg21g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: create deterministic initramfs directory listings
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>

2017-06-24 23:48 GMT+09:00 Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>:
> kbuild runs "find" on each entry in CONFIG_INITRAMFS_SOURCE that is a
> directory. The order of the file listing output by "find" matter for
> build reproducability, hence this patch applies "sort" to get
> deterministic results.
>
> Without this patch, two different machines with identical initramfs
> directory input may produce differing initramfs cpio archives (different
> hash) due to the different order of the files within the archive.
>
> Signed-off-by: Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>

Applied to linux-kbuild/misc.  Thanks!


--=20
Best Regards
Masahiro Yamada
