Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.HRZ.Uni-Dortmund.DE ([129.217.128.51]:33675 "EHLO
	unimail.uni-dortmund.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751670Ab3GFAoN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Jul 2013 20:44:13 -0400
Message-ID: <51D76127.9060209@tu-dortmund.de>
Date: Sat, 06 Jul 2013 02:13:27 +0200
From: =?UTF-8?B?RGF2aWQgR3LDpGZm?= <david.graeff@tu-dortmund.de>
MIME-Version: 1.0
Subject: Re: Kconfig Gtk/Qt interface flavours ported to newest toolkit versions
References: <kconfig-port-gtk-qt> <1372778550-22110-1-git-send-email-david.graeff@web.de> <20130703163038.GA3268@free.fr>
In-Reply-To: <20130703163038.GA3268@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

Yem, All,

Am 03.07.2013 18:30, schrieb Yann E. MORIN:
> However, since you asked: your patches are numberedd 2 to 9. It seems
> you considered the intro mail (the one I'm replying to here) as the
> number one. Is that right, or is patch #1 missing?
>
> [...]
>
> You can achieve this using 'git send-email'. See:
>      git help send-email
I'm sorry for the missing first patch, actually I used git send-email, but
had initial problems with perl and its smtp module. I guess perl ate
this missing first patch mail, I'm not sure.
> Nit-picking: please keep your mails and commit messages below 80-chars
> per line, it's easier to read. Thanks! :-)
I will do my best :) One of my intentions to use git send-email was
because I thought it would automatically format patches in a way
that reviewing them would be easier. Likely I'm too much used, should I
say 'spoiled', by the github or gerrit review UI :)
I will change my proposed code accordingly.
> I did not do any review of the patches, since I have a concern about the
> series. It happens very often that, in enterprise ecosystems, the host
> build machines are running rather aging distro, such as RHEL 5 (or even
> RHEL 4 in some cases), so I think we still want the new kernels to be
> buildable (and thus configurable) on such machines (eg. for
> cross-compilation).
A serious concern, you're absolutly right. Let me tell you some
background information and my concerns regarding the current
code.
Although the Gtk2->3 port was less effort than the Qt-flavour port,
it is the more important one in my opinion. The current code definitly
does not compile with gtk3 and some used libraries (e.g. libglade)
are depreated for a while now.
Of just a cosmetic nature: In my experience, on newer systems
gtk2 applications additionally look somewhat outdated.

Maybe it is a good idea, to have the current gtk implementation
and the ported one side-by-side. What do you think?

Regarding the Qt-flavour port, I would classify it as an almost
complete rewrite. I'm more into C++/Qt and personally I always
used xconfig for kconf. The current implementation is more a Qt3
application that still compiles with Qt4 due of heavy usage of
the deprecated Qt3support layer. For the new implementation,
I adopted Qt4 techniques like the Qt MVC pattern
and the Qt interface designer (similar to the kconf-Gtk solution),
while paying attention to a Qt5 compatibilty.
It's more likely that I introducted bugs in this kconf flavour port,
of course. But I'd assume it's a good starting point for a discussion
of a more future-proof and probably more easy to maintain implementation.

Your concern about those aging distros certainly applies to this ported 
kconf
flavour, too. So I'm not sure how to proceed. Options, I can thing of
are:

* Remove the Qt3/4-flavour and use the new Qt4/5 one, keep the Gtk2-flavour
for aging distros.
* Keep both Qt-flavour implementations (maybe with make targets like
xconfig and qconfig).
* Don't change the Qt3/4-flavour and do not introduce this proposed 
Qt-flavour.

I would prepare a v2 patch series consisting of three patches only:
1) Directory structure. For each kconf ui flavour a separate one.
2) gtk3-flavour as side-by-side solution to the existing gtk2 one.
3) Qt4/5-flavour as side-by-side solution to the existing Qt3/4 one.
Far less intrusive :)
>> Those newer graphical kconfig flavours will be used by a project I'm involved in so
>> I will maintain it for the next couple of months.
> Could you please explain what this project of yours is about?
* A configurable firmware for atmega processors (we are using the menuconfig
kconf interface only) [github: ethersex].
* CiAO: Highly configurable aspect oriented research operating-system. 
Configuration
is realised by kconf. We are using the Qt interface mainly.
* And two other configurable operating systems, that are used for teaching.

I guess there are way more projects using the famous kconf and users who 
like to use
the graphical interface flavours :)
> PS. Sorry for not answering earlier, I had connection issues yesterday,
>      during all the evening & night. :-(
> YEM.
So now it's my time to say sorry, took a few days to respond.

David.
