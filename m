Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54745 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751402Ab1B0RyH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 27 Feb 2011 12:54:07 -0500
Message-ID: <4D6A8FB9.3080408@suse.com>
Date: Sun, 27 Feb 2011 12:54:01 -0500
From: Jeff Mahoney <jeffm@suse.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Add ``cloneconfig'' target
References: <4D671556.80607@suse.com>	<20110225060706.GA12723@merkur.ravnborg.org>	<AANLkTimFd+KFKgiOF8iVoM8Pk77Zy+5CsFs5BCYqCw=L@mail.gmail.com>	<20110226221838.GA24028@merkur.ravnborg.org> <AANLkTi=xoiCg9AQJDMjVC=pT-t0XKc+FQ9GZujD3pjHE@mail.gmail.com>
In-Reply-To: <AANLkTi=xoiCg9AQJDMjVC=pT-t0XKc+FQ9GZujD3pjHE@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Arnaud Lacombe <lacombar@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02/27/2011 04:03 AM, Geert Uytterhoeven wrote:
> On Sat, Feb 26, 2011 at 23:18, Sam Ravnborg <sam@ravnborg.org> wrote:
>> On Sat, Feb 26, 2011 at 02:47:01PM -0500, Arnaud Lacombe wrote:
>>> On Fri, Feb 25, 2011 at 1:07 AM, Sam Ravnborg <sam@ravnborg.org> wrote:
>>>> We already have something remotely similar in kconfig.
>>>> We use the following list:
>>>> config DEFCONFIG_LIST
>>>>        string
>>>>        depends on !UML
>>>>        option defconfig_list
>>>>        default "/lib/modules/$UNAME_RELEASE/.config"
>>>>        default "/etc/kernel-config"
>>>>        default "/boot/config-$UNAME_RELEASE"
>>>>        default "$ARCH_DEFCONFIG"
>>>>        default "arch/$ARCH/defconfig"
>>>>
>>> I may argue that anything within the Linux tree which point
>>> _by_default_ to something outside the tree itself is broken.
>> The above allows the average user to just type "make menuconfig"
>> and then the configuration of the current kernel is presented to
>> the user. This is convinient in many cases.
>> We know the /proc/config.gz is an incresingly popular way to gain
>> access to the configuration of the running kernel. So extending
>> the already know and working way to obtaing the configuration
>> of the running kernel to suppport /proc/config.gz is logical.
> 
> Does this detect cross-compiling? The 'depends on !UML' triggered me...

No, and it never has. The DEFCONFIG_LIST feature has been mostly
unaltered since it was added in Jun 2006. Prior to that it was hardcoded
into scripts/kconfig/confdata.c since before 2002.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAk1qj7kACgkQLPWxlyuTD7J/ZwCfQzFM6Qo+1Va5RTYKj4bXEydm
28EAoINVyrH+F4hYhCWSkXYCq3Y0euY/
=T1qc
-----END PGP SIGNATURE-----
