Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:47073 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752804Ab0IMPkF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Sep 2010 11:40:05 -0400
Date: Mon, 13 Sep 2010 13:51:22 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] Fix QT4 moc, cflags libs detection on dual QT3/Qt4
 systems
Message-ID: <20100913115122.GA20546@sepie.suse.cz>
References: <1284138074-7287-1-git-send-email-alexander.stein@informatik.tu-chemnitz.de>
 <20100910101032.00333be4.rdunlap@xenotime.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100910101032.00333be4.rdunlap@xenotime.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Alexander Stein <alexander.stein@informatik.tu-chemnitz.de>, linux-kbuild@vger.kernel.org

On Fri, Sep 10, 2010 at 10:10:32AM -0700, Randy Dunlap wrote:
> On Fri, 10 Sep 2010 19:01:14 +0200 Alexander Stein wrote:
> 
> > On system with QT3 and QT4 qmake in PATH may be from QT3. So we use
> > pkg-config for proper QT4 detection.
> > By reqesting cflags and libs for either QtCore, QtGui and QtSupport include
> > dirs and libs get listed several times, but so we won't mis anything
> > 
> > CC: Michal Marek <mmarek@suse.cz>
> > Signed-off-by: Alexander Stein <alexander.stein@informatik.tu-chemnitz.de>
> 
> That works.  Thanks.
> 
> Acked-by: Randy Dunlap <rdunlap@xenotime.net>
> 
> 
> > ---
> >  scripts/kconfig/Makefile |   10 ++++------
> >  1 files changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> > index cef3f75..996059e 100644
> > --- a/scripts/kconfig/Makefile
> > +++ b/scripts/kconfig/Makefile
> > @@ -273,12 +273,10 @@ $(obj)/.tmp_qtcheck:
> >  	      moc="/usr/bin/moc"; \
> >  	    fi; \
> >  	else \
> > -	  headerpath="\$$(shell qmake -query QT_INSTALL_HEADERS)"; \
> > -	  libpath="\$$(shell qmake -query QT_INSTALL_LIBS)"; \
> > -	  binpath="\$$(shell qmake -query QT_INSTALL_BINS)"; \
> > -	  cflags="-I$$headerpath -I$$headerpath/QtCore -I$$headerpath/QtGui -I$$headerpath/Qt3Support -DQT3_SUPPORT"; \
> > -	  libs="-L$$libpath -Wl,-rpath,$$libpath -lQtCore -lQtGui -lQt3Support"; \
> > -	  moc="$$binpath/moc"; \
> > +	  cflags="\$$(shell pkg-config QtCore --cflags) \$$(shell pkg-config QtGui --cflags) \$$(shell pkg-config Qt3Support --cflags)"; \
> > +	  libs="\$$(shell pkg-config QtCore --libs) \$$(shell pkg-config QtGui --libs) \$$(shell pkg-config Qt3Support --libs)"; \
> > +	  binpath="\$$(shell pkg-config QtCore --variable=prefix)"; \
> > +	  moc="$$binpath/bin/moc"; \
> >  	fi; \
> >  	echo "KC_QT_CFLAGS=$$cflags" > $@; \
> >  	echo "KC_QT_LIBS=$$libs" >> $@; \

Thanks, I applied it with a small cleanup patch on top:

From: Michal Marek <mmarek@suse.cz>
Date: Mon, 13 Sep 2010 13:41:31 +0200
Subject: [PATCH] kconfig: Simplify Makefile for xconfig

Signed-off-by: Michal Marek <mmarek@suse.cz>

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 996059e..3fbfe98 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -273,8 +273,8 @@ $(obj)/.tmp_qtcheck:
 	      moc="/usr/bin/moc"; \
 	    fi; \
 	else \
-	  cflags="\$$(shell pkg-config QtCore --cflags) \$$(shell pkg-config QtGui --cflags) \$$(shell pkg-config Qt3Support --cflags)"; \
-	  libs="\$$(shell pkg-config QtCore --libs) \$$(shell pkg-config QtGui --libs) \$$(shell pkg-config Qt3Support --libs)"; \
+	  cflags="\$$(shell pkg-config QtCore QtGui Qt3Support --cflags)"; \
+	  libs="\$$(shell pkg-config QtCore QtGui Qt3Support --libs)"; \
 	  binpath="\$$(shell pkg-config QtCore --variable=prefix)"; \
 	  moc="$$binpath/bin/moc"; \
 	fi; \
