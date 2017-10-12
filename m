Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f50.google.com ([209.85.213.50]:57151 "EHLO
        mail-vk0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751901AbdJLRMt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Oct 2017 13:12:49 -0400
Received: by mail-vk0-f50.google.com with SMTP id q190so3029053vkd.13
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Oct 2017 10:12:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1507800145-29563-1-git-send-email-yamada.masahiro@socionext.com>
References: <1507800145-29563-1-git-send-email-yamada.masahiro@socionext.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Oct 2017 10:12:47 -0700
Message-ID: <CAD=FV=UhOezkMdaJNNRr6bKgugBeCr2hf3dXFfGp9mYc3tXhWg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: do not call cc-option before KBUILD_CFLAGS initialization
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

On Thu, Oct 12, 2017 at 2:22 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Some $(call cc-option,...) are invoked very early, even before
> KBUILD_CFLAGS, etc. are initialized.
>
> The returned string from $(call cc-option,...) depends on
> KBUILD_CPPFLAGS, KBUILD_CFLAGS, and GCC_PLUGINS_CFLAGS.
>
> Since they are exported, they are not empty when the top Makefile
> is recursively invoked.
>
> The recursion occurs in several places.  For example, the top
> Makefile invokes itself for silentoldconfig.  "make tinyconfig",
> "make rpm-pkg" are the cases, too.
>
> In those cases, the second call of cc-option from the same line
> runs a different shell command due to non-pristine KBUILD_CFLAGS.
>
> To get the same result all the time, KBUILD_* and GCC_PLUGINS_CFLAGS
> must be initialized before any call of cc-option.  This avoids
> garbage data in the .cache.mk file.
>
> Move all calls of cc-option below the config targets because target
> compiler flags are unnecessary for Kconfig.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Makefile | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)

I can't pretend that I know of all the subtleties involved in the
twisty turny passages of the kernel Makefiles, but as far as I can
tell this looks good.  Thanks!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
