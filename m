Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ns2.gothnet.se ([82.193.160.251]:14513 "EHLO
	GOTHNET-SMTP2.gothnet.se" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753363AbYLNQOS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 14 Dec 2008 11:14:18 -0500
Message-ID: <49452CEE.1090909@shipmail.org>
Date: Sun, 14 Dec 2008 16:57:34 +0100
From: =?ISO-8859-1?Q?Thomas_Hellstr=F6m?= <thomas@shipmail.org>
MIME-Version: 1.0
Subject: Re: BUG: via_drmclient.h is referenced but does not exist
References: <20081213193506.GA22969@uranus.ravnborg.org>
In-Reply-To: <20081213193506.GA22969@uranus.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.sourceforge.net>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi!

The intention is for via_drm.h to be self-containing when included both 
for a kernel build and for a user-space build. In this particular case, 
via_drmclient.h lives in the user-space clients and includes stdint.h to 
get access to uint32_t and friends.

Of course, the user-space clients could
#include "uint32.h"
#include "via_drm.h"

but shouldn't really the tools be mimicing what the compiler does in 
this case?

/Thomas


Sam Ravnborg wrote:
> Hi David et al.
>
> After improving the headers_check.pl script to do a
> check for files included with:
>
> 	#include "foo.h"
>
> it reported the following error:
>
> /home/sam/kernel/knext.git/usr/include/drm/via_drm.h:34: included file '/home/sam/kernel/knext.git/usr/include/drm/via_drmclient.h' is not exported
>
> And indeed the file via_drmclient.h does not exist in the kernel source.
> We do not see any issue in the kernel as the include is guarded by:
>
> #ifndef __KERNEL__
> #include "via_drmclient.h"
> #endif
>
> But referring to a non-existing file is not the right thing to to.
>
> We need this check as we have several places where we do:
>
> 	#include "foo.h"
>
> in our exported headers.
>
> So we need to fix drm somehow.
>
> The headers_check.pl patch is included for reference.
>
>   



