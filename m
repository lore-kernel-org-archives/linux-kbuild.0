Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp4.pp.htv.fi ([213.243.153.38]:42023 "EHLO smtp4.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751647AbYEXVFf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 24 May 2008 17:05:35 -0400
Date: Sun, 25 May 2008 00:03:04 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [RFC PATCH] kconfig: introduce KCONFIG_* symbols for .c files
Message-ID: <20080524210304.GD2308@cs181133002.pp.htv.fi>
References: <20080524192540.GA28067@uranus.ravnborg.org> <48387F0B.3020506@goop.org> <48388187.2070503@goop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48388187.2070503@goop.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Roman Zippel <zippel@linux-m68k.org>, Tom Spink <tspink@gmail.com>

On Sat, May 24, 2008 at 09:58:47PM +0100, Jeremy Fitzhardinge wrote:
> 
> Would
>
>    #define KCONFIG(x)   (CONFIG_##x - 0)
>
>    if (KCONFIG(PREEMPT)) {
>        ...
>    }
>
> work?

$ cat test.c
#define KCONFIG(x)   (CONFIG_##x - 0)

int main()
{
  if (KCONFIG(PREEMPT))
    ;

  return 0;
}
$ gcc -O2 -Wall test.c
test.c: In function ‘main’:
test.c:5: error: ‘CONFIG_PREEMPT’ undeclared (first use in this function)
test.c:5: error: (Each undeclared identifier is reported only once
test.c:5: error: for each function it appears in.)
$ gcc --version
gcc (Debian 4.3.0-5) 4.3.1 20080523 (prerelease)

>    J

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

