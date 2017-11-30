Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:43260 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753339AbdK3Aag (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 19:30:36 -0500
Received: by mail-lf0-f48.google.com with SMTP id 94so5951011lfy.10
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2017 16:30:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171129234442.655-7-samitolvanen@google.com>
References: <20171129234442.655-1-samitolvanen@google.com> <20171129234442.655-7-samitolvanen@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 29 Nov 2017 16:30:33 -0800
Message-ID: <CAKwvOdnhdHKvkLsG+3D5KDJ+jzXeWFPd9X+eDphA4xf5NZoDnQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: explicitly pass --no-fix-cortex-a53-843419 to
 GNU gold
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Nicholas Piggin <npiggin@gmail.com>

On Wed, Nov 29, 2017 at 3:44 PM, Sami Tolvanen <samitolvanen@google.com> wrote:
> @@ -26,10 +26,19 @@ ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
>    ifeq ($(call ld-option, --fix-cortex-a53-843419),)
>  $(warning ld does not support --fix-cortex-a53-843419; kernel may be susceptible to erratum)
>    else
> +    ifeq ($(call gold-ifversion, -lt, 114000000, y), y)
> +$(warning This version of GNU gold may generate incorrect code with --fix-cortex-a53-843419;\
> +       see https://sourceware.org/bugzilla/show_bug.cgi?id=21491)
> +    endif
>  LDFLAGS_vmlinux        += --fix-cortex-a53-843419
>    endif
>  endif
>
> +ifeq ($(CONFIG_ARM64_ERRATUM_843419),)
> +# https://sourceware.org/bugzilla/show_bug.cgi?id=21491
> +LDFLAGS_GOLD   += --no-fix-cortex-a53-843419
> +endif
> +

Rather than:

if CONFIG_ARM64_ERRATUM_843419 == y:
  ...
if CONFIG_ARM64_ERRATUM_843419 == '':
  ...

could this be:

if CONFIG_ARM64_ERRATUM_843419 == y:
  ...
else
  ...

?
