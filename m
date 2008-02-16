Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtpq1.groni1.gr.home.nl ([213.51.130.200]:33495 "EHLO
	smtpq1.groni1.gr.home.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753556AbYBPDvT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 15 Feb 2008 22:51:19 -0500
Message-ID: <47B65E35.8020905@keyaccess.nl>
Date: Sat, 16 Feb 2008 04:53:25 +0100
From: Rene Herman <rene.herman@keyaccess.nl>
MIME-Version: 1.0
Subject: Re: 2.6.25-rc2 vdso_install breaks user "make install"
References: <47B6592A.6030200@keyaccess.nl> <20080216034211.8DD03270193@magilla.localdomain>
In-Reply-To: <20080216034211.8DD03270193@magilla.localdomain>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roland McGrath <roland@redhat.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org

On 16-02-08 04:42, Roland McGrath wrote:

> Perhaps it makes more sense to have vdso_install be a dependency of 
> modules_install rather than install, since they both put things in
> /lib/modules.

Would work for me -- modules_install ofcourse runs as root.

> The installed vdso images are potentially useful for a kernel when you 
> aren't bothering to build or install any modules, but those images are
> only ever useful for sophisticated debugging uses anyway.
> 
> Sam, any thoughts?  (See arch/x86/Makefile and arch/powerpc/Makefile.)

Or maybe update the installkernel "protocol" to add these in?

> The only kind of install runs I actually care about are for packaging 
> system builds.  There the packaged build does 'make vdso_install' 
> explicitly anyway (at least Fedora rpms' .spec does).  So if the
> consensus is just to drop the dependency on vdso_install completely, I
> don't object.

Did that for now...

Rene.
