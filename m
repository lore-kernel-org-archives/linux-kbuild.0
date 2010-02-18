Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55956 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754761Ab0BRJyi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Feb 2010 04:54:38 -0500
Message-ID: <4B7D0E5C.1070708@suse.cz>
Date: Thu, 18 Feb 2010 10:54:36 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: makefiles: obj vs. objtree
References: <4B7CA583.5020002@xenotime.net>
In-Reply-To: <4B7CA583.5020002@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

On 18.2.2010 03:27, Randy Dunlap wrote:
> Can someone clarify the difference(s) in these variables, please?
> 
> Documentation/kbuild.txt says about objtree:
> 
> $(objtree) is the directory where output files are saved.
> The output directory is often set using "O=..." on the commandline.
> 
> 
> Documentation/makefiles.txt says about obj:
> 
>     $(obj)
> 	$(obj) is a relative path which points to the directory
> 	where the target is saved. Always use $(obj) when
> 	referring to generated files.
> 
> 
> These appear to be the same to me, but let me be more specific:

$(objtree) is the toplevel build directory (as the doc says the
directory you specify with O=).
$(obj) is the directory below $(objtree) where the targets of the
current Makefile are saved:

$ make O=/build/dir
$(objtree) == /build/dir
$(obj) == /build/dir/fs in fs/Makefile


> In some cases (or places), Documentation/DocBook/Makefile uses
> $(obj) and other cases/places, it uses $(objtree).
> Does it have these correct, or should some of them be fixed?

$(objtree)/Documentation/DocBook could be written as $(obj) in
Documentation/DocBook/Makefile.

hth,
Michal
