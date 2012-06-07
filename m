Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out.selfhost.de ([82.98.82.95]:41884 "EHLO outgoing.selfhost.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750853Ab2FGEHf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jun 2012 00:07:35 -0400
Message-ID: <4FD02902.6040402@afaics.de>
Date: Thu, 07 Jun 2012 06:07:30 +0200
From: Harald Dunkel <harri@afaics.de>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts/package/builddeb: include generated header files
References: <4FC0F29C.9050508@afaics.de> <20120526210005.GB32523@sepie.suse.cz> <4FC15323.1070206@afaics.de>
In-Reply-To: <4FC15323.1070206@afaics.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/27/12 00:03, Harald Dunkel wrote:
> On 05/26/12 23:00, Michal Marek wrote:
>> On Sat, May 26, 2012 at 05:11:24PM +0200, Harald Dunkel wrote:
>>> Below is a patch.
> :
> 
>> Thanks. There was already a patch fixing this by someone else: http://www.spinics.net/lists/linux-kbuild/msg06313.html, so I applied that one.
> 
> 
> Thats fine with me. Peter's patch looks almost the same.
> 

Question:

Do we really have to include all the

	.syscalls_32.h.cmd
	.unistd_32.h.cmd
	.unistd_64.h.cmd

files in the linux-headers package? These files don't look like
C code.

If not, then I would still recommend my patch instead.


Regards

Harri
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk/QKPgACgkQUTlbRTxpHjci+gCfc3vQsfziOFZiDIj+1mgjGvEk
tXEAmwUWGfo2B2OO500gz+vzRUpEAzwe
=2s5i
-----END PGP SIGNATURE-----
