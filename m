Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out.selfhost.de ([82.98.82.95]:45541 "EHLO outgoing.selfhost.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752404Ab2EZWDV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 May 2012 18:03:21 -0400
Message-ID: <4FC15323.1070206@afaics.de>
Date: Sun, 27 May 2012 00:03:15 +0200
From: Harald Dunkel <harri@afaics.de>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts/package/builddeb: include generated header files
References: <4FC0F29C.9050508@afaics.de> <20120526210005.GB32523@sepie.suse.cz>
In-Reply-To: <20120526210005.GB32523@sepie.suse.cz>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/26/12 23:00, Michal Marek wrote:
> On Sat, May 26, 2012 at 05:11:24PM +0200, Harald Dunkel wrote:
>> Below is a patch.
:
> 
> Thanks. There was already a patch fixing this by someone else: http://www.spinics.net/lists/linux-kbuild/msg06313.html, so I applied that one.
> 

Thats fine with me. Peter's patch looks almost the same.

> 
> You make easier for the receiving party if you send patches using git send-email. And lkml should be always CCed in addition to the maintainer and/or subsystem mailing list. Otherwise, the patch itself was OK.
> 

I tried to follow the doc on kernelnewbies, but I haven't seen
the git command line. It would help very much if you could send
me a pointer to some more up-to-date information, if you have
it at hand.


Many thanx anyway

Harri
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk/BUyMACgkQUTlbRTxpHjfLYACgkG1JzxpdO8rxRI46Di2f69Gi
9+IAn0CqrwzqG/koBRtGiIpQCTZellAY
=ieYU
-----END PGP SIGNATURE-----
