Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:34381 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756267Ab2KWVVt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 23 Nov 2012 16:21:49 -0500
Received: by mail-wi0-f178.google.com with SMTP id hm6so1922245wib.1
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Nov 2012 13:21:47 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH 3/3] scripts/kconfig: allow setting the root-menu label from environment
Date: Fri, 23 Nov 2012 22:21:44 +0100
References: <1353542766-24422-1-git-send-email-yann.morin.1998@free.fr> <1353542766-24422-4-git-send-email-yann.morin.1998@free.fr> <20121123183211.GB10586@merkur.ravnborg.org>
In-Reply-To: <20121123183211.GB10586@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201211232221.45291.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>

Sam, All,

On Friday 23 November 2012 Sam Ravnborg wrote:
> On Thu, Nov 22, 2012 at 01:06:06AM +0100, Yann E. MORIN wrote:
> > Currently, the root-menu label is hard-coded in the kconfig frontends
> > executables. This means that two projects that use kconfig and want
> > to display different root-menu labels can not share the same kconfig
> > frontends.
> > 
> > Instead of hard-coding the label in the frontends, handle it the same
> > we handle the CONFIG_ prefix:
> >   - get the root-menu label from the environment if present
> >   - allow to set it at build time (eg. -DROOTMENU='"Root menu label"')
> >   - fallback to a hard-coded default
> 
> I have note paid attention to these CONFIG_ patches - and only now
> I took a short look at this set and I am not soo hapy
> that we start to introduce a lot a environment variables for all this stuff.
> 
> (A lot in this context is two).

Note that we already make heavy use of environment variables in the kconfig
frontends; from Documentation/kbuild/kconfig.txt:
    KCONFIG_ALLCONFIG
    KCONFIG_AUTOCONFIG
    KCONFIG_AUTOHEADER
    KCONFIG_CONFIG
    KCONFIG_NOSILENTUPDATE
    KCONFIG_OVERWRITECONFIG
    KCONFIG_TRISTATE

They are all prefixed with KCONFIG_, which I did not do in my submission,
because:
  - for CONFIG_, we already used a macro named CONFIG_, and I just
    reproduced that
  - for CONFIG_ROOTMENU, I just mimicked CONFIG_ and appended ROOTMENU

Obviously, CONFIG_ and CONFIG_ROOTMENU should be renamed, if we eventually
want to keep them:
  - CONFIG_          -->  KCONFIG_CONFIG_   or KCONFIG_CONFIG_PREFIX ?
  - CONFIG_ROOTMENU  -->  KCONFIG_ROOTMENU

Note: I missed updating the Documentation with these two new variables.

> Could we instead introduce two reserved symbols like this:
> 
> config KCONFIG_ROOT_MENU
> 	string
> 	default "My own super duper root menu"

For the root-menu label, no need to add such a specific symbol, as
we already have the 'mainmenu' directive that sets the root-menu
label, eg.:
    mainmenu "My own super duper root menu"

> config KCONFIG_SYMBOL_PREFIX
> 	string
> 	default "SAM_"

I am a bit uneasy adding magic in the kconfig language to drive the
behavior of the frontends.

To me, it makes more sense to drive the frontends using environment
variables.

> We already so something remotely like this for SYMBOLS
> where one can define:
> 
> config MY_SYMBOLS
> 	option modules
> 
> Then MY_SYMBOLS in used as replacement for SYMBOLS

You mean, for MODULES?

There's also DEFCONFIG_LIST.

> I did not implement this - but it looks sufficiently simple
> to warrant getting rid on the dependency on the enviromnet variables.

We already have 7 environment variables. That's just two more of them.

Anyway, I'll rework the series:
  - fix the variables names
  - add documentation

I'll also tackle this using config symbols instead.

Michal, now you have applied the CONFIG_ patches, what should I do to
rename it, so it is prefixed with KCONFIG_:
  - prepare a patch on your kconuild/kconfig branch, or
  - resubmit a complete series, that you'll apply after you trim the
    already applied changes?

What name would you prefer to rename CONFIG_ to:
  - KCONFIG_CONFIG_, or
  - KCONFIG_CONFIG_PREFIX?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
