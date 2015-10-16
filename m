Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:58196 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932378AbbJPP2q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Oct 2015 11:28:46 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: Re: [PATCH 39/39] Update the buildsystem for KConfig finding Qt
Date: Fri, 16 Oct 2015 08:28:44 -0700
Message-ID: <4227965.esWC4RuHGt@tjmaciei-mobl4>
In-Reply-To: <20151016061241.45c51b63@mir>
References: <1442946999-37018-1-git-send-email-thiago.macieira@intel.com> <1442946999-37018-40-git-send-email-thiago.macieira@intel.com> <20151016061241.45c51b63@mir>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stefan Lippers-Hollmann <s.l-h@gmx.de>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>

On Friday 16 October 2015 06:12:41 Stefan Lippers-Hollmann wrote:
> > +     @set -e; $(kecho) "  CHECK   qt"; \
> > +     qtver=`qmake -query QT_VERSION` || { \
> > +         echo >&2 "*"; \
> > +         echo >&2 "* qmake failed."; \
> > +         echo >&2 "*"; \
> > +         exit 1; \
> > +     }; \
> 
> [...]
> 
> "qmake -query QT_VERSION" appears to be a little fragile on Debian 
> with both qt4-qmake and qt5-qmake installed, as it reports back 
> "4.8.7" by default. The actual qmake is hiding behind qtchooser
> (/usr/bin/qmake -> qtchooser) and will report different environments
> based on the chosen personality:

Since xconfig still builds with Qt 4, I didn't feel the need to force the 
choice for Qt 5. If your environment is qtchooser, then you can just set 
QT_SELECT=5 before running "make xconfig".

-- 
Thiago Macieira - thiago.macieira (AT) intel.com
  Software Architect - Intel Open Source Technology Center

