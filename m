Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:44585 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932087Ab2KZW14 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 Nov 2012 17:27:56 -0500
Received: by mail-wi0-f174.google.com with SMTP id hm9so3931761wib.1
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Nov 2012 14:27:55 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH 3/3] scripts/kconfig: allow setting the root-menu label from environment
Date: Mon, 26 Nov 2012 23:27:48 +0100
References: <1353542766-24422-1-git-send-email-yann.morin.1998@free.fr> <201211232221.45291.yann.morin.1998@free.fr> <20121125204019.GA11106@merkur.ravnborg.org>
In-Reply-To: <20121125204019.GA11106@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201211262327.49146.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>

Sam, Michal, All,

Sam, see my comments in-lined below.
Michal, there are a bunch of questions for you toward the end.
Others: your feedback is also most welcome! ;-)

On Sunday 25 November 2012 Sam Ravnborg wrote:
> On Fri, Nov 23, 2012 at 10:21:44PM +0100, Yann E. MORIN wrote:
> > On Friday 23 November 2012 Sam Ravnborg wrote:
[--SNIP--]
> > > Could we instead introduce two reserved symbols like this:
> > > 
> > > config KCONFIG_ROOT_MENU
> > > 	string
> > > 	default "My own super duper root menu"
> > 
> > For the root-menu label, no need to add such a specific symbol, as
> > we already have the 'mainmenu' directive that sets the root-menu
> > label, eg.:
> >     mainmenu "My own super duper root menu"
> 
> Had forgoten about this - why is it that we do not use this, but invent
> an environment variable?

Just the sake of homogeneity: as I already introduced environment
variable to change the CONFIG_ prefix, then I also added an env var
for the root-menu, too.

But agreed, I'll drop the root-menu patches, since we already havea
run-time solution to override it.

> > > config KCONFIG_SYMBOL_PREFIX
> > > 	string
> > > 	default "SAM_"

OK, I'm tackling this, but my head is on the verge of exploding, trying
to follow all those intricate calls in the kconfig parser/menu layout.

/me goes and gets an aspirin. ;-)

However, rather than hard-coding the symbol name, what about introducing
a new 'option' keyword:
    config BLABLA       # Name of symbol is not meaningful
        string
        default "SAM_"
        option prefix

Currently, the only symbol (AFAIK) that is hard-coded is MODULES, which
can be overloaded with 'option modules' to another symbol. I would not
like to add any hard-coded symbol name.

Michal, as maintainer for this, we need your input:
  - do you want to keep the CONFIG_ environment variable, or do you
    prefer the symbol trick?

If you prefer the env var:
  - are you happy with the current naming?
  - if not, what name do you prefer: KCONFIG_CONFIG_ or KCONFIG_PREFIX,
    or anything else? Then, how do you want me to proceed: send a fix-up
    patch, or re-submit the previous series with the rename?

If you prefer the symbol trick:
  - will just revert my previously applied CONFIG_ series, or should I
    send a fix-up series that removes it before introducing the symbol
    trick?
  - do you prefer we hard-code the feature in the symbol name, or is the
    'option prefix' better suited?

> I never liked (and still do not like) how environment
> variables are used to adjust the front-end behaviour.
> The real reason why we use environment variables is that we cannot
> specify options for kconfig when we invoke make.

Yes, that's also on my todo-list: add a generic option-parsing function
in a common file, and have all frontends call it.

It's on the todo-list. so don't hold your breadth... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
