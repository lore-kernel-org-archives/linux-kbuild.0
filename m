Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wx-out-0506.google.com ([66.249.82.225]:58328 "EHLO
	wx-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751447AbYGZJeP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Jul 2008 05:34:15 -0400
Received: by wx-out-0506.google.com with SMTP id h29so3713913wxd.4
        for <linux-kbuild@vger.kernel.org>; Sat, 26 Jul 2008 02:34:15 -0700 (PDT)
Message-ID: <520f0cf10807260234v64297490l6db807fee0864cc5@mail.gmail.com>
Date: Sat, 26 Jul 2008 11:34:14 +0200
From: "John Kacur" <jkacur@gmail.com>
Subject: Re: [PATCH] Change Kbuild message to match default
In-Reply-To: <200807160031.16323.jkacur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <200807160031.16323.jkacur@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, lkml@vger.kernel.org

On Wed, Jul 16, 2008 at 12:31 AM, jkacur <jkacur@gmail.com> wrote:
> Change the Kbuild "If unsure" message to match the default.
>
> Signed-off-by: John Kacur <jkacur at gmail dot com>
>
> Index: linux-2.6.26/init/Kconfig
> ===================================================================
> --- linux-2.6.26.orig/init/Kconfig
> +++ linux-2.6.26/init/Kconfig
> @@ -522,7 +522,7 @@ config CC_OPTIMIZE_FOR_SIZE
>          Enabling this option will pass "-Os" instead of "-O2" to gcc
>          resulting in a smaller kernel.
>
> -         If unsure, say N.
> +         If unsure, say Y.
>
>  config SYSCTL
>        bool
>

This seems like a no-brainer to me that the default and the "If
unsure" message should match, any reason you haven't picked-it up?

Thanks
John Kacur
