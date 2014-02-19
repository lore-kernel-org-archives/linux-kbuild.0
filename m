Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lgeamrelo01.lge.com ([156.147.1.125]:47972 "EHLO
	LGEAMRELO01.lge.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752752AbaBSHvi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Feb 2014 02:51:38 -0500
Date: Wed, 19 Feb 2014 16:51:35 +0900
From: Kyungsik Lee <kyungsik.lee@lge.com>
Subject: Re: [PATCH] Fix flags for initramfs LZ4 compression
Message-ID: <20140219075135.GA5352@hulk>
References: <20140215231447.GA30803@dev.danweeks.net>
 <20140218160856.235f259bc5865e05e8f24a36@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140218160856.235f259bc5865e05e8f24a36@linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, "Daniel M. Weeks" <dan@danweeks.net>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, hyojun.im@lge.com, chan.jeong@lge.com

Hello,

On Tue, Feb 18, 2014 at 04:08:56PM -0800, Andrew Morton wrote:
> On Sat, 15 Feb 2014 18:14:57 -0500 "Daniel M. Weeks" <dan@danweeks.net> wrote:
> 
> > LZ4 as implemented in the kernel differs from the default method now
> > used by the reference implementation of LZ4. Until the in-kernel method
> > is updated to support the new default, passing the legacy flag (-l) to
> > the compressor is necessary. Without this flag the kernel-generated,
> > LZ4-compressed initramfs is junk.
> > 
> > ...
> >
> > --- a/scripts/gen_initramfs_list.sh
> > +++ b/scripts/gen_initramfs_list.sh
> > @@ -257,7 +257,7 @@ case "$arg" in
> >                  && compr="lzop -9 -f"
> >  		echo "$output_file" | grep -q "\.lz4$" \
> >                  && [ -x "`which lz4 2> /dev/null`" ] \
> > -                && compr="lz4 -9 -f"
> > +                && compr="lz4 -l -9 -f"
> >  		echo "$output_file" | grep -q "\.cpio$" && compr="cat"
> >  		shift
> >  		;;
> 
> What happens is the user is running an old version of /bin/lz4?  A
> version which predates this switch to a new format?  Do those earlier
> versions accept -l, even though they don't need it?  Or will the kernel
> build fail?

It seems that lz4 supports legacy format with the same option as lz4c
does. Just looking at the first few bytes of lz4 compressed image, we
can see whether it is new format or not.

It shows new format magic number without this patch. New format magic
number is 0x184d2204.

$ hexdump -C ./initramfs_data.cpio.lz4 |more
00000000  04 22 4d 18 64 70 b9 69 (Little Endian)
...

Currently Kernel supports legacy format only.

Acked-by: Kyungsik Lee <kyungsik.lee@lge.com>

Thanks,
Kyungsik

