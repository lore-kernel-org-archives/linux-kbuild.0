Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:49247 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752073Ab0ACKMv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 3 Jan 2010 05:12:51 -0500
From: Wolfgang Denk <wd@denx.de>
Subject: Re: [PATCH v2 3/3] powerpc: Add support for ram filesystems in FIT uImages
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
In-reply-to: <fa686aa41001022113o46bad9d2xf6c026f5fa3e8677@mail.gmail.com>
References: <1261446643-21714-1-git-send-email-ptyser@xes-inc.com> <1261446643-21714-4-git-send-email-ptyser@xes-inc.com> <fa686aa40912301502x48785614ya4dd5c71815a7633@mail.gmail.com> <20091231224439.AF5353F6D1@gemini.denx.de> <1262301038.29396.137.camel@localhost.localdomain> <20100101104449.6DAC63F6FF@gemini.denx.de> <fa686aa41001022113o46bad9d2xf6c026f5fa3e8677@mail.gmail.com>
Date: Sun, 03 Jan 2010 11:12:50 +0100
Message-Id: <20100103101250.89A92E34A26@gemini.denx.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Peter Tyser <ptyser@xes-inc.com>, linuxppc-dev@ozlabs.org, linux-kbuild@vger.kernel.org

Dear Grant Likely,

In message <fa686aa41001022113o46bad9d2xf6c026f5fa3e8677@mail.gmail.com> you wrote:
>
> > Let's make this "uImage.old" (or "uImage.legacy" similar) and
> > "uImage", then.
> 
> I'm not interested in renaming the target name for the current uImage
> format.  I think it will cause too much breakage and pain to do so.

We did this before, and the argument then was "progress". Keep in mind
that the old arch/ppc uImage file is much more compatible to the
current arch/powerpc "cuImage" target than to the current "uImage".

I think the same should be done here.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Any sufficiently advanced bug is indistinguishable from a feature.
                                                      - Rich Kulawiec
