Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:38553 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751538AbZLVXuS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Dec 2009 18:50:18 -0500
Date: Tue, 22 Dec 2009 15:49:35 -0800
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Bugme-new] [Bug 14848] New: Kernel fails to boot if compressed
 with bzip2 or lzma
Message-Id: <20091222154935.5da4be37.akpm@linux-foundation.org>
In-Reply-To: <bug-14848-10286@http.bugzilla.kernel.org/>
References: <bug-14848-10286@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sd@sedf.de
Cc: bugzilla-daemon@bugzilla.kernel.org, bugme-daemon@bugzilla.kernel.org, linux-kbuild@vger.kernel.org


(switched to email.  Please respond via emailed reply-to-all, not via the
bugzilla web interface).

On Sun, 20 Dec 2009 01:46:05 GMT
bugzilla-daemon@bugzilla.kernel.org wrote:

> http://bugzilla.kernel.org/show_bug.cgi?id=14848
> 
>            Summary: Kernel fails to boot if compressed with bzip2 or lzma
>            Product: Other
>            Version: 2.5
>     Kernel Version: 2.6.33-rc1
>           Platform: All
>         OS/Version: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: Other
>         AssignedTo: other_other@kernel-bugs.osdl.org
>         ReportedBy: sd@sedf.de
>         Regression: Yes
> 
> 
> The kernel fails to boot if compressed with bzip2 or lzma, gzip works.
> 
> Commit 4a2ff67c88211026afcbdbc190c13f705dae1b59 does:
> 
> 
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -208,7 +208,7 @@ cmd_gzip = (cat $(filter-out FORCE,$^) | gzip -f -9 > $@)
> || \
> 
>  # Bzip2 and LZMA do not include size in file... so we have to fake that;
>  # append the size as a 32-bit littleendian number as gzip does.
> -size_append = /bin/echo -ne $(shell                                    \
> +size_append = printf $(shell                                           \
>  dec_size=0;                                                            \
>  for F in $1; do                                                               
> \
>         fsize=$$(stat -c "%s" $$F);                                     \
> 
> 
> This is wrong, because it calls the shell's builtin printf (instead
> /usr/bin/printf) which does not support the necessary arguments.
> 
> At my machine (debian) "/bin/echo -ne" works.
> 

Please send a tested, signed-off patch as per
Documentation/SubmittingPatches, thanks.

