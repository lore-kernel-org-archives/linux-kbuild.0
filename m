Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193]:34123 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727524AbgAAW0t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jan 2020 17:26:49 -0500
From: Arvind Sankar <nivedita@alum.mit.edu>
Date: Wed, 1 Jan 2020 17:26:45 -0500
Subject: Re: [PATCH] menuconfig: restore prompt dependencies in help text
Message-ID: <20200101222644.GA438328@rani.riverdale.lan>
References: <20191231055839.GG4203@ZenIV.linux.org.uk>
 <20200101204152.402906-1-nivedita@alum.mit.edu>
 <20200101210426.GA8904@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200101210426.GA8904@ZenIV.linux.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Arvind Sankar <nivedita@alum.mit.edu>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, Rob Landley <rob@landley.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org

On Wed, Jan 01, 2020 at 09:04:26PM +0000, Al Viro wrote:
> On Wed, Jan 01, 2020 at 03:41:52PM -0500, Arvind Sankar wrote:
> > Commit bcdedcc1afd6 ("menuconfig: print more info for symbol without
> > prompts") moved some code from get_prompt_str to get_symbol_str so that
> > dependency information for symbols without prompts could be shown.
> > 
> > This code would be better copied rather than moved, as the change had
> > the side-effect of not showing any extra dependencies that the prompt
> > might have over the symbol.
> > 
> > Put back a copy of the dependency printing code in get_prompt_str.
> 
> Umm... Is "visible" really accurate in this case?  AFAICS, the
> entry (and help for it) _is_ visible with EXPERT=n.  OTOH, with
> EXPERT=y and MULTIUSER=n it disappears completely.
> 
> I'm not familiar with kconfig guts (and not too concerned about that
> feature of help there, TBH), but it looks like what you are printing
> there is some mix of dependencies ("visible when") and selectability...

Perhaps not the most accurate term. For NAMESPACES it has a submenu, so
it can't disappear as long as its selected, even if it's not editable
any more. A "leaf" level option like MULTIUSER, otoh, does disappear
completely (even though it's still selected).

But there are also things like CONFIG_VT, which stays visible, even
though its not a menu.. I think because there is a visible option that
depends on it and immediately follows, which menuconfig shows by
indenting. If the order of UNIX98_PTYS and VT_HW_CONSOLE_BINDING is
flipped in drivers/tty/Kconfig, then VT disappears when EXPERT=n.

Dunno, maybe Editable would be a better word than Visible?
