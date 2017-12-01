Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:42977 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751125AbdLAAgm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 19:36:42 -0500
Date: Fri, 1 Dec 2017 10:36:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 5/7] arm64: keep .altinstructions and
 .altinstr_replacement
Message-ID: <20171201103621.366e797d@roar.ozlabs.ibm.com>
In-Reply-To: <CAKwvOdn9TEO3G9+7DsQ+mR-nf=50Moydfvft=h_RketDZ2iODA@mail.gmail.com>
References: <20171129234442.655-1-samitolvanen@google.com>
        <20171129234442.655-6-samitolvanen@google.com>
        <CAKwvOd=PcTVZaMCtY7Wy-OEi7Dd1M4hVz8mpJCQR3M+dVROdmg@mail.gmail.com>
        <20171130115827.709f1818@roar.ozlabs.ibm.com>
        <CAKwvOdn9TEO3G9+7DsQ+mR-nf=50Moydfvft=h_RketDZ2iODA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Thu, 30 Nov 2017 09:00:35 -0800
Nick Desaulniers <ndesaulniers@google.com> wrote:

> On Wed, Nov 29, 2017 at 5:58 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
> > (Comparing `readelf -S` before/after is a way to spot bugs.)  
> 
> Do you have a script that can be used to diff 2 `readelf -S`, look for
> missing references, and report an error? Might be easier to rerun that
> every so often and see what's missing.

I don't, I was just doing it by hand.

Thanks,
Nick
