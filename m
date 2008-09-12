Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from az33egw02.freescale.net ([192.88.158.103]:35614 "EHLO
	az33egw02.freescale.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753779AbYILTYc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 12 Sep 2008 15:24:32 -0400
Date: Fri, 12 Sep 2008 12:22:05 -0700 (PDT)
From: Trent Piepho <tpiepho@freescale.com>
Subject: Re: [PATCH] kbuild: tag with git revision when git describe is
 missing
In-Reply-To: <alpine.LNX.1.10.0809121142120.22808@fbirervta.pbzchgretzou.qr>
Message-ID: <Pine.LNX.4.64.0809121209250.3610@t2.domain.actdsltmp>
References: <1221093281-10929-1-git-send-email-tpiepho@freescale.com>
 <alpine.LNX.1.10.0809121142120.22808@fbirervta.pbzchgretzou.qr>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Engelhardt <jengelh@medozas.de>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

On Fri, 12 Sep 2008, Jan Engelhardt wrote:
> On Wednesday 2008-09-10 20:34, Trent Piepho wrote:
>> setlocalversion used to use an abbreviated git commit sha1 to generate the
>> tag.  This was changed in commit d882421f4e08ddf0a94245cdbe516db260aa6f41
>> "kbuild: change CONFIG_LOCALVERSION_AUTO to use a git-describe-ish format"
>> to use git describe to come up with a tag.  Which is nice, but git describe
>> sometimes can't describe the revision.  Commit
>> 56b2f0706d82535fd8d85503f2dcc0be40c8e55d addressed this, but there is still
>> no tag generated.
>>
>> So, generate a plain abbreviated sha1 tag like setlocalversion used to when
>> git describe comes up short.
>>
>> 		if tag=`git describe 2>/dev/null`; then
>> 			echo $tag | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
>> +		else
>> +			printf '%s%s' -g `echo "$head" | cut -c1-7`
>> 		fi
>> 	fi
>
> Ouch. The minimal length of some Linux kernel SHAs are already 8 characters
> long. You want to be using `git rev-parse --abbrev $longthing` here.

You mean git rev-parse --short HEAD?  That will figure out the minimum number
of characters to use?  The man page isn't clear on that.  I take it
git-describe uses the same code and will use 8 instead of 7 when it needs to
as well.  I'll send an updated patch.


