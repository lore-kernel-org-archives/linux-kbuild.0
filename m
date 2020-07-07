Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728357AbgGGV73 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 17:59:29 -0400
From: Arvind Sankar <nivedita@alum.mit.edu>
Date: Tue, 7 Jul 2020 17:59:25 -0400
Subject: Re: [PATCH v6 2/8] lib: prepare xxhash for preboot environment
Message-ID: <20200707215925.GA1591079@rani.riverdale.lan>
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
 <20200707034604.1539157-3-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200707034604.1539157-3-nickrterrell@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Terrell <nickrterrell@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, rmikey@fb.com, mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>, Sedat Dilek <sedat.dilek@gmail.com>, Norbert Lange <nolange79@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Nick Terrell <terrelln@fb.com>

On Mon, Jul 06, 2020 at 08:45:58PM -0700, Nick Terrell wrote:
> From: Nick Terrell <terrelln@fb.com>
> 
> Don't export symbols if XXH_PREBOOT is defined.
> 
> This change is necessary to get xxhash to work in a preboot environment,
> which is needed to support zstd-compressed kernels.

The usual way to do it is by adding -D__DISABLE_EXPORTS to the CFLAGS, which will
cause EXPORT_SYMBOL to be stubbed out. Doesn't that work here?
