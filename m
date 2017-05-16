Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f179.google.com ([209.85.128.179]:33088 "EHLO
        mail-wr0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751498AbdEPVck (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 May 2017 17:32:40 -0400
Received: by mail-wr0-f179.google.com with SMTP id w50so84067270wrc.0
        for <linux-kbuild@vger.kernel.org>; Tue, 16 May 2017 14:32:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170421213931.155210-2-mka@chromium.org>
References: <20170421213931.155210-1-mka@chromium.org> <20170421213931.155210-2-mka@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 May 2017 14:32:37 -0700
Message-ID: <CAD=FV=V1XGwkETV=L6ye_-M8nyDOyJeb0ugnyoE7wC8gUNoAEQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: clang: Disable 'address-of-packed-member' warning
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>

Hi,

On Fri, Apr 21, 2017 at 2:39 PM, Matthias Kaehlcke <mka@chromium.org> wrote:
> clang generates plenty of these warnings in different parts of the code,
> to an extent that the warnings are little more than noise. Disable the
> 'address-of-packed-member' warning.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index 5039b9148d15..df5abf346354 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -703,6 +703,7 @@ KBUILD_CPPFLAGS += $(call cc-option,-Wno-unknown-warning-option,)
>  KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
>  KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
>  KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
> +KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
>  # Quiet clang warning: comparison of unsigned expression < 0 is always false
>  KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
>  # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the

Though I'm no expert, after reading the discussion on this thread and
looking at the examples provided by Matthias, this seems sane to me.
Thus, FWIW:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
