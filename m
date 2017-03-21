Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:25207 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933041AbdCURyH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Mar 2017 13:54:07 -0400
MIME-Version: 1.0
In-Reply-To: <20170321001411.GA142235@beast>
References: <20170321001411.GA142235@beast>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 22 Mar 2017 02:53:46 +0900
Message-ID: <CAK7LNAQRh5RZ7pD39DqbZ+DiRPfdzqyxB_SEDV3NkAz+eSDjEg@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: make designated_init attribute fatal
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Josh Triplett <josh@joshtriplett.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-03-21 9:14 GMT+09:00 Kees Cook <keescook@chromium.org>:
> If a structure is marked with __attribute__((designated_init)) from
> GCC or Sparse, it needs to have all static initializers using designated
> initialization. Fail the build for any missing cases. This attribute will
> be used by the randstruct plugin to make sure randomized structures are
> being correctly initialized.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> v2: update subject to more clearly describe change, Masahiro Yamada
> ---


Applied to linux-kbuild/kbuild.   Thanks!



-- 
Best Regards
Masahiro Yamada
