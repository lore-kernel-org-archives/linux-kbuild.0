Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:47766 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934717AbeFMBJa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jun 2018 21:09:30 -0400
Subject: Re: [PATCH v2] nconf: respect i-search pattern boundaries
References: <20180612190604.4889-1-dirk@gouders.net>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d22bf7c4-45ce-3354-8bbc-feb9c755f92c@infradead.org>
Date: Tue, 12 Jun 2018 18:09:28 -0700
MIME-Version: 1.0
In-Reply-To: <20180612190604.4889-1-dirk@gouders.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 06/12/2018 12:06 PM, Dirk Gouders wrote:
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
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> ---
> Changes in v2: Correct S-O-B line, remove double search from subject.
> ---
>  scripts/kconfig/nconf.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Hi Dirk,

For v1 of the patch:  no, I wasn't using PageUp/PageDown, just the up/down arrow
keys.

Maybe I'm confused about /search in nconfig.  nconfig Help says:

 ││ Start incremental, case-insensitive search for STRING in menu entries,   ││
 ││     no regex support, STRING is displayed in upper left corner           ││
 ││                             </>STRING                                    ││
 ││     Remove last character   <Backspace>                                  ││
 ││     Jump to next hit        <Down>                                       ││
 ││     Jump to previous hit    <Up>                                         ││
 ││ Exit menu search mode       </>  <Esc>

First of all, does this only search in the Kconfig prompt strings?

(from top-level menu)
OK, I want to search for "debug", so I enter "/debug" and the upper left
corner displays: searching: debug

The nconfig highlight bar goes to the Device Drivers menu.
That's it.  It hasn't found "debug" (it found "de" AFAICT).
Using Up/Down arrow keys don't do anything.  I gave up.

What am I doing wrong?

thanks,
-- 
~Randy
