Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:39509 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753885AbdK3Rsj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 12:48:39 -0500
Received: by mail-io0-f196.google.com with SMTP id h12so8400914iof.6
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2017 09:48:39 -0800 (PST)
Date: Thu, 30 Nov 2017 09:48:34 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH 5/7] arm64: keep .altinstructions and
 .altinstr_replacement
Message-ID: <20171130174834.GC90451@samitolvanen.mtv.corp.google.com>
References: <20171129234442.655-1-samitolvanen@google.com>
 <20171129234442.655-6-samitolvanen@google.com>
 <CAKwvOd=PcTVZaMCtY7Wy-OEi7Dd1M4hVz8mpJCQR3M+dVROdmg@mail.gmail.com>
 <20171130115827.709f1818@roar.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171130115827.709f1818@roar.ozlabs.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Thu, Nov 30, 2017 at 11:58:27AM +1000, Nicholas Piggin wrote:
> So yes please if it's not too much trouble, could you remove
> the "gold" name from the generic patch and put it at the front
> of the series with this arm64 patch.

Sure, I'll do this in v2.

> Possibly then you could also do a 3rd patch to allow arm64 to
> select it if it's working with gcc?

These patches only fix the issues I ran into with clang and gold
when testing on a single device.  I feel like more testing would
be needed before enabling this by default for arm64.

Sami
