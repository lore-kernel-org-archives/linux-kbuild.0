Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:40031 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753438Ab3JBXm3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Oct 2013 19:42:29 -0400
Received: by mail-pb0-f41.google.com with SMTP id rp2so1614711pbb.0
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Oct 2013 16:42:29 -0700 (PDT)
Date: Wed, 2 Oct 2013 16:42:27 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH 1/4] kconfig: add short explanation to SYMBOL_WRITE
In-Reply-To: <2034014.asIXrEbcsn@tacticalops>
Message-ID: <alpine.DEB.2.02.1310021641280.9096@chino.kir.corp.google.com>
References: <4542076.yVG8YKgu5r@tacticalops> <alpine.DEB.2.02.1310012236360.5682@chino.kir.corp.google.com> <2034014.asIXrEbcsn@tacticalops>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Martin Walch <walch.martin@web.de>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Jiri Kosina <trivial@kernel.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Benjamin Poirier <bpoirier@suse.de>, Dirk Gouders <dirk@gouders.net>, Wang YanQing <udknight@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Jean Delvare <jdelvare@suse.de>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org

On Thu, 3 Oct 2013, Martin Walch wrote:

> So, if I have not missed anything, SYMBOL_WRITE decides whether to write a symbol
> to .config or not. This does not necessarily mean that the user can change the value.
> SYMBOL_WRITE may be set and the symbol may be written to .config while the user
> does not even see the corresponding prompt.
> 

The purpose of SYMBOL_WRITE is in sym_calc_value() where it is set if the 
config symbol is visible and settable by the user, which is why I 
suggested it be specified as being writable by the user.
