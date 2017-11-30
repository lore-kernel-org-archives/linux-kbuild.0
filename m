Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:42962 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751943AbdK3B6n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 20:58:43 -0500
Date: Thu, 30 Nov 2017 11:58:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 5/7] arm64: keep .altinstructions and
 .altinstr_replacement
Message-ID: <20171130115827.709f1818@roar.ozlabs.ibm.com>
In-Reply-To: <CAKwvOd=PcTVZaMCtY7Wy-OEi7Dd1M4hVz8mpJCQR3M+dVROdmg@mail.gmail.com>
References: <20171129234442.655-1-samitolvanen@google.com>
        <20171129234442.655-6-samitolvanen@google.com>
        <CAKwvOd=PcTVZaMCtY7Wy-OEi7Dd1M4hVz8mpJCQR3M+dVROdmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Wed, 29 Nov 2017 15:57:53 -0800
Nick Desaulniers <ndesaulniers@google.com> wrote:

> On Wed, Nov 29, 2017 at 3:44 PM, Sami Tolvanen <samitolvanen@google.com> wrote:
> > Make sure the linker doesn't remove .altinstructions or
> > .altinstr_replacement when CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is
> > enabled.  
> 
> This sounds like a bug in the original implementation of
> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION? If so, this can likely get
> merged regardless of the rest of the patchset, ie. gold support.

Yes, also patch 3/7 probably (thanks for doing these, btw). The
LD_DCDE option is actually been broken upstream thanks to lack
of time (which is a known issue, this is why no arch enables it).

Basically it just needs a bit more effort to go through and
ensure nothing is discarded incorrectly, and all new sections
are placed into output sections, before each arch is enabled.

(Comparing `readelf -S` before/after is a way to spot bugs.)

So yes please if it's not too much trouble, could you remove
the "gold" name from the generic patch and put it at the front
of the series with this arm64 patch. Possibly then you could
also do a 3rd patch to allow arm64 to select it if it's working
with gcc?

Thanks,
Nick
