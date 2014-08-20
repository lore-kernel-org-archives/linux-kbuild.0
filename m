Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43635 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751575AbaHTTrE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Aug 2014 15:47:04 -0400
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 2/3] kbuild: handle module compression while running 'make modules_install'.
In-Reply-To: <1408474660-24999-3-git-send-email-beber@meleeweb.net>
References: <1408474660-24999-1-git-send-email-beber@meleeweb.net> <1408474660-24999-3-git-send-email-beber@meleeweb.net>
Date: Thu, 21 Aug 2014 01:39:59 +0930
Message-ID: <87r40bi1m0.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bertrand Jacquin <beber@meleeweb.net>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>

Bertrand Jacquin <beber@meleeweb.net> writes:

> Since module-init-tools (gzip) and kmod (gzip and xz) support compressed
> modules, it could be useful to include a support for compressing modules
> right after having them installed. Doing this in kbuild instead of per
> distro can permit to make this kind of usage more generic.
>
> This patch add a Kconfig entry to "Enable loadable module support" menu
> and let you choose to compress using gzip (default) or xz.
>
> Both gzip and xz does not used any extra -[1-9] option since Andi Kleen
> and Rusty Russell prove no gain is made using them. gzip is called with -n
> argument to avoid storing original filename inside compressed file, that
> way we can save some more bytes.
>
> On a v3.16 kernel, 'make allmodconfig' generated 4680 modules for a
> total of 378MB (no strip, no sign, no compress), the following table
> shows observed disk space gain based on the allmodconfig .config :
>
>        |           time                |
>        +-------------+-----------------+
>        | manual .ko  |       make      | size | percent
>        | compression | modules_install |      | gain
>        +-------------+-----------------+------+--------
>   -    |             |     18.61s      | 378M |
>   GZIP |   3m16s     |     3m37s       | 102M | 73.41%
>   XZ   |   5m22s     |     5m39s       |  77M | 79.83%
>
> The gain for restricted environnement seems to be interesting while
> uncompress can be time consuming but happens only while loading a module,
> that is generally done only once.
>
> This is fully compatible with signed modules while the signed module is
> compressed. module-init-tools or kmod handles decompression
> and provide to other layer the uncompressed but signed payload.
>
> Reviewed-by: Willy Tarreau <w@1wt.eu>
> Signed-off-by: Bertrand Jacquin <beber@meleeweb.net>

Thanks, applied these two as well.  They'll go in *next* merge window
(ie. 3.18).

Cheers.
Rusty.
