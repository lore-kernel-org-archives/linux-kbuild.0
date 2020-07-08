Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728061AbgGHDZS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 23:25:18 -0400
From: Arvind Sankar <nivedita@alum.mit.edu>
Date: Tue, 7 Jul 2020 23:25:15 -0400
Subject: Re: [PATCH v6 4/8] init: add support for zstd compressed kernel
Message-ID: <20200708032515.GC1847378@rani.riverdale.lan>
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
 <20200707034604.1539157-5-nickrterrell@gmail.com>
 <20200707221130.GB1591079@rani.riverdale.lan>
 <BFD3E8B0-4BAA-4E3A-AF16-FB17E88BECFE@fb.com>
 <20200708030939.GA1847378@rani.riverdale.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200708030939.GA1847378@rani.riverdale.lan>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arvind Sankar <nivedita@alum.mit.edu>
Cc: Nick Terrell <terrelln@fb.com>, Nick Terrell <nickrterrell@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, Michael van der Westhuizen <rmikey@fb.com>, "mingo@kernel.org" <mingo@kernel.org>, Patrick Williams <patrick@stwcx.xyz>, Sedat Dilek <sedat.dilek@gmail.com>, Norbert Lange <nolange79@gmail.com>, Andrew Morton <akpm@linux-foundation.org>

On Tue, Jul 07, 2020 at 11:09:39PM -0400, Arvind Sankar wrote:
> On Wed, Jul 08, 2020 at 02:01:50AM +0000, Nick Terrell wrote:
> > 
> > 
> > > On Jul 7, 2020, at 6:11 PM, Arvind Sankar <nivedita@alum.mit.edu> wrote:
> > > 
> > > On Mon, Jul 06, 2020 at 08:46:00PM -0700, Nick Terrell wrote:
> > >> From: Nick Terrell <terrelln@fb.com>
> > >> 
> > >> * Adds the zstd cmd to scripts/Makefile.lib
> > >> * Adds the HAVE_KERNEL_ZSTD and KERNEL_ZSTD options
> > >> 
> > >> Architecture specific support is still needed for decompression.
> > >> 
> > >> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > >> index 916b2f7f7098..d960f8815f87 100644
> > >> --- a/scripts/Makefile.lib
> > >> +++ b/scripts/Makefile.lib
> > >> @@ -413,6 +413,21 @@ quiet_cmd_xzkern = XZKERN  $@
> > >> quiet_cmd_xzmisc = XZMISC  $@
> > >>       cmd_xzmisc = cat $(real-prereqs) | $(XZ) --check=crc32 --lzma2=dict=1MiB > $@
> > >> 
> > >> +# ZSTD
> > >> +# ---------------------------------------------------------------------------
> > >> +# Appends the uncompressed size of the data using size_append. The .zst
> > >> +# format has the size information available at the beginning of the file too,
> > >> +# but it's in a more complex format and it's good to avoid changing the part
> > >> +# of the boot code that reads the uncompressed size.
> > >> +# Note that the bytes added by size_append will make the zstd tool think that
> > >> +# the file is corrupt. This is expected.
> > >> +
> > >> +quiet_cmd_zstd = ZSTD    $@
> > >> +cmd_zstd = (cat $(filter-out FORCE,$^) | \
> > > 		   ^^ should just be $(real-prereqs)
> > >> +	zstd -19 && \
> > >> +        $(call size_append, $(filter-out FORCE,$^))) > $@ || \
> > > 	   ^^ size_append does not take arguments. It's used as just
> > > 	   $(size_append) and will always output shell code to print the
> > > 	   total size of $(real-prereqs) -- see other compressor command
> > > 	   definitions.
> > 
> > Yeah, when I wrote this code, this was how the rest of the compressors were implemented.
> > I noticed that they had all been updated when I was responding to Norbert Lange earlier.
> > I will submit a v7 shortly with the updated command.
> > 
> > Thanks for the review,
> > Nick
> > 
> > 
> 
> Looks like it changed in 5.1. I guess this patch has been floating
> around for quite some time :) Here's hoping v8 is the last one!

Err, I meant v7. Hope I didn't jinx it.
