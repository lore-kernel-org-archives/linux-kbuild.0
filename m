Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:39664 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1753340Ab0IJRKf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 10 Sep 2010 13:10:35 -0400
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Fri, 10 Sep 2010 10:10:33 -0700
Date: Fri, 10 Sep 2010 10:10:32 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] Fix QT4 moc, cflags libs detection on dual QT3/Qt4
 systems
Message-Id: <20100910101032.00333be4.rdunlap@xenotime.net>
In-Reply-To: <1284138074-7287-1-git-send-email-alexander.stein@informatik.tu-chemnitz.de>
References: <1284138074-7287-1-git-send-email-alexander.stein@informatik.tu-chemnitz.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Stein <alexander.stein@informatik.tu-chemnitz.de>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Fri, 10 Sep 2010 19:01:14 +0200 Alexander Stein wrote:

> On system with QT3 and QT4 qmake in PATH may be from QT3. So we use
> pkg-config for proper QT4 detection.
> By reqesting cflags and libs for either QtCore, QtGui and QtSupport include
> dirs and libs get listed several times, but so we won't mis anything
> 
> CC: Michal Marek <mmarek@suse.cz>
> Signed-off-by: Alexander Stein <alexander.stein@informatik.tu-chemnitz.de>

That works.  Thanks.

Acked-by: Randy Dunlap <rdunlap@xenotime.net>


> ---
>  scripts/kconfig/Makefile |   10 ++++------
>  1 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index cef3f75..996059e 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -273,12 +273,10 @@ $(obj)/.tmp_qtcheck:
>  	      moc="/usr/bin/moc"; \
>  	    fi; \
>  	else \
> -	  headerpath="\$$(shell qmake -query QT_INSTALL_HEADERS)"; \
> -	  libpath="\$$(shell qmake -query QT_INSTALL_LIBS)"; \
> -	  binpath="\$$(shell qmake -query QT_INSTALL_BINS)"; \
> -	  cflags="-I$$headerpath -I$$headerpath/QtCore -I$$headerpath/QtGui -I$$headerpath/Qt3Support -DQT3_SUPPORT"; \
> -	  libs="-L$$libpath -Wl,-rpath,$$libpath -lQtCore -lQtGui -lQt3Support"; \
> -	  moc="$$binpath/moc"; \
> +	  cflags="\$$(shell pkg-config QtCore --cflags) \$$(shell pkg-config QtGui --cflags) \$$(shell pkg-config Qt3Support --cflags)"; \
> +	  libs="\$$(shell pkg-config QtCore --libs) \$$(shell pkg-config QtGui --libs) \$$(shell pkg-config Qt3Support --libs)"; \
> +	  binpath="\$$(shell pkg-config QtCore --variable=prefix)"; \
> +	  moc="$$binpath/bin/moc"; \
>  	fi; \
>  	echo "KC_QT_CFLAGS=$$cflags" > $@; \
>  	echo "KC_QT_LIBS=$$libs" >> $@; \
> -- 
> 1.7.2.2
> 


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
