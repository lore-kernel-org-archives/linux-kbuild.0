Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f173.google.com ([209.85.213.173]:36640 "EHLO
	mail-ig0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752960AbbDGJCY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 Apr 2015 05:02:24 -0400
Received: by igblo3 with SMTP id lo3so6312121igb.1
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Apr 2015 02:02:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1427721632-11665-1-git-send-email-ard.biesheuvel@linaro.org>
References: <1427721632-11665-1-git-send-email-ard.biesheuvel@linaro.org>
Date: Tue, 7 Apr 2015 11:02:22 +0200
Message-ID: <CAKv+Gu-HkK96hz7zKQeJfeh2YiRY+qGaWkQdrSn0=n+P0qeHZQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Kbuild: kallsyms: update suffix ignore logic
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.cz>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>

On 30 March 2015 at 15:20, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> Two patches that update the kallsyms ignore logic.
>
> Patch #1 adds logic to introduce symbols whose names end in (or equal)
> "_veneer". This prevent kallsyms generation errors on large ARM kernels
> where the emitted veneers will be different between the first and second
> pass, due to the fact that the size of the kallsyms region itself pushes
> the .text and .init.text sections further apart during the second pass.
>
> Patch #2 removes the handling of the "gcc[0-9]_compiled." symbol. It was
> only ever emitted by GCC v2.x which we don't support anymore anyway.
>
> This series is a followup to ' [RFC PATCH 0/2] ARM large kernels'
> (http://thread.gmane.org/gmane.linux.kbuild.devel/13065), but the
> other issue addressed by patch #2 of that series will be deferred
> for now.
>
> Ard Biesheuvel (2):
>   Kbuild: kallsyms: ignore veneers emitted by the ARM linker
>   Kbuild: kallsyms: drop special handling of pre-3.0 GCC symbols
>
>  scripts/kallsyms.c | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
>

Ping?
