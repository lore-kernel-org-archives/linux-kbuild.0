Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:43238 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933363AbeFLQTm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jun 2018 12:19:42 -0400
Subject: Re: [PATCH] nconf: respect i-search search pattern boundaries
References: <20180612120441.22325-1-dirk@gouders.net>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e6ca0598-bdac-aef7-5b5d-5b593f122ba8@infradead.org>
Date: Tue, 12 Jun 2018 09:19:38 -0700
MIME-Version: 1.0
In-Reply-To: <20180612120441.22325-1-dirk@gouders.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Dirk@services.gouders.net

On 06/12/2018 05:04 AM, Dirk Gouders wrote:
> This patch adds boundary checks for nconf's i-search pattern.
> 
> Further, the pattern buffer is always bzero'ed when '/' is
> pressed, so the second line in the code below was not needed (and
> otherwise wouldn't have worked as expected):
> 
> 	state->pattern[strlen(state->pattern)] = c;
> 	state->pattern[strlen(state->pattern)] = '\0';
> 
> Finally, the pattern length was reduced to a length that still
> seems sufficient but will not fill more than the top line of the
> screen, thus eliminating special treatment needs on resizes or normal
> exit of i-search.
> 
> Signed-off-by: Dirk Gouders

S-O-B: line should also have your email address after your name.

> ---
>  scripts/kconfig/nconf.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Your patch descsription makes sense.  I tested nconf (make nconfig)
both with and without this patch.  I didn't like the /search results
in either case.  F1 (Help) says:

 ││ Start incremental, case-insensitive search for STRING in menu entries,   ││
 ││     no regex support, STRING is displayed in upper left corner           ││
 ││                             </>STRING                                    ││
 ││     Remove last character   <Backspace>                                  ││
 ││     Jump to next hit        <Down>                                       ││
 ││     Jump to previous hit    <Up>                                         ││
 ││ Exit menu search mode       </>  <Esc>

but I couldn't get <Down> == "Jump to next hit" to work for me at all
(with or without the patch).

thanks,
-- 
~Randy
