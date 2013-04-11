Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from p-mail1.rd.francetelecom.com ([195.101.245.15]:49424 "EHLO
	p-mail1.rd.francetelecom.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1760155Ab3DKKI1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Apr 2013 06:08:27 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] kconfig: do randomise choice entries in presence of KCONFIG_ALLCONFIG
Date: Thu, 11 Apr 2013 11:58:06 +0200
References: <20130227214102.6d63544d@skate> <1365628806-24304-1-git-send-email-yann.morin.1998@free.fr> <516685E0.2000809@suse.cz>
In-Reply-To: <516685E0.2000809@suse.cz>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Message-Id: <201304111158.06496.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Sam Ravnborg <sam@ravnborg.org>, Arnaud Lacombe <lacombar@gmail.com>

Hello Michal!

On Thursday 11 April 2013 11:44:00 Michal Marek wrote:
> On 10.4.2013 23:20, Yann E. MORIN wrote:
> > Currently, randconfig does randomise choice entries, unless KCONFIG_ALLCONFIG
> > is specified.
[--SNIP--]
> will you add this to your yem-kconfig-for-next branch, or should I apply
> it to kbuild.git#kconfig directly?

I'll eventually add this to my branch, but I'm not confident with the
change for now, and I'd like to wait for some more reviews by the people
more knowlegeable in Kconfig than I currently am.

That patch is all I could come with after much head-scratching, and I
would not be very surprised that someone comes with a better patch. Not
surprised at all, in fact.

In all cases, let's just post-pone this for post-3.9, and I'll respin it
for some time during the 3.10-rc phase. Well, unless powers-that-be deem
that patch worth being applied as-is! ;-)

Also, I have a few other Kconfig changes pending here that will have to
go in 3.10, so it's better to wait.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
