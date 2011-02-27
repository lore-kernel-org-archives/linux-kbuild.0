Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:52520 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751367Ab1B0JDE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 27 Feb 2011 04:03:04 -0500
MIME-Version: 1.0
In-Reply-To: <20110226221838.GA24028@merkur.ravnborg.org>
References: <4D671556.80607@suse.com>
	<20110225060706.GA12723@merkur.ravnborg.org>
	<AANLkTimFd+KFKgiOF8iVoM8Pk77Zy+5CsFs5BCYqCw=L@mail.gmail.com>
	<20110226221838.GA24028@merkur.ravnborg.org>
Date: Sun, 27 Feb 2011 10:03:02 +0100
Message-ID: <AANLkTi=xoiCg9AQJDMjVC=pT-t0XKc+FQ9GZujD3pjHE@mail.gmail.com>
Subject: Re: [PATCH] Add ``cloneconfig'' target
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Arnaud Lacombe <lacombar@gmail.com>, Jeff Mahoney <jeffm@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org

On Sat, Feb 26, 2011 at 23:18, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Sat, Feb 26, 2011 at 02:47:01PM -0500, Arnaud Lacombe wrote:
>> On Fri, Feb 25, 2011 at 1:07 AM, Sam Ravnborg <sam@ravnborg.org> wrote:
>> > We already have something remotely similar in kconfig.
>> > We use the following list:
>> > config DEFCONFIG_LIST
>> >        string
>> >        depends on !UML
>> >        option defconfig_list
>> >        default "/lib/modules/$UNAME_RELEASE/.config"
>> >        default "/etc/kernel-config"
>> >        default "/boot/config-$UNAME_RELEASE"
>> >        default "$ARCH_DEFCONFIG"
>> >        default "arch/$ARCH/defconfig"
>> >
>> I may argue that anything within the Linux tree which point
>> _by_default_ to something outside the tree itself is broken.
> The above allows the average user to just type "make menuconfig"
> and then the configuration of the current kernel is presented to
> the user. This is convinient in many cases.
> We know the /proc/config.gz is an incresingly popular way to gain
> access to the configuration of the running kernel. So extending
> the already know and working way to obtaing the configuration
> of the running kernel to suppport /proc/config.gz is logical.

Does this detect cross-compiling? The 'depends on !UML' triggered me...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
