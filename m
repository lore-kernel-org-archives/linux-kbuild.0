Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0064.hostedemail.com ([216.40.44.64]:50816 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751652Ab3IRFrf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Sep 2013 01:47:35 -0400
Received: from smtprelay.hostedemail.com (ff-bigip1 [10.5.19.254])
	by smtpgrave06.hostedemail.com (Postfix) with ESMTP id E4DDD172479
	for <linux-kbuild@vger.kernel.org>; Wed, 18 Sep 2013 05:37:33 +0000 (UTC)
Message-ID: <1379482610.1787.7.camel@joe-AO722>
Subject: Re: [PATCH 5/5] lib: Add error string support to printks
From: Joe Perches <joe@perches.com>
Date: Tue, 17 Sep 2013 22:36:50 -0700
In-Reply-To: <1379459317-13046-6-git-send-email-daniel.santos@pobox.com>
References: <1379459317-13046-1-git-send-email-daniel.santos@pobox.com>
	 <1379459317-13046-6-git-send-email-daniel.santos@pobox.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Santos <daniel.santos@pobox.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, David Howells <dhowells@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Kerrisk <mtk.manpages@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, George Spelvin <linux@horizon.com>

On Tue, 2013-09-17 at 18:08 -0500, danielfsantos@att.net wrote:
> This adds an extension for the integral format specifier suffix of 'e',
> so that the format %[duxXo]e will result in printing an number (as
> before) in addition to a name and descrption for an error code, if such
> support is enabled and a name and descrption is found.
> 
> My initial thought was to use the glibc extension of '%m', but this
> format specifier uses the value of libc's errno and adding a value
> breaks gcc's printf parsing.  I'm not convinced that the 'e' extension
> is optimal, although there are only four instances of this pattern in
> the kernel that would need to be changed.
> 
>     git grep -E '".*%[#0\ +\-]*[0-9]*[hljzt]*[idoxXu]e'
> 
> Alternatively, 'E' was another thought for a suffix as well.

I'd much rather see another %p extension used instead
of generating odd output given normal printf formats.

%pE might work


