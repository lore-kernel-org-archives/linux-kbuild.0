Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:65508 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753114Ab3JCA0y (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Oct 2013 20:26:54 -0400
Received: from tacticalops.localnet ([93.132.133.153]) by smtp.web.de
 (mrweb102) with ESMTPSA (Nemesis) id 0Meji8-1VCAfC4BLs-00OKW7 for
 <linux-kbuild@vger.kernel.org>; Thu, 03 Oct 2013 02:26:52 +0200
From: Martin Walch <walch.martin@web.de>
Subject: Re: [PATCH 1/4] kconfig: add short explanation to SYMBOL_WRITE
Date: Thu, 03 Oct 2013 02:26:49 +0200
Message-ID: <49327842.0x8EUPeB87@tacticalops>
In-Reply-To: <alpine.DEB.2.02.1310021641280.9096@chino.kir.corp.google.com>
References: <4542076.yVG8YKgu5r@tacticalops> <2034014.asIXrEbcsn@tacticalops> <alpine.DEB.2.02.1310021641280.9096@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Rientjes <rientjes@google.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Jiri Kosina <trivial@kernel.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>, Benjamin Poirier <bpoirier@suse.de>, Dirk Gouders <dirk@gouders.net>, Wang YanQing <udknight@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Jean Delvare <jdelvare@suse.de>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org

On Wednesday 02 October 2013 16:42:27 David Rientjes wrote:
> The purpose of SYMBOL_WRITE is in sym_calc_value() where it is set if the 
> config symbol is visible and settable by the user, which is why I 
> suggested it be specified as being writable by the user.

Then this looks strange to me: a config symbol of type boolean or tristate
that is not visible, but has a default value != n will have SYMBOL_WRITE set
in sym_calc_value:

> case S_BOOLEAN:
> case S_TRISTATE:
>	if (sym_is_choice_value(sym) && sym->visible == yes) {
> 		...
>	} else {
>		...
> 		if (!sym_is_choice(sym)) {
> 			prop = sym_get_default_prop(sym);
> 			if (prop) {
> 				sym->flags |= SYMBOL_WRITE;
> 				newval.tri = EXPR_AND(expr_calc_value(prop->expr),
> 					prop->visible.tri);
> 			}
> 		}
>		...
>	}
-- 

