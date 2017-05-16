Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:36101 "EHLO
        mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753089AbdEPVlU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 May 2017 17:41:20 -0400
Received: by mail-wm0-f54.google.com with SMTP id u65so134582012wmu.1
        for <linux-kbuild@vger.kernel.org>; Tue, 16 May 2017 14:41:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170421213931.155210-3-mka@chromium.org>
References: <20170421213931.155210-1-mka@chromium.org> <20170421213931.155210-3-mka@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 May 2017 14:41:18 -0700
Message-ID: <CAD=FV=XENNp3rcD5OK1d2WmccbqaT9=bjsayvbnA2Th8zmOAwg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: clang: Disable the 'duplicate-decl-specifier' warning
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, Arnd Bergmann <arnd@arndb.de>

Hi

On Fri, Apr 21, 2017 at 2:39 PM, Matthias Kaehlcke <mka@chromium.org> wrote:
> clang generates plenty of these warnings in different parts of the code.
> They are mostly caused by container_of() and other macros which declare
> a "const <type> *" variable for their internal use which triggers a
> "duplicate 'const' specifier" warning if the <type> is already const
> qualified.
>
> Wording-mostly-from: Michael Davidson <md@google.com>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index df5abf346354..6cd6d428db43 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -704,6 +704,7 @@ KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
>  KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
>  KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
>  KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
> +KBUILD_CFLAGS += $(call cc-disable-warning, duplicate-decl-specifier)
>  # Quiet clang warning: comparison of unsigned expression < 0 is always false
>  KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
>  # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the

It seems like gcc 7 may have the same warning.  Specifically I saw a
patch fly by from Arnd, which you can find in Mark Brown's tree now:

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?h=topic/rt5614&id=03ba791df98d15d07ea74075122af71e35c7611c


+Arnd since he may be trying to solve the same issues?

-Doug
