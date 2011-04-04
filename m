Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lennier.cc.vt.edu ([198.82.162.213]:53843 "EHLO
	lennier.cc.vt.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754269Ab1DDPW0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Apr 2011 11:22:26 -0400
Subject: Re: [PATCH 2/2] kbuild: move KALLSYMS_EXTRA_PASS from Kconfig to Makefile
In-Reply-To: Your message of "Mon, 04 Apr 2011 15:47:10 +0300."
             <1301921230.2760.79.camel@localhost>
From: Valdis.Kletnieks@vt.edu
References: <1301913651-9055-1-git-send-email-dedekind1@gmail.com> <1301913651-9055-2-git-send-email-dedekind1@gmail.com> <131611.1301921158@localhost>
            <1301921230.2760.79.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1301930536_4775P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Mon, 04 Apr 2011 11:22:16 -0400
Message-ID: <7621.1301930536@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: dedekind1@gmail.com
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Paulo Marques <pmarques@grupopie.com>

--==_Exmh_1301930536_4775P
Content-Type: text/plain; charset=us-ascii

On Mon, 04 Apr 2011 15:47:10 +0300, Artem Bityutskiy said:
> On Mon, 2011-04-04 at 08:45 -0400, Valdis.Kletnieks@vt.edu wrote:
> > On Mon, 04 Apr 2011 13:40:51 +0300, Artem Bityutskiy said:
> >
> > > 3. By default KALLSYMS_EXTRA_PASS is disabled and if kallsyms has issues,
> > >    "make" should print a warning and suggest using KALLSYMS_EXTRA_PASS
> >
> > If the Makefile has enough information to print the warning, why can't it go
> > ahead and do the extra pass itself instead of issuing the warning?
> >
> > (I'm obviously missing something here, as I'm foolishly posting to lkml before
> > caffeine ;)
>
> Good question, I thought to force people to send a bugreport.

When was the last time we actually saw such a bug report?  I'm suspecting that
all the affected people just set the variable and get on with their lives.  So
we should either just make it automatic if that's what people are going to do,
or we rip the entire "EXTRA_PASS' stuff out forcibly and *make* people fix the
actual underlying issue that causes the extra pass to be needed...


--==_Exmh_1301930536_4775P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFNmeIocC3lWbTT17ARAkgTAJ0YiS3ZiCts0kqYp6kAoWCT0RIF6QCg4031
KwR0Myh8oFn3GCoCNoQ7rRE=
=s7aU
-----END PGP SIGNATURE-----

--==_Exmh_1301930536_4775P--

