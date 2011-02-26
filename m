Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:56133 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751204Ab1BZX2n (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Feb 2011 18:28:43 -0500
MIME-Version: 1.0
In-Reply-To: <AANLkTi=+AU3gJJOov8R1fNcZVE7iNpbTLDuMB5PHUk8s@mail.gmail.com>
References: <4D671556.80607@suse.com>
	<20110225060706.GA12723@merkur.ravnborg.org>
	<AANLkTimFd+KFKgiOF8iVoM8Pk77Zy+5CsFs5BCYqCw=L@mail.gmail.com>
	<20110226221838.GA24028@merkur.ravnborg.org>
	<AANLkTi=+AU3gJJOov8R1fNcZVE7iNpbTLDuMB5PHUk8s@mail.gmail.com>
Date: Sat, 26 Feb 2011 18:28:43 -0500
Message-ID: <AANLkTikigj1rDHrUaySHAYrW=GPPezbmcaDfx78AqE1_@mail.gmail.com>
Subject: Re: [PATCH] Add ``cloneconfig'' target
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Jeff Mahoney <jeffm@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org

Hi,

On Sat, Feb 26, 2011 at 6:03 PM, Arnaud Lacombe <lacombar@gmail.com> wrote:
>> The fact that the configuration is gzipped does not warrant
>> a new option to deal with this that almost duplicate the
>> existing functionality.
>>
> agree.
>
Let me precise, as there may be confusion. I agree about the new
target issue, but definitively think this kconfig "option" (more a
hack, which required a special option within kconfig) should be
handled by Kbuild, not Kconfig, ie. I'd discard "option
defconfig_list". File decompression (and eventually which config to
pick) should be done prior to the invocation of Kconfig.

 - Arnaud
