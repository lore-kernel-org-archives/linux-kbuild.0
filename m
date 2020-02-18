Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:57547 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbgBRMlT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Feb 2020 07:41:19 -0500
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 01ICf2jT028318
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Feb 2020 21:41:03 +0900
Received: by mail-ua1-f52.google.com with SMTP id 73so7378391uac.6
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Feb 2020 04:41:03 -0800 (PST)
MIME-Version: 1.0
References: <20200218111842.1641-1-mpe@ellerman.id.au>
In-Reply-To: <20200218111842.1641-1-mpe@ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 18 Feb 2020 21:40:26 +0900
Message-ID: <CAK7LNARM5nf4NhG=E7UZedDpm_Ndwa5zFCDF=XFM7gXBf5uVow@mail.gmail.com>
Subject: Re: [PATCH] powerpc/Makefile: Mark phony targets as PHONY
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@ozlabs.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Feb 18, 2020 at 8:19 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Some of our phony targets are not marked as such. This can lead to
> confusing errors, eg:
>
>   $ make clean
>   $ touch install
>   $ make install
>   make: 'install' is up to date.
>   $
>
> Fix it by adding them to the PHONY variable which is marked phony in
> the top-level Makefile. In arch/powerpc/boot/Makefile we do it
> manually.


You can do likewise in arch/powerpc/boot/Makefile
because it is marked phony in scripts/Makefile.build





-- 
Best Regards
Masahiro Yamada
