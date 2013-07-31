Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f177.google.com ([74.125.82.177]:45855 "EHLO
	mail-we0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760162Ab3GaQxq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Jul 2013 12:53:46 -0400
Received: by mail-we0-f177.google.com with SMTP id m46so804500wev.8
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Jul 2013 09:53:45 -0700 (PDT)
Date: Wed, 31 Jul 2013 18:53:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: kconfig/menu.c: Fixup to "kconfig: fix undesirable side effect
 of adding "visible" menu attribute" ?
Message-ID: <20130731165340.GA3448@free.fr>
References: <CA+icZUVn+a=LSvO9JZXng1E0Ee+4ETk01PPCMRtfV9jqXRXAjw@mail.gmail.com>
 <gir4eeizm9.fsf@karga.hank.lab>
 <CA+icZUXL3trj_Zfisxek8dw4HtNbx2fNDq=Gwn5zKjbNh8GDMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+icZUXL3trj_Zfisxek8dw4HtNbx2fNDq=Gwn5zKjbNh8GDMg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Dirk Gouders <dirk@gouders.net>, Jan Beulich <JBeulich@novell.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Sedat, Dirk, All,

On 2013-07-31 16:22 +0200, Sedat Dilek spake thusly:
> On Wed, Jul 31, 2013 at 4:16 PM, Dirk Gouders <dirk@gouders.net> wrote:
> > Sedat Dilek <sedat.dilek@gmail.com> writes:
> >> The Freetz router project has 370 [1] as a revert-patch of [2] to its
> >> kconfig-v3.8.
> >>
> >> commit 7ad1227818f09242cfe9bf1845fd24211f5f99bd
> >> "kconfig: fix undesirable side effect of adding "visible" menu attribute"
> >>
> >> I am not a kconfig-expert, but [3] looks like a fixup/folowup to it.
> >>
> >> commit/?id=e983b7b17ad1a978e954e6aaa62cf12bfc747883
> >> "kconfig/menu.c: fix multiple references to expressions in menu_add_prop()"
> >>
> >> I contacted Yann in private, but I think this is worth to ask on the
> >> linux-kbuild ML.

Yes, there was no reason to write such a question in private.

> > you are right, [3] fixes a problem that was introduced by [2].
> > (I should have noted that in the commit message -- I'm not sure if we
> > can fix that afterwards.)

No, it's been pushed to a public tree, it's too late.
It's even in Linus' tree, so it is really too late!

> thanks for the clarification and fixing this up.
> I told Yann in my private email to always add a reference to the
> "culprit" commit (root-cause).

Since I was not the author of that patch, I have no way to know if it is
"a fix for a previous commit", or "just a fix", if the original author
does not provide this information.

Except for the patches I write, I "just" collect (and test/review) the
patches to kconfig in my tree, to make it a bit easier for Michal. I
just pass the patches' commit logs as-is (or do trivial edits if
needed), so what gets in the tree is the responsibility of the author.
Hey, Dirk! ;-)

But on the principle, I do agree: if the patch fixes a regression
introduced by a previous changeset, it should be referenced in the
commit log of that new patch, indeed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
