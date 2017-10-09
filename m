Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:54348 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751156AbdJIWCH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2017 18:02:07 -0400
Received: by mail-wm0-f41.google.com with SMTP id i124so170601wmf.3
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Oct 2017 15:02:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1507089367-10402-1-git-send-email-yamada.masahiro@socionext.com>
References: <1507089367-10402-1-git-send-email-yamada.masahiro@socionext.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Oct 2017 15:02:05 -0700
Message-ID: <CAD=FV=VZ108hWAmsmb6jp2Jf6FnAjGhvFM-HWnnX7ZfOb5VrBw@mail.gmail.com>
Subject: Re: [PATCH 1/4] kbuild: replace $(hdr-arch) with $(SRCARCH)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

On Tue, Oct 3, 2017 at 8:56 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Since commit 5e53879008b9 ("sparc,sparc64: unify Makefile"), hdr-arch
> and SRCARCH always match.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Makefile                     | 21 +++++++++------------
>  scripts/Makefile.headersinst |  2 +-
>  2 files changed, 10 insertions(+), 13 deletions(-)

Looks sane/correct to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
