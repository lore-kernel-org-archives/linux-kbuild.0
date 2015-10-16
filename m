Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mo4-p05-ob.smtp.rzone.de ([81.169.146.183]:27749 "EHLO
	mo4-p05-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751596AbbJPES4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Oct 2015 00:18:56 -0400
Date: Fri, 16 Oct 2015 06:12:41 +0200
From: Stefan Lippers-Hollmann <s.l-h@gmx.de>
Subject: Re: [PATCH 39/39] Update the buildsystem for KConfig finding Qt
Message-ID: <20151016061241.45c51b63@mir>
In-Reply-To: <1442946999-37018-40-git-send-email-thiago.macieira@intel.com>
References: <1442946999-37018-1-git-send-email-thiago.macieira@intel.com>
	<1442946999-37018-40-git-send-email-thiago.macieira@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thiago Macieira <thiago.macieira@intel.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>

Hi

On 2015-09-22, Thiago Macieira wrote:
> The buildsystem will now only search for Qt 4 and Qt 5. Support for Qt 2
> and 3 was dropped in the previous commits (Qt 3 was EOL'ed in 2010 or
> so...).
> 
> For Qt 5, to be future-proof with the future direction notice appearing
> in the 5.5 release, C++11 support is automatically enabled.
[...]
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
[...]
> +	@set -e; $(kecho) "  CHECK   qt"; \
> +	qtver=`qmake -query QT_VERSION` || { \
> +	    echo >&2 "*"; \
> +	    echo >&2 "* qmake failed."; \
> +	    echo >&2 "*"; \
> +	    exit 1; \
> +	}; \
[...]

"qmake -query QT_VERSION" appears to be a little fragile on Debian 
with both qt4-qmake and qt5-qmake installed, as it reports back 
"4.8.7" by default. The actual qmake is hiding behind qtchooser
(/usr/bin/qmake -> qtchooser) and will report different environments
based on the chosen personality:

$ qmake -query QT_VERSION
4.8.7

$ QT_SELECT=5 qmake -query QT_VERSION
5.4.2

While I'm not quite sure what would be the best kind of test
here (and if qtchooser can be commonly expected), the following 
might provide another approach to query the most recent installed 
qt version:

$ qtchooser --list-versions | grep ^[0-9]*$ | sort | tac | head -n1
5

(and then exporting QT_SELECT=5 to the rest of the build).

Another approach which appears to work for me (with both qt4 and qt5) 
would be this, but I'm not quite sure if this would be a good solution:

--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -227,6 +227,7 @@ $(obj)/.tmp_qtcheck: $(src)/Makefile
 # Qt needs some extra effort...
 $(obj)/.tmp_qtcheck:
 	@set -e; $(kecho) "  CHECK   qt"; \
+	QT_SELECT=5 qmake -query QT_VERSION >/dev/null 2>&1 && export QT_SELECT=5 ||: ; \
 	qtver=`qmake -query QT_VERSION` || { \
 	    echo >&2 "*"; \
 	    echo >&2 "* qmake failed."; \

Regards
	Stefan Lippers-Hollmann
