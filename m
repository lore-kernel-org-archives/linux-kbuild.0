Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:44366 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933836AbdK2R0o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 12:26:44 -0500
Received: by mail-lf0-f65.google.com with SMTP id x204so4748035lfa.11
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2017 09:26:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171129162223.GA2959@samitolvanen.mtv.corp.google.com>
References: <20171129000011.55235-1-samitolvanen@google.com>
 <20171129000011.55235-4-samitolvanen@google.com> <CAKv+Gu99XM5jLcOTkqPJPj5oZnUCNv2c7C=5X2hFCM4-4_gwNg@mail.gmail.com>
 <20171129162223.GA2959@samitolvanen.mtv.corp.google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 29 Nov 2017 09:26:41 -0800
Message-ID: <CAKwvOdm1rP7ZgiP0N=WOJxSDgjJHcQGd90JXX8g_bHjZU=0QfA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: use -mno-implicit-float instead of -mgeneral-regs-only
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Wed, Nov 29, 2017 at 8:22 AM, Sami Tolvanen <samitolvanen@google.com> wrote:
> On Wed, Nov 29, 2017 at 12:15:14PM +0000, Ard Biesheuvel wrote:
>> Do we still need these patches now that the AES code has been fixed?
>
> With your AES patch that Herbert just applied, this patch is no longer
> needed. Version macros in the first two patches will still be useful in
> future though.

Matthias, maybe for your recommended Clang patch sets, you can replace
this patch with
https://www.spinics.net/lists/arm-kernel/msg617947.html?
