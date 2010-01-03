Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f176.google.com ([209.85.211.176]:49324 "EHLO
	mail-yw0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750839Ab0ACFYJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 3 Jan 2010 00:24:09 -0500
Received: by ywh6 with SMTP id 6so14469212ywh.4
        for <linux-kbuild@vger.kernel.org>; Sat, 02 Jan 2010 21:24:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20100101141840.D6C273F6FF@gemini.denx.de>
References: <1261446643-21714-1-git-send-email-ptyser@xes-inc.com>
	<1261446643-21714-3-git-send-email-ptyser@xes-inc.com> <fa686aa40912301457l704c324bk511a207d07218525@mail.gmail.com>
	<20100101141840.D6C273F6FF@gemini.denx.de>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Sat, 2 Jan 2010 22:23:49 -0700
Message-ID: <fa686aa41001022123v557f7a46pac2be0b12d4ba297@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] powerpc: Add support for creating FIT uImages
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wolfgang Denk <wd@denx.de>
Cc: Peter Tyser <ptyser@xes-inc.com>, linuxppc-dev@ozlabs.org, linux-kbuild@vger.kernel.org

On Fri, Jan 1, 2010 at 7:18 AM, Wolfgang Denk <wd@denx.de> wrote:
>> Rather than adding new paths to arch/powerpc/boot/wrapper, I would
>> rather see a new script used for generating FIT image that isn't
>> complicated by all the current wrapper cruft.  Also, the Makefile rule
>> doesn't need to depend on $(wrapperbits) which means faster build
>> times when only building uImages.
>>
>> Bonus points if you also convert the uImage target to use the new
>> script; but I'm not demanding that you do that yet.
>
> I think if this is handles in a separate script, the legacy uImage
> support must be handled in this new script, too. Otherwise it would be
> too difficult to understanmd the relation of the two image formats.

I'm fine with this.  But if I receive a patch that does one and not
the other, I'll probably still merge it.  :-)

>> Finally, you need to add documentation about the new target to
>> Documentation/powerpc/bootwrapper.txt.
>
> Let's keep in mind that the uImage formats (both the old legacy and
> the new FIT format) are inherently architecture independent. We want
> to use this same mechanism for example on ARM, and on other
> architectures as well.

That's fine, but Documentation/powerpc/bootwrapper.txt happens to also
be the place that documents how the boot image creation on
arch/powerpc works.  I'm happy for the text about uImage and fitImage
to make reference to a different Documentation file or URL.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
