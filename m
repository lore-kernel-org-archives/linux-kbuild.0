Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:33373 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755059Ab3GJVcT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Jul 2013 17:32:19 -0400
Received: by mail-wi0-f178.google.com with SMTP id k10so6831067wiv.17
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jul 2013 14:32:17 -0700 (PDT)
Date: Wed, 10 Jul 2013 23:32:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: Kconfig Gtk/Qt interface flavours ported to newest toolkit
 versions
Message-ID: <20130710213213.GF3297@free.fr>
References: <kconfig-port-gtk-qt>
 <1372778550-22110-1-git-send-email-david.graeff@web.de>
 <20130703163038.GA3268@free.fr>
 <51D76127.9060209@tu-dortmund.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <51D76127.9060209@tu-dortmund.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David =?utf-8?B?R3LDpGZm?= <david.graeff@tu-dortmund.de>
Cc: linux-kbuild@vger.kernel.org

David, All,

On 2013-07-06 02:13 +0200, David Gräff spake thusly:
> Am 03.07.2013 18:30, schrieb Yann E. MORIN:
> >I did not do any review of the patches, since I have a concern about the
> >series. It happens very often that, in enterprise ecosystems, the host
> >build machines are running rather aging distro, such as RHEL 5 (or even
> >RHEL 4 in some cases), so I think we still want the new kernels to be
> >buildable (and thus configurable) on such machines (eg. for
> >cross-compilation).

> A serious concern, you're absolutly right. Let me tell you some
> background information and my concerns regarding the current
> code.
> Although the Gtk2->3 port was less effort than the Qt-flavour port,
> it is the more important one in my opinion. The current code definitly
> does not compile with gtk3 and some used libraries (e.g. libglade)
> are depreated for a while now.
> Of just a cosmetic nature: In my experience, on newer systems
> gtk2 applications additionally look somewhat outdated.
> 
> Maybe it is a good idea, to have the current gtk implementation
> and the ported one side-by-side. What do you think?
> 
> Regarding the Qt-flavour port, I would classify it as an almost
> complete rewrite. I'm more into C++/Qt and personally I always
> used xconfig for kconf. The current implementation is more a Qt3
> application that still compiles with Qt4 due of heavy usage of
> the deprecated Qt3support layer. For the new implementation,
> I adopted Qt4 techniques like the Qt MVC pattern
> and the Qt interface designer (similar to the kconf-Gtk solution),
> while paying attention to a Qt5 compatibilty.
> It's more likely that I introducted bugs in this kconf flavour port,
> of course. But I'd assume it's a good starting point for a discussion
> of a more future-proof and probably more easy to maintain implementation.
> 
> Your concern about those aging distros certainly applies to this ported
> kconf
> flavour, too. So I'm not sure how to proceed. Options, I can thing of
> are:
> 
> * Remove the Qt3/4-flavour and use the new Qt4/5 one, keep the Gtk2-flavour
> for aging distros.
> * Keep both Qt-flavour implementations (maybe with make targets like
> xconfig and qconfig).
> * Don't change the Qt3/4-flavour and do not introduce this proposed
> Qt-flavour.
> 
> I would prepare a v2 patch series consisting of three patches only:
> 1) Directory structure. For each kconf ui flavour a separate one.
> 2) gtk3-flavour as side-by-side solution to the existing gtk2 one.
> 3) Qt4/5-flavour as side-by-side solution to the existing Qt3/4 one.
> Far less intrusive :)

I personnally don't use any of the two GUIs, so I can't really tell what
their status is. However, there are users of these, so I think we do not
want to leave them out in the cold.

I really don't know what to do about this.

One idea would be to have two new goals: g3config and q5config, and kepp
the existing ones in place. I don't like it much, since the two old ones
will ultimately no longer work, so may dusrupt users' expectations, and
it's double maintenance on non-GUI related changes.

An alternate route would be to add the two new frontends, and keep
xconfig and gconfig as-is, but decide which to build depending on
availability of the libraries:
  - xconfig: if Qt5 is present, then build and run the new Qt5-based
    frontend, otherwise build the current Qt3/4 frontend
  - gconfig: ditto, but with Gtk3 vs. Gtk2.
This still means double maintenance, but means we can easily drop the
old frontends in the future when Gtk2 and Qt3/4 are virtually no longer
meaningful, since this does not break users' experience.

So as a summarry, here are the three options:
  - update existing frontends against their respective framework
  - add two new frontends, and two new goals to call them
  - add two new frontends, and decide whether to call them or the old ones

Really, I have no idea what is best.

[--SNIP--]
> I guess there are way more projects using the famous kconf and users who
> like to use the graphical interface flavours :)

Yes, countless other projects use that: busybox, uClibc, Buildroot,
crosstool-NG, OpenBricks, NuttX, openWRT... to name a few I know of.

BTW, you may be interested in:
    http://ymorin.is-a-geek.org/projects/kconfig-frontends

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
