Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46443 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751483AbaG3Vtr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Jul 2014 17:49:47 -0400
Message-ID: <53D96879.4050300@suse.cz>
Date: Wed, 30 Jul 2014 23:49:45 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] kbuild: Support split debug info v4
References: <1406746219-15427-1-git-send-email-andi@firstfloor.org>
In-Reply-To: <1406746219-15427-1-git-send-email-andi@firstfloor.org>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Dirk Gouders <dirk@gouders.net>, Sam Ravnborg <sam@ravnborg.org>

Dne 30.7.2014 20:50, Andi Kleen napsal(a):
> From: Andi Kleen <ak@linux.intel.com>
> 
> This is an alternative approach to lower the overhead of debug info
> (as we discussed a few days ago)
> 
> gcc 4.7+ and newer binutils have a new "split debug info" debug info
> model where the debug info is only written once into central ".dwo" files.
> 
> This avoids having to copy it around multiple times, from the object
> files to the final executable. It lowers the disk space
> requirements. In addition it defaults to compressed debug data.
> 
> More details here: http://gcc.gnu.org/wiki/DebugFission
> 
> This patch adds a new option to enable it. It has to be an option,
> because it'll undoubtedly break everyone's debuginfo packaging scheme.
> gdb/objdump/etc. all still work, if you have new enough versions.
> 
> I don't see big compile wins (maybe a second or two faster or so), but the
> object dirs with debuginfo get significantly smaller. My standard kernel
> config (slightly bigger than defconfig) shrinks from 2.9G disk space
> to 1.1G objdir (with non reduced debuginfo). I presume if you are IO limited
> the compile time difference will be larger.
> 
> Only problem I've seen so far is that it doesn't play well with older
> versions of ccache (apparently fixed, see
> https://bugzilla.samba.org/show_bug.cgi?id=10005)
> 
> v2: various fixes from Dirk Gouders. Improve commit message slightly.
> v3: Fix clean rules and improve Kconfig slightly
> v4: Fix merge error in last version (Sam Ravnborg)
>     Clarify description that it mainly helps disk size.
> Cc: Dirk Gouders <dirk@gouders.net>
> Cc: mmarek@suse.cz
> Signed-off-by: Andi Kleen <ak@linux.intel.com>

I applied both patches to kbuild.git#kbuild.

Michal

