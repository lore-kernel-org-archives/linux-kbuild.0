Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728294AbgGHCt2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 22:49:28 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF3AC061755
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Jul 2020 19:49:28 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id z5so20942353pgb.6
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Jul 2020 19:49:28 -0700 (PDT)
Date: Tue, 7 Jul 2020 19:49:25 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v6 2/8] lib: prepare xxhash for preboot environment
Message-ID: <202007071947.5E9723AF48@keescook>
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
 <20200707034604.1539157-3-nickrterrell@gmail.com>
 <20200707215925.GA1591079@rani.riverdale.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707215925.GA1591079@rani.riverdale.lan>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arvind Sankar <nivedita@alum.mit.edu>
Cc: Nick Terrell <nickrterrell@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, rmikey@fb.com, mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>, Sedat Dilek <sedat.dilek@gmail.com>, Norbert Lange <nolange79@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Nick Terrell <terrelln@fb.com>

On Tue, Jul 07, 2020 at 05:59:25PM -0400, Arvind Sankar wrote:
> On Mon, Jul 06, 2020 at 08:45:58PM -0700, Nick Terrell wrote:
> > From: Nick Terrell <terrelln@fb.com>
> > 
> > Don't export symbols if XXH_PREBOOT is defined.
> > 
> > This change is necessary to get xxhash to work in a preboot environment,
> > which is needed to support zstd-compressed kernels.
> 
> The usual way to do it is by adding -D__DISABLE_EXPORTS to the CFLAGS, which will
> cause EXPORT_SYMBOL to be stubbed out. Doesn't that work here?

This is quite rare, actually:

$ git grep DISABLE_EXPORTS
arch/s390/purgatory/Makefile:CFLAGS_sha256.o := -D__DISABLE_EXPORTS
arch/x86/boot/compressed/kaslr.c:#define __DISABLE_EXPORTS
arch/x86/purgatory/Makefile:CFLAGS_sha256.o := -D__DISABLE_EXPORTS
drivers/firmware/efi/libstub/Makefile: -D__DISABLE_EXPORTS
include/linux/export.h:#if !defined(CONFIG_MODULES) || defined(__DISABLE_EXPORTS)

But yes, it seems that would be the better approach.

-- 
Kees Cook
