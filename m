Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:36385 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753900AbdK3RuZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 12:50:25 -0500
Received: by mail-it0-f43.google.com with SMTP id d16so9409366itj.1
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2017 09:50:25 -0800 (PST)
Date: Thu, 30 Nov 2017 09:50:21 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH 6/7] arm64: explicitly pass --no-fix-cortex-a53-843419 to
 GNU gold
Message-ID: <20171130175021.GD90451@samitolvanen.mtv.corp.google.com>
References: <20171129234442.655-1-samitolvanen@google.com>
 <20171129234442.655-7-samitolvanen@google.com>
 <CAKwvOdnhdHKvkLsG+3D5KDJ+jzXeWFPd9X+eDphA4xf5NZoDnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnhdHKvkLsG+3D5KDJ+jzXeWFPd9X+eDphA4xf5NZoDnQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Nicholas Piggin <npiggin@gmail.com>

On Wed, Nov 29, 2017 at 04:30:33PM -0800, Nick Desaulniers wrote:
> Rather than:
> 
> if CONFIG_ARM64_ERRATUM_843419 == y:
>   ...
> if CONFIG_ARM64_ERRATUM_843419 == '':
>   ...
> 
> could this be:
> 
> if CONFIG_ARM64_ERRATUM_843419 == y:
>   ...
> else
>   ...
> 
> ?

Sure. I'll clean this up in v2.

Sami
