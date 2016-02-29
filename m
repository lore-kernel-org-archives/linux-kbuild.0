Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:53348 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750752AbcB2M6Q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Feb 2016 07:58:16 -0500
Subject: Re: [PATCH] lz4c: shut up lz4c output
References: <1456749618-1067584-1-git-send-email-arnd@arndb.de>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56D44065.4070005@suse.com>
Date: Mon, 29 Feb 2016 13:58:13 +0100
MIME-Version: 1.0
In-Reply-To: <1456749618-1067584-1-git-send-email-arnd@arndb.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2016-02-29 13:40, Arnd Bergmann wrote:
> When KERNEL_LZ4 is set, we always get an output even when building
> with 'make -s':
> 
>     *** LZ4 Compression CLI , by Yann Collet (May 31 2013) ***
>     ! Generating compressed LZ4 using Legacy format (deprecated !) !
>     Using stdin for input
>     Using stdout for output
>     Compressed 11213376 bytes into 4555781 bytes ==> 40.63%
>     Done in 0.63 s ==> 16.97 MB/s
> 
> The output is not helpful in the context of building the kernel,
> so this patch hides the stdout output of the lz4 binary completely.

> -	lz4c -l -c1 stdin stdout && $(call size_append, $(filter-out FORCE,$^))) > $@ || \
> +	lz4c -l -c1 stdin stdout && $(call size_append, $(filter-out FORCE,$^))) > $@ 2>&1 || \
>  	(rm -f $@ ; false)

Hi Arnd,

this redirection does not hide it, but rather includes it in the
compressed image file.

BTW, my copy of lz4c only displays this warning with -v.

Michal

