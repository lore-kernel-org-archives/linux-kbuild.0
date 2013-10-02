Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:48388 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752614Ab3JBFhE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Oct 2013 01:37:04 -0400
Received: by mail-pa0-f45.google.com with SMTP id rd3so544168pab.32
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Oct 2013 22:37:04 -0700 (PDT)
Date: Tue, 1 Oct 2013 22:37:02 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH 1/4] kconfig: add short explanation to SYMBOL_WRITE
In-Reply-To: <4542076.yVG8YKgu5r@tacticalops>
Message-ID: <alpine.DEB.2.02.1310012236360.5682@chino.kir.corp.google.com>
References: <4542076.yVG8YKgu5r@tacticalops>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Martin Walch <walch.martin@web.de>
Cc: Michal Marek <mmarek@suse.cz>, Jiri Kosina <trivial@kernel.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Benjamin Poirier <bpoirier@suse.de>, Dirk Gouders <dirk@gouders.net>, Wang YanQing <udknight@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Jean Delvare <jdelvare@suse.de>, Kees Cook <keescook@chromium.org>, Alan Cox <alan@linux.intel.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2 Oct 2013, Martin Walch wrote:

> diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
> index df198a5..ba663e1 100644
> --- a/scripts/kconfig/expr.h
> +++ b/scripts/kconfig/expr.h
> @@ -93,7 +93,7 @@ struct symbol {
>  #define SYMBOL_CHOICEVAL  0x0020  /* used as a value in a choice block */
>  #define SYMBOL_VALID      0x0080  /* set when symbol.curr is calculated */
>  #define SYMBOL_OPTIONAL   0x0100  /* choice is optional - values can be 'n' */
> -#define SYMBOL_WRITE      0x0200  /* ? */
> +#define SYMBOL_WRITE      0x0200  /* write symbol to file (KCONFIG_CONFIG) */
>  #define SYMBOL_CHANGED    0x0400  /* ? */
>  #define SYMBOL_AUTO       0x1000  /* value from environment variable */
>  #define SYMBOL_CHECKED    0x2000  /* used during dependency checking */

Perhaps stating that the choice is writable by the user?
