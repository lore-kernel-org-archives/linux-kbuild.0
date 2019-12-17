Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:22056 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfLQLn6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Dec 2019 06:43:58 -0500
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id xBHBhjNY012311
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Dec 2019 20:43:46 +0900
Received: by mail-ua1-f44.google.com with SMTP id w20so3309149uap.1
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Dec 2019 03:43:46 -0800 (PST)
MIME-Version: 1.0
References: <1576486038-9899-1-git-send-email-amit.kachhap@arm.com> <1576486038-9899-15-git-send-email-amit.kachhap@arm.com>
In-Reply-To: <1576486038-9899-15-git-send-email-amit.kachhap@arm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 17 Dec 2019 20:43:09 +0900
Message-ID: <CAK7LNATiz05-Rc5dFyy8k3cYNSAD_zmcB6XhQrNHgwt7fWy8Ag@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] kconfig: Add support for 'as-option'
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Amit Daniel Kachhap <amit.kachhap@arm.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>, Kristina Martsenko <kristina.martsenko@arm.com>, Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, Vincenzo Frascino <Vincenzo.Frascino@arm.com>, Mark Brown <Mark.Brown@arm.com>, Richard Henderson <richard.henderson@linaro.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, Dec 16, 2019 at 5:48 PM Amit Daniel Kachhap
<amit.kachhap@arm.com> wrote:
>
> From: Vincenzo Frascino <vincenzo.frascino@arm.com>
>
> Currently kconfig does not have a feature that allows to detect if the
> used assembler supports a specific compilation option.
>
> Introduce 'as-option' to serve this purpose in the context of Kconfig:
>
>         config X
>                 def_bool $(as-option,...)
>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>
> ---

If you apply this to arm64 tree, just go ahead.
Acked-by: Masahiro Yamada <masahiroy@kernel.org>

But, please be aware of a possible merge conflict with:
https://patchwork.kernel.org/patch/11285929/




-- 
Best Regards
Masahiro Yamada
