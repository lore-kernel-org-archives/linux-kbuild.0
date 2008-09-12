Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from sovereign.computergmbh.de ([85.214.69.204]:53372 "EHLO
	sovereign.computergmbh.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753408AbYILPnG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 12 Sep 2008 11:43:06 -0400
Date: Fri, 12 Sep 2008 11:43:02 -0400 (EDT)
From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [PATCH] kbuild: tag with git revision when git describe is
 missing
In-Reply-To: <1221093281-10929-1-git-send-email-tpiepho@freescale.com>
Message-ID: <alpine.LNX.1.10.0809121142120.22808@fbirervta.pbzchgretzou.qr>
References: <1221093281-10929-1-git-send-email-tpiepho@freescale.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Trent Piepho <tpiepho@freescale.com>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>


On Wednesday 2008-09-10 20:34, Trent Piepho wrote:

>setlocalversion used to use an abbreviated git commit sha1 to generate the
>tag.  This was changed in commit d882421f4e08ddf0a94245cdbe516db260aa6f41
>"kbuild: change CONFIG_LOCALVERSION_AUTO to use a git-describe-ish format"
>to use git describe to come up with a tag.  Which is nice, but git describe
>sometimes can't describe the revision.  Commit
>56b2f0706d82535fd8d85503f2dcc0be40c8e55d addressed this, but there is still
>no tag generated.
>
>So, generate a plain abbreviated sha1 tag like setlocalversion used to when
>git describe comes up short.
>
> 		if tag=`git describe 2>/dev/null`; then
> 			echo $tag | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
>+		else
>+			printf '%s%s' -g `echo "$head" | cut -c1-7`
> 		fi
> 	fi

Ouch. The minimal length of some Linux kernel SHAs are already 8 characters
long. You want to be using `git rev-parse --abbrev $longthing` here.
