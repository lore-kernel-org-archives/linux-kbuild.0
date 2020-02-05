Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46455 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgBEG4M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Feb 2020 01:56:12 -0500
Received: by mail-lj1-f196.google.com with SMTP id x14so1107785ljd.13
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Feb 2020 22:56:10 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id r20sm11628685lfi.91.2020.02.04.22.56.08
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 22:56:08 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id n18so1147963ljo.7
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Feb 2020 22:56:08 -0800 (PST)
MIME-Version: 1.0
References: <20200205065152.873-1-masahiroy@kernel.org>
In-Reply-To: <20200205065152.873-1-masahiroy@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 5 Feb 2020 06:55:52 +0000
Message-ID: <CAHk-=wgF6+PqsfQZyTNM9bXK+moUy6kSzbb3ZxxRVo93-_Cc=w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: make multiple directory targets work properly
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Wed, Feb 5, 2020 at 6:52 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> If you want to use this patch soon (seems useful since
> you are travelling), please feel free to apply it directly.
>
> If you wait for my next pull request, I will apply it to
> my tree.

I'll wait for the proper channels, I'm heading back home tomorrow
anyway, and it's not been a big problem for me.

Just an oddity I happened to hit because of doing slightly different
things while on the road.

Thanks,
                Linus
