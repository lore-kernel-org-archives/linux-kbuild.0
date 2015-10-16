Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:51077 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750959AbbJPEWL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Oct 2015 00:22:11 -0400
Date: Fri, 16 Oct 2015 06:21:54 +0200
From: Stefan Lippers-Hollmann <s.l-h@gmx.de>
Subject: Re: [PATCH 39/39] Update the buildsystem for KConfig finding Qt
Message-ID: <20151016062154.6e8bda74@mir>
In-Reply-To: <20151016061241.45c51b63@mir>
References: <1442946999-37018-1-git-send-email-thiago.macieira@intel.com>
	<1442946999-37018-40-git-send-email-thiago.macieira@intel.com>
	<20151016061241.45c51b63@mir>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thiago Macieira <thiago.macieira@intel.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>

Hi

On 2015-10-16, Stefan Lippers-Hollmann wrote:
> On 2015-09-22, Thiago Macieira wrote:
[...]
> +	QT_SELECT=5 qmake -query QT_VERSION >/dev/null 2>&1 && export QT_SELECT=5 ||: ; \

Apparently this fails if qmake isn't guarded by qtchooser, but the
following should work (although I'm still not confident if that would
be the best approach):

--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -227,6 +227,7 @@ $(obj)/.tmp_qtcheck: $(src)/Makefile
 # Qt needs some extra effort...
 $(obj)/.tmp_qtcheck:
 	@set -e; $(kecho) "  CHECK   qt"; \
+	qtchooser --list-versions | grep -q ^5$ && export QT_SELECT=5 ||: ; \
 	qtver=`qmake -query QT_VERSION` || { \
 	    echo >&2 "*"; \
 	    echo >&2 "* qmake failed."; \


Regards
	Stefan Lippers-Hollmann
