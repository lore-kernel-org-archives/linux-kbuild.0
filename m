Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:39716 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881Ab3EHPEw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 May 2013 11:04:52 -0400
Received: by mail-we0-f181.google.com with SMTP id q55so1857633wes.26
        for <linux-kbuild@vger.kernel.org>; Wed, 08 May 2013 08:04:51 -0700 (PDT)
Date: Wed, 8 May 2013 17:04:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: RFC: let lxdialog/util.c:print_autowrap() handle newline
 characters
Message-ID: <20130508150446.GE3413@free.fr>
References: <gisj1xn0un.fsf@karga.hank.lab>
 <giobclmyw3.fsf@karga.hank.lab>
 <20130508133522.GD3413@free.fr>
 <gifvxxmucf.fsf@karga.hank.lab>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <gifvxxmucf.fsf@karga.hank.lab>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Dirk, All,

On Wed, May 08, 2013 at 04:14:56PM +0200, Dirk Gouders wrote:
> "Yann E. MORIN" <yann.morin.1998@free.fr> writes:
> > On Wed, May 08, 2013 at 02:36:44PM +0200, Dirk Gouders wrote:
> >> > Attached is a first version of a patch.  There are other (indirect)
> >> > users of print_autowrap() but for now I just modified the text for the
> >> > exit dialog.
> >> 
> >> Sorry for the noise, but I noticed that my patch did not propperly
> >> handle cases with short first words of new sentences.  While at it I
> >> noticed that strpbrk() makes the code more readable.
> >
> > Next time you have to send a patch, could you please:
> >   - use 'git send-email': that will properly format the patch for
> >     sending via email, especially, it does not attach the patch, but
> >     in-lines it in the body of the mail, which makes it easier to review
> >   - when you send a second (or third...) version of a patch, append a 'v2'
> >     (or v3, and so on...) to the subject, like: [PATCH v2] Bla blabla...
> 
> Sorry for the inconveniences, I will do my best with the revised version
> of the patch.

No problem, I was just giving some hints! :-)

> >>         Do you wish to save your new configuration ? <ESC><ESC>
> >>         to continue.
> >
> > Did you try to replace all the spaces there with newlines, and see what
> > happens? Hint: it's ugly, but not because of the newlines: the window is
> > not resized accordingly to the new number of lines, so better fix that
> > before, too.
> 
> Yes, I noticed that when I put just two newlines into that text.  In general
> it happens for any text (also without newlines) that does not fit the
> window height.
> 
> I solved the problem by adjusting the third parameter in the call to
> dialog_yesno() and thought that that is the correct way to handle the
> window-height-problem if the text does not fit, because print_autowrap()
> currently does not care at all if the given text breaks the window.

You are right: it is a non-issue so far; all rendered text currently fit
in their respective windows. If those texts get updated, it will be the
responsibility to the author to adjust the windows height.

Note: the english texts do fit, but I did not check that all
translations do. But are there anyone really using the localised texts
at all?

I'll get your patch as-is in my tree. Depending on Michal, maybe we can
queue it in for 3.10. Not too sure, though: the merge window is on the
verge of closing, and I'd prefer changes linger for a while in Michal'
then next's trees before getting mainlined.

> But I agree, I would be nice if print_autowrap() could handle such cases
> and I will see if I find a way to do that.  I am unsure if that should
> go into one single patch/commit, though.

Not needed for now, but if you want to work on this, then please do one
patch for each semantically self-contained change. Adjusting the height
of the window is not tied to rendering the '\n'.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
