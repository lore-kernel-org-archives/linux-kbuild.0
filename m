Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34265 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932234AbcCCW57 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Mar 2016 17:57:59 -0500
Subject: Re: [PATCH v4 5/8] kbuild: add fine grained build dependencies for
 exported symbols
References: <1456717691-28298-1-git-send-email-nicolas.pitre@linaro.org>
 <1456717691-28298-6-git-send-email-nicolas.pitre@linaro.org>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56D8C174.70602@suse.com>
Date: Thu, 3 Mar 2016 23:57:56 +0100
MIME-Version: 1.0
In-Reply-To: <1456717691-28298-6-git-send-email-nicolas.pitre@linaro.org>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Dne 29.2.2016 v 04:48 Nicolas Pitre napsal(a):
> +# Filter out exported kernel symbol names advertised as warning pragmas
> +# by the preprocessor and write them to $(1). We must consider continuation
> +# lines as well: they start with a blank, or the preceeding line ends with
> +# a ':'. Anything else is passed through as is.
> +# See also __KSYM_DEP() in include/linux/export.h.
> +ksym_dep_filter = sed -n \
> +	-e '1 {x; $$!d}' \
> +	-e '/^ / {H; $$!d}' \
> +	-e 'x; /:$$/ {x; H; $$!d; s/^/ /; x}' \
> +	-e ':filter; /^.*KBUILD_AUTOKSYM_DEP: /! {p; b next}' \
> +	-e 's//KSYM_/; s/\n.*//; w $(1)' \
> +	-e ':next; $$!d' \
> +	-e '1 q; s/^/ /; x; /^ /! b filter'

This is unreadable and it does not work with my gcc version. I get
dependencies like

    $(wildcard include/config/ksym/simple/strtoull [enabled by default].h) \

Please use some other way, which does not require parsing the compiler
diagnostic messages. A straightforward solution is to do something
similar to genksyms: A separate preprocessor pass with -Dsomething that
leaves the EXPORT_SYMBOL statements alone and just collect their occurences.

Thanks,
Michal
