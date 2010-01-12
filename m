Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lennier.cc.vt.edu ([198.82.162.213]:38604 "EHLO
	lennier.cc.vt.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751578Ab0ALRTA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 Jan 2010 12:19:00 -0500
Subject: Re: [RFC PATCH 2/4] x86: use dmi check to treat disabled cpus as hotplug cpus.
In-Reply-To: Your message of "Tue, 12 Jan 2010 08:26:22 PST."
             <alpine.LFD.2.00.1001120823120.17145@localhost.localdomain>
From: Valdis.Kletnieks@vt.edu
References: <1263264483-3959-1-git-send-email-yinghai@kernel.org> <1263264483-3959-4-git-send-email-yinghai@kernel.org> <alpine.LFD.2.00.1001111906300.17145@localhost.localdomain> <6686.1263312874@localhost>
            <alpine.LFD.2.00.1001120823120.17145@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1263316641_4706P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Tue, 12 Jan 2010 12:17:21 -0500
Message-ID: <23825.1263316641@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org
Cc: Yinghai Lu <yinghai@kernel.org>, Suresh Siddha <suresh.b.siddha@intel.com>, "ananth@in.ibm.com" <ananth@in.ibm.com>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

--==_Exmh_1263316641_4706P
Content-Type: text/plain; charset=us-ascii

On Tue, 12 Jan 2010 08:26:22 PST, Linus Torvalds said:
> 
> 
> On Tue, 12 Jan 2010, Valdis.Kletnieks@vt.edu wrote:
> > 
> > OK, I'll bite - how do you build an X86-64 kernel that doesn't have
> > CONFIG_HOTPLUG_CPU selected?  Try as I might, even if I have PM_SLEEP=n,
> > PM_SLEEP_SMP insists on being set, and then selecting HOTPLUG_SMP.
> 
> If that is true, then there is some bug in the kconfig parser. 
> PM_SLEEP_SMP depends on PM_SLEEP, so with PM_SLEEP=n it should never be 
> set.

So now I go back and check, and it *was* possible to get a PM_SLEEP_SMP=n.
Apparently in my previous attempts, I tried turning stuff off and PM_SLEEP_SMP
stayed on just like this time as long as I was puttering around in menuconfig.
But turning it off, *exiting menuconfig*, and then re-starting menuconfig made
it work.  Weird.  It seems like if something does a 'select' on something
that isn't a visible symbol, and the symbol gets toggled, the selects
aren't redriven - and since it's not a visible symbol, you can't toggle it
yourself. But saving and restarting menuconfig forces a refresh and things
start acting right. Adding Roman and the kbuild list to the cc:

And turning off PM_SLEEP and HOTPLUG_CPU ended up saving a chunk of memory:

Before:
% size vmlinux
   text    data     bss     dec     hex filename
8964445 1377200 6094320 16435965         facafd vmlinux

After:
% size vmlinux
   text    data     bss     dec     hex filename
8889523 1378768 6089648 16357939         f99a33 vmlinux


--==_Exmh_1263316641_4706P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFLTK6hcC3lWbTT17ARAoRvAJ0TW6Evs7m772oGTjSLAVp9mO6GRgCgi8wI
3xMwgbNim8z1Z6H/4xNeGaM=
=v/5Z
-----END PGP SIGNATURE-----

--==_Exmh_1263316641_4706P--

