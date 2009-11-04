Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:40820 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751818AbZKDITv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Nov 2009 03:19:51 -0500
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 05/10] kbuild: sort the list of symbols exported by the kernel (__ksymtab)
Date: Wed, 4 Nov 2009 18:49:42 +1030
References: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com> <1257242782-10496-6-git-send-email-alan-jenkins@tuffmail.co.uk>
In-Reply-To: <1257242782-10496-6-git-send-email-alan-jenkins@tuffmail.co.uk>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <200911041849.43311.rusty@rustcorp.com.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Cc: greg@kroah.com, linux-kbuild@vger.kernel.org, carmelo73@gmail.com, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

On Tue, 3 Nov 2009 08:36:17 pm Alan Jenkins wrote:
> +/*
> + * We use CPP macros since they are more familiar than assembly macros.
> + * Note that CPP macros eat newlines, so each statement must be terminated
> + * by a semicolon.
> + */
> +
> +#ifdef CONFIG_HAVE_SYMBOL_PREFIX
> +#define __SYM(sym) _##sym
> +#else
> +#define __SYM(sym) sym
> +#endif

Ideally, you would used MODULE_SYMBOL_PREFIX here, but of course it's a
string.  I don't think Kconfig can do arbitrary identifiers, so we can't
make CONFIG_SYMBOL_PREFIX empty or _.

Perhaps clarify it to a bool CONFIG_HAVE_MODULE_UNDERSCORE_PREFIX then,
since that's what you're assuming here?

Thanks,
Rusty.
