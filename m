Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:55595 "EHLO
	asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932135AbcBHWY5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Feb 2016 17:24:57 -0500
Date: Mon, 8 Feb 2016 23:16:05 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/6] allow for per-symbol configurable EXPORT_SYMBOL()
Message-ID: <20160208221605.GB13832@ravnborg.org>
References: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org>
 <1454963315-20468-3-git-send-email-nicolas.pitre@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454963315-20468-3-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Rusty Russell <rusty@rustcorp.com.au>

On Mon, Feb 08, 2016 at 03:28:31PM -0500, Nicolas Pitre wrote:
> Similar to include/generated/autoconf.h, include/generated/expsyms.h will
> contain a list of defines for each EXPORT_SYMBOL() that we want active.
> The format is:
> 
>   #define __EXPSYM_<symbol_name> 1

Please spell it out.
EXP could be EXPECT...


> +	$(Q)touch include/generated/expsyms.h

Same goes here. Make it explicit what this is about.
It is obvious today that "exp" is synonym for export_symbol.
But in one year less so.

Same goes for CONFIG_ symbol etc.

	Sam
> 
