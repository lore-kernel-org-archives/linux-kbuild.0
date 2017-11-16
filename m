Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35142 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965506AbdKPRL4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 12:11:56 -0500
Received: by mail-it0-f67.google.com with SMTP id u132so863644ita.0
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 09:11:56 -0800 (PST)
Date: Thu, 16 Nov 2017 09:11:52 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 11/18] arm64: make mrs_s and msr_s macros work with LTO
Message-ID: <20171116171152.GH94341@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-12-samitolvanen@google.com>
 <20171116115433.GG9361@arm.com>
 <20171116130742.wijnukjetoupi4hc@yury-thinkpad>
 <20171116135650.GQ10515@gate.crashing.org>
 <20171116164608.GG94341@samitolvanen.mtv.corp.google.com>
 <20171116170144.GR10515@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171116170144.GR10515@gate.crashing.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Yury Norov <ynorov@caviumnetworks.com>, Will Deacon <will.deacon@arm.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Matthias Kaehlcke <mka@chromium.org>

On Thu, Nov 16, 2017 at 11:01:44AM -0600, Segher Boessenkool wrote:
> The thing with .purgem can work.  Inelegant, sure, but it can work :-)

It works, there are already functions in the kernel that use these
macros more than once. I agree that this might not be the most elegant
solution, but at least it allows us to use the same code path for both
compilers.

> Just make sure you do the macro define, the code that uses it, and the
> undefine, all in the same inline asm statement.

Yes, that's what we're doing here. Only KVM uses msr_s/msr_s directly,
everything else uses the (read|write)_sysreg_s wrappers instead, which
means the DEFINE/UNDEFINE macros are only needed in few places.

Sami
