Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:51719 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750871AbaBSAI5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Feb 2014 19:08:57 -0500
Date: Tue, 18 Feb 2014 16:08:56 -0800
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] Fix flags for initramfs LZ4 compression
Message-Id: <20140218160856.235f259bc5865e05e8f24a36@linux-foundation.org>
In-Reply-To: <20140215231447.GA30803@dev.danweeks.net>
References: <20140215231447.GA30803@dev.danweeks.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Daniel M. Weeks" <dan@danweeks.net>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungsik Lee <kyungsik.lee@lge.com>

On Sat, 15 Feb 2014 18:14:57 -0500 "Daniel M. Weeks" <dan@danweeks.net> wrote:

> LZ4 as implemented in the kernel differs from the default method now
> used by the reference implementation of LZ4. Until the in-kernel method
> is updated to support the new default, passing the legacy flag (-l) to
> the compressor is necessary. Without this flag the kernel-generated,
> LZ4-compressed initramfs is junk.
> 
> ...
>
> --- a/scripts/gen_initramfs_list.sh
> +++ b/scripts/gen_initramfs_list.sh
> @@ -257,7 +257,7 @@ case "$arg" in
>                  && compr="lzop -9 -f"
>  		echo "$output_file" | grep -q "\.lz4$" \
>                  && [ -x "`which lz4 2> /dev/null`" ] \
> -                && compr="lz4 -9 -f"
> +                && compr="lz4 -l -9 -f"
>  		echo "$output_file" | grep -q "\.cpio$" && compr="cat"
>  		shift
>  		;;

What happens is the user is running an old version of /bin/lz4?  A
version which predates this switch to a new format?  Do those earlier
versions accept -l, even though they don't need it?  Or will the kernel
build fail?

