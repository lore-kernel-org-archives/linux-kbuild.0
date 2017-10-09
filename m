Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:43543 "EHLO
        mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755181AbdJIWCj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2017 18:02:39 -0400
Received: by mail-wm0-f52.google.com with SMTP id m72so13318342wmc.0
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Oct 2017 15:02:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1507089367-10402-2-git-send-email-yamada.masahiro@socionext.com>
References: <1507089367-10402-1-git-send-email-yamada.masahiro@socionext.com> <1507089367-10402-2-git-send-email-yamada.masahiro@socionext.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Oct 2017 15:02:36 -0700
Message-ID: <CAD=FV=UBdJVBZNN6DTZ8W6HaHPYd2U-kOYYLCh1dWY5OJODSew@mail.gmail.com>
Subject: Re: [PATCH 2/4] kbuild: move "_all" target out of $(KBUILD_SRC) conditional
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

On Tue, Oct 3, 2017 at 8:56 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> The first "_all" occurrence around line 120 is only visible when
> KBUILD_SRC is unset.
>
> If O=... is specified, the working directory is relocated, then the
> only second occurrence around line 193 is visible, that is not set
> to PHONY.
>
> Move the first one to an always visible place.  This clarifies "_all"
> is our default target and it is always set to PHONY.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Makefile | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

I'm a professed non-expert on the kernel build so take my review FWIW...

I'd definitely agree that it looks like it was a bug (though not a
huge one) that it was possible for "_all" not to get marked PHONY.
Other than that this change just makes things a little more readable
since (if I followed all the Makefile code properly) prior to your
change "_all" always ended up being the default rule, just in a very
roundabout way.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
