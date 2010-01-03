Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:50236 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751038Ab0ACIGO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 3 Jan 2010 03:06:14 -0500
Received: by ewy19 with SMTP id 19so6329363ewy.21
        for <linux-kbuild@vger.kernel.org>; Sun, 03 Jan 2010 00:06:13 -0800 (PST)
From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [PATCH v2 3/3] powerpc: Add support for ram filesystems in FIT uImages
References: <1261446643-21714-1-git-send-email-ptyser@xes-inc.com>
	<1261446643-21714-4-git-send-email-ptyser@xes-inc.com>
	<fa686aa40912301502x48785614ya4dd5c71815a7633@mail.gmail.com>
	<20091231224439.AF5353F6D1@gemini.denx.de>
	<1262301038.29396.137.camel@localhost.localdomain>
	<20100101104449.6DAC63F6FF@gemini.denx.de>
Date: Sun, 03 Jan 2010 09:06:11 +0100
In-Reply-To: <20100101104449.6DAC63F6FF@gemini.denx.de> (Wolfgang Denk's
	message of "Fri, 01 Jan 2010 11:44:49 +0100")
Message-ID: <87wrzzpq8c.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wolfgang Denk <wd@denx.de>
Cc: Peter Tyser <ptyser@xes-inc.com>, linuxppc-dev@ozlabs.org, linux-kbuild@vger.kernel.org

>>>>> "Wolfgang" == Wolfgang Denk <wd@denx.de> writes:

 >> What do you think about changing the U-Boot documentation to rename
 >> those 2 image types to:
 >> 1 uImages
 >> 2 FIT Images

 Wolfgang> Let's make this "uImage.old" (or "uImage.legacy" similar) and
 Wolfgang> "uImage", then.

No, that would break stuff for the existing users. The existing format
make/file names shouldn't change.

The FIT images could be called fitimage or uImage.new or something.

-- 
Bye, Peter Korsgaard
