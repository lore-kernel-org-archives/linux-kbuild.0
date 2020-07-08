Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbgGHGww (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 02:52:52 -0400
Received: from canardo.mork.no (canardo.mork.no [IPv6:2001:4641::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1D1C061755
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Jul 2020 23:52:52 -0700 (PDT)
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: Kbuild support for rebuilding a single driver gone?
References: <87lfjvbfkw.fsf@miraculix.mork.no>
        <CAK7LNAS=1M0NXeQUMnD63O=fAKTptnSRwjE_o6_jVKUv3_7q5Q@mail.gmail.com>
Date: Wed, 08 Jul 2020 08:52:45 +0200
In-Reply-To: <CAK7LNAS=1M0NXeQUMnD63O=fAKTptnSRwjE_o6_jVKUv3_7q5Q@mail.gmail.com>
        (Masahiro Yamada's message of "Wed, 8 Jul 2020 01:42:35 +0900")
Message-ID: <87y2nua476.fsf@miraculix.mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Masahiro Yamada <masahiroy@kernel.org> writes:

> Please check this:
> https://patchwork.kernel.org/patch/11649263/
>
>
> It will be included in the next pull request,
> and eventually back-ported to stable kernels.

Thanks.  That was really fast!

I can confirm that this patch fixes the issue.

> Meanwhile, if M=3D build is not important,
> you can compile-test a particular module
> with in-tree build:
>
>
> $ make drivers/net/usb/qmi_wwan.ko

Yes, I know.  I use the M=3D build to do some basic load/run testing on
distro kernels.  Which is obviously a best effort thing. But it saves me
some time when it works, not needing to build and boot a more recent
kernel to just test a simple driver patch.


Bj=C3=B8rn
