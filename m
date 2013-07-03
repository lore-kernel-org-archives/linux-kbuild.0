Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:58771 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752578Ab3GCQan (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Jul 2013 12:30:43 -0400
Received: by mail-we0-f181.google.com with SMTP id p58so310785wes.12
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Jul 2013 09:30:42 -0700 (PDT)
Date: Wed, 3 Jul 2013 18:30:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: Kconfig Gtk/Qt interface flavours ported to newest toolkit
 versions
Message-ID: <20130703163038.GA3268@free.fr>
References: <kconfig-port-gtk-qt>
 <1372778550-22110-1-git-send-email-david.graeff@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1372778550-22110-1-git-send-email-david.graeff@web.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: davidgraeff <david.graeff@web.de>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

David, All,

On 2013-07-02 17:22 +0200, davidgraeff spake thusly:
> I've no idea if this is the right way to send patches. I'm kind of new to this.

It seems you're doing mostly fine! :-)

However, since you asked: your patches are numberedd 2 to 9. It seems
you considered the intro mail (the one I'm replying to here) as the
number one. Is that right, or is patch #1 missing?

Usually, patch series are sent as thus:
    [PATCH 0/N] Subject for intro mail, aka "cover letter"
    [PATCH 1/N] Subject for first actual patch
    [PATCH 2/N] Subject for second actual patch
    [...]
    [PATCH N-1/N] Subject for penultimate actual patch
    [PATCH N/N] Subject for last actual patch

You can achieve this using 'git send-email'. See:
    git help send-email

Also, see (albeit not totaly up-to-date):
    Documentation/SubmittingPatches

Nit-picking: please keep your mails and commit messages below 80-chars
per line, it's easier to read. Thanks! :-)

> Attached is a patchset basically for porting the graphical Gtk and Qt flavours
> to their latest toolkit versions (Gtk3 and Qt4 with compatibility to Qt5 respectively).

I did not do any review of the patches, since I have a concern about the
series. It happens very often that, in enterprise ecosystems, the host
build machines are running rather aging distro, such as RHEL 5 (or even
RHEL 4 in some cases), so I think we still want the new kernels to be
buildable (and thus configurable) on such machines (eg. for
cross-compilation).

I have no idea when such enterprise distros have started bundling GTK3
or Qt4/5, but given RHEL-4 (which is still use in some places) is 8
years old, I doubt the new frontends would build on those distros.

> I do not know if it was on purpose to keep all flavours except lxdialog in one single directory,

Historical artifact, I think... :-(

[--SNIP--]
> Those newer graphical kconfig flavours will be used by a project I'm involved in so
> I will maintain it for the next couple of months.

Could you please explain what this project of yours is about?

> If I did anything wrong, please instruct me or provide me a link please.

As I said above, mostly good. I've seen far worse submnissions, don't
worry! ;-)

Regards,
Yann E. MORIN.

PS. Sorry for not answering earlier, I had connection issues yesterday,
    during all the evening & night. :-(
YEM.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
