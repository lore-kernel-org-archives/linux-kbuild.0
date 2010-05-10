Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:50900 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755026Ab0EJQwN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 May 2010 12:52:13 -0400
MIME-Version: 1.0
In-Reply-To: <1273508667-5152-5-git-send-email-npalix@diku.dk>
References: <1273508667-5152-1-git-send-email-npalix@diku.dk>
	 <1273508667-5152-5-git-send-email-npalix@diku.dk>
Date: Mon, 10 May 2010 19:52:10 +0300
Message-ID: <o2y84144f021005100952z1a7e991dt21341fb8f7c76af@mail.gmail.com>
Subject: Re: [PATCH 4/4] Add scripts/coccinelle/resource_size.cocci
From: Pekka Enberg <penberg@cs.helsinki.fi>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Palix <npalix@diku.dk>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Roland Dreier <rdreier@cisco.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, cocci@diku.dk, Wolfram Sang <w.sang@pengutronix.de>, Kernel Janitors <kernel-janitors@vger.kernel.org>

On Mon, May 10, 2010 at 7:24 PM, Nicolas Palix <npalix@diku.dk> wrote:
> @@ -0,0 +1,94 @@
> +///
> +/// Use resource_size function on resource object
> +/// instead of explicit computation.
> +///
> +//  Confidence: High
> +//  Copyright: (C) 2009, 2010 Nicolas Palix, DIKU.  GPLv2.
> +//  Copyright: (C) 2009, 2010 Julia Lawall, DIKU.  GPLv2.
> +//  Copyright: (C) 2009, 2010 Gilles Muller, INRIA/LiP6.  GPLv2.
> +//  URL: http://coccinelle.lip6.fr/
> +//  Options:
> +//
> +//  Keywords: resource_size
> +//  Version min: 2.6.27 resource_size

I guess we don't need this versioning in mainline?
