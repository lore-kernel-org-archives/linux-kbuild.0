Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:17307 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754796Ab0LOWDN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 17:03:13 -0500
From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Subject: Re: RFC: multi-sourced file, multiple choice 'instanciations'
Date: Wed, 15 Dec 2010 23:03:11 +0100
References: <201012150034.01356.yann.morin.1998@anciens.enib.fr> <AANLkTinAVtq6W=tKmf5ezkYDKyUH_udS632995HZF_Ly@mail.gmail.com>
In-Reply-To: <AANLkTinAVtq6W=tKmf5ezkYDKyUH_udS632995HZF_Ly@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Message-Id: <201012152303.11129.yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>

Arnaud, All,

On Wednesday 15 December 2010 06:32:46 Arnaud Lacombe wrote:
> On Tue, Dec 14, 2010 at 6:34 PM, Yann E. MORIN
> <yann.morin.1998@anciens.enib.fr> wrote:
> > But now, if the multi-included file has a choice in it, as in [2], then
> > mconf whines again
> >  common.in:9:warning: choice value used outside its choice group
> >  common.in:13:warning: choice value used outside its choice group
[--SNIP--]
> Looking at the conditional and the commit log which introduced the
> behavior should have given you the answer. You need to assign each 
> choice group the same name. The warning will go away and both will
> display correctly.

Yet, the commit log is not expressively stating what it is doing.
git blame gives changeset 5a1aa8a1 for the incriminated code, for
which the log is:

    kconfig: add named choice group

    As choice dependency are now fully checked, it's quite easy to add support
    for named choices. This lifts the restriction that a choice value can only
    appear once, although it still has to be within the same group,
    but multiple choices can be joined by giving them a name.
    While at it I cleaned up a little the choice type logic to simplify it a
    bit.

To me, this is a bit obscur. How do we 'name' a choice? OK, let's look at what
the diff changes:
 - Ah, it adds a 'word_opt' to 'choice' in the yacc stuff.
 - 'word_opt' is either empty, or a T_WORD.
 - T_WORD... I've already seen this somewhere. Maybe in the 'config' keyword?
 - Yes: config_entry_start: T_CONFIG T_WORD T_EOL
 - OK, so what happens if I change my 'choice' to 'choice FOO'?
 - Yes, it works! :-)

Thank you for pointing this feature! (And for having me digg my yacc fuu
back to semingly functional!)

> This is not documented.

Is that a plea for a patch? Hop, on the TODO list! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
