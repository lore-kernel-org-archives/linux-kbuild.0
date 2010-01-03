Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f211.google.com ([209.85.217.211]:40898 "EHLO
	mail-gx0-f211.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750749Ab0ACFLR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 3 Jan 2010 00:11:17 -0500
Received: by gxk3 with SMTP id 3so2019346gxk.1
        for <linux-kbuild@vger.kernel.org>; Sat, 02 Jan 2010 21:11:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20091231224439.AF5353F6D1@gemini.denx.de>
References: <1261446643-21714-1-git-send-email-ptyser@xes-inc.com>
	<1261446643-21714-4-git-send-email-ptyser@xes-inc.com> <fa686aa40912301502x48785614ya4dd5c71815a7633@mail.gmail.com>
	<20091231224439.AF5353F6D1@gemini.denx.de>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Sat, 2 Jan 2010 22:10:56 -0700
Message-ID: <fa686aa41001022110m5767925bqf8f6d3eadf965d6d@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] powerpc: Add support for ram filesystems in FIT
	uImages
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wolfgang Denk <wd@denx.de>
Cc: Peter Tyser <ptyser@xes-inc.com>, linuxppc-dev@ozlabs.org, linux-kbuild@vger.kernel.org

On Thu, Dec 31, 2009 at 3:44 PM, Wolfgang Denk <wd@denx.de> wrote:
> Dear Grant Likely,
>
> In message <fa686aa40912301502x48785614ya4dd5c71815a7633@mail.gmail.com> you wrote:
>>
>> IIRC, uImage.fit.initrd.% should appear before uImage.fit.% in the
>> Makefile so that make behaves more consistently.  Speaking of which,
>> the number of '.' in the name is getting rather large.  Would you
>> consider using 'fitImage' instead of 'uImage.fit'?
>
> Why chose a different name at all? We could still call it "uImage",
> meaning "U-Boot image" - U-Boot is clever enought o detect
> automatically if we pass it an old style or a fit image.

Simply because arch/powerpc/boot/Makefile needs different target names
to decide which kind of image to build.  I don't care much about the
name, it can always be renamed at install time, but I do care that the
make build targets are sane.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
