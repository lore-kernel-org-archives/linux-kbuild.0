Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f176.google.com ([209.85.211.176]:39907 "EHLO
	mail-yw0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782Ab0ACFOC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 3 Jan 2010 00:14:02 -0500
Received: by ywh6 with SMTP id 6so14466010ywh.4
        for <linux-kbuild@vger.kernel.org>; Sat, 02 Jan 2010 21:14:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20100101104449.6DAC63F6FF@gemini.denx.de>
References: <1261446643-21714-1-git-send-email-ptyser@xes-inc.com>
	<1261446643-21714-4-git-send-email-ptyser@xes-inc.com> <fa686aa40912301502x48785614ya4dd5c71815a7633@mail.gmail.com>
	<20091231224439.AF5353F6D1@gemini.denx.de> <1262301038.29396.137.camel@localhost.localdomain>
	<20100101104449.6DAC63F6FF@gemini.denx.de>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Sat, 2 Jan 2010 22:13:42 -0700
Message-ID: <fa686aa41001022113o46bad9d2xf6c026f5fa3e8677@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] powerpc: Add support for ram filesystems in FIT
	uImages
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wolfgang Denk <wd@denx.de>
Cc: Peter Tyser <ptyser@xes-inc.com>, linuxppc-dev@ozlabs.org, linux-kbuild@vger.kernel.org

On Fri, Jan 1, 2010 at 3:44 AM, Wolfgang Denk <wd@denx.de> wrote:
> Dear Peter,
>
> In message <1262301038.29396.137.camel@localhost.localdomain> you wrote:
>> What do you think about changing the U-Boot documentation to rename
>> those 2 image types to:
>> 1 uImages
>> 2 FIT Images
>
> Let's make this "uImage.old" (or "uImage.legacy" similar) and
> "uImage", then.

I'm not interested in renaming the target name for the current uImage
format.  I think it will cause too much breakage and pain to do so.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
