Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:59659 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759641Ab2DJXHF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Apr 2012 19:07:05 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] scripts/config: properly report and set string options
Date: Wed, 11 Apr 2012 01:07:01 +0200
References: <1333975750-12154-1-git-send-email-yann.morin.1998@free.fr> <201204091802.29839.yann.morin.1998@free.fr> <20120410135753.GB2444@burratino>
In-Reply-To: <20120410135753.GB2444@burratino>
MIME-Version: 1.0
Content-Type: Text/Plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Message-Id: <201204110107.01273.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Nieder <jrnieder@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, Michal Marek <mmarek@suse.cz>

Jonathan, All,

On Tuesday 10 April 2012 15:57:53 Jonathan Nieder wrote:
> Yann E. MORIN wrote:
> >   - it breaks the build for users that tweak the kernel configuration from
> >     an upper-layer (aka 'integrated') build-system, using this script which
> >     is bundled with the kernel in the first place.
> 
> The questions I have are, did using special characters like this work
> before or is support for values with quotes inside just a new feature?

2.6.29 (first that had this script) allows for escaped double-quotes.
The oldest I tested, 2.6.20, also allowed escaped double-quotes.

> Or is there some wrapper around the linux makefile that automatically
> uses values with quotes on them, making it effectively impossible for
> some class of people to run some versions of Linux?

The scenario involves an upper-layer build system that:
  - is responsible for settings the kernel options based on global
    configuration (eg. the same kernel build for different boards)
    and/or options set by users (eg. I want USB camera support)
  - uses scripts/config to set/unset options rather than implementing
    its own logic
  - in this case the version string can be set to include the user's
    name, which may contain double-quotes (eg. John "Ripper" Smith)

For projects that decided to go with a stable version as the development
base (and won't update for the foreseeable future), then this is a (minor)
inconvenience (although the fix is easily back-ported).

> I don't expect this patch to cause problems for people, but it is a
> good practice to explain what scenario justifies backporting a patch
> to the stable series, if only because it keeps the volume of patches
> to search through when there is a new bug down.

From what I understand from Greg's reply, this patch will be dropped from
stable (and I do understand his position and your concerns).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
