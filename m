Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:60952 "EHLO
	asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755975AbcBHWUY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Feb 2016 17:20:24 -0500
Date: Mon, 8 Feb 2016 23:12:57 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/6] kbuild: record needed exported symbols for modules
Message-ID: <20160208221256.GA13832@ravnborg.org>
References: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org>
 <1454963315-20468-2-git-send-email-nicolas.pitre@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454963315-20468-2-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Rusty Russell <rusty@rustcorp.com.au>

>  
> +# List module undefined symbols
> +ifdef CONFIG_TRIM_UNUSED_EXPSYMS
> +cmd_undef_syms = $(NM) $@ | sed -n 's/^ \+U \(.*\)/\1/p' | xargs echo
> +else
> +cmd_undef_syms = echo
> +endif
Use ":" as a "do nothing" cammand. Then you do not emit an empty line.

	Sam
