Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35959 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755182AbaCNREq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Mar 2014 13:04:46 -0400
Message-ID: <532336AB.4070509@suse.cz>
Date: Fri, 14 Mar 2014 18:04:43 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: docbook: use $(obj) and $(src) rather than specific
 path
References: <1390194659-15155-1-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1390194659-15155-1-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org

On 2014-01-20 06:10, Masahiro Yamada wrote:
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> ---
>  Documentation/DocBook/Makefile | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/DocBook/Makefile b/Documentation/DocBook/Makefile
> index bc3d9f8..6ea50a3 100644
> --- a/Documentation/DocBook/Makefile
> +++ b/Documentation/DocBook/Makefile
> @@ -16,7 +16,7 @@ DOCBOOKS := z8530book.xml device-drivers.xml \
>  	    alsa-driver-api.xml writing-an-alsa-driver.xml \
>  	    tracepoint.xml drm.xml media_api.xml
>  
> -include $(srctree)/Documentation/DocBook/media/Makefile
> +include $(srctree)/$(src)/media/Makefile

You can drop the $(srctree) here, make will find the file in the VPATH.

Michal

