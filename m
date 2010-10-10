Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:43118 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751716Ab0JJRTI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 10 Oct 2010 13:19:08 -0400
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Sun, 10 Oct 2010 10:19:04 -0700
Date: Sun, 10 Oct 2010 10:19:04 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [Bugme-new] [Bug 19852] New: extract-ikconfig only works with
 gzip'ed kernel images
Message-Id: <20101010101904.b20bf9c8.rdunlap@xenotime.net>
In-Reply-To: <bug-19852-10286@https.bugzilla.kernel.org/>
References: <bug-19852-10286@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dick Streefland <dick@streefland.net>
Cc: linux-kbuild@vger.kernel.org

On Thu, 7 Oct 2010 17:06:32 GMT bugzilla-daemon@bugzilla.kernel.org wrote:

Hi Dick,

Please look at this kernel bugzilla entry.
Thanks.

> https://bugzilla.kernel.org/show_bug.cgi?id=19852
> 
>                URL: https://bugs.gentoo.org/show_bug.cgi?id=340021
>            Summary: extract-ikconfig only works with gzip'ed kernel images
>            Product: Other
>            Version: 2.5
>           Platform: All
>         OS/Version: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: Other
>         AssignedTo: other_other@kernel-bugs.osdl.org
>         ReportedBy: jlec@gentoo.org
>         Regression: No
> 
> 
> When anything else then CONFIG_KERNEL_GZIP is selected e.g.
> CONFIG_KERNEL_BZIP2, the script extract-ikconfig fails with "extract-ikconfig:
> Cannot find kernel config."
> This should be either checked in the script or support for pther compression
> methods may be nice.
> 
> -- 
> Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
> ------- You are receiving this mail because: -------
> You are on the CC list for the bug.


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
