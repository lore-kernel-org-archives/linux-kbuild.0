Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:45317 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753475Ab3BUXWs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 Feb 2013 18:22:48 -0500
Received: by mail-vc0-f171.google.com with SMTP id p1so52319vcq.30
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Feb 2013 15:22:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5126AA4B.2080600@suse.cz>
References: <CALZVapk=-8t8BihTSoTJ=Fh3C9xBtDc9ETpmGpjNBrTYiJLF7g@mail.gmail.com>
 <5126AA4B.2080600@suse.cz>
From: Javier Domingo <javierdo1@gmail.com>
Date: Fri, 22 Feb 2013 00:22:27 +0100
Message-ID: <CALZVapn9TZNqeWXQry2_Zw9okOFKspeNRpeQJjENuHddx2aX+g@mail.gmail.com>
Subject: Re: Size of images in make-kpkg and make deb-pkg
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Is there any way to get rid of the full debuginfo?
Javier Domingo


2013/2/22 Michal Marek <mmarek@suse.cz>:
> On 12.2.2013 01:29, Javier Domingo wrote:
>> Hello,
>>
>> I don't know if this belongs here, but I just wanted to came across a
>> strange thing I am experiencing. I am currently working on v3.6, and I
>> have just discovered that generated kernel images have a totally
>> unrelated size.
>>
>> When I compile with something like make-kpkg --initrd kernel_image
>> kernel_headers, the generated image is 7.7MB, and when I then run make
>> deb-pkg, the generated deb package is 33MB.
>>
>> Other sizes are:
>> 6.5M <-> 24M
>> 38M <-> 484M (!!!)
>
> My guess is that the big one includes full debuginfo, while the other
> one is stripped.
>
> Michal
>
