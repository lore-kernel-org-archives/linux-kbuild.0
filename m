Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:32771 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752791AbcKYMYZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Nov 2016 07:24:25 -0500
Received: by mail-lf0-f49.google.com with SMTP id c13so49428924lfg.0
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Nov 2016 04:24:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <3149e502-1a4c-0413-b874-d40ed5bf4a42@au1.ibm.com>
References: <20160826081716.9435-1-andrew.donnellan@au1.ibm.com>
 <20160826081716.9435-2-andrew.donnellan@au1.ibm.com> <3149e502-1a4c-0413-b874-d40ed5bf4a42@au1.ibm.com>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Fri, 25 Nov 2016 14:24:23 +0200
Message-ID: <CAAqcGHm_SRcrWOr+yxTy2oxgxKFwqa6-=ZHvf0M7pNCxoE7q5g@mail.gmail.com>
Subject: Re: [PATCH 2/2] builddeb: allow building without headers/firmware packages
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On 18 October 2016 at 05:12, Andrew Donnellan
<andrew.donnellan@au1.ibm.com> wrote:
> On 26/08/16 18:17, Andrew Donnellan wrote:
>>
>> Currently, the deb-pkg and bindeb-pkg targets create multiple packages for
>> the kernel binaries, headers, userspace headers and firmware.
>>
>> For developers who generate Debian packages as part of their development
>> workflows, it's often not necessary to generate all these packages.
>>
>> Allow the creation of the linux-headers, linux-libc-dev and linux-firmware
>> packages to be disabled if the environment variables KDEB_NO_HEADERS,
>> KDEB_NO_LIBC_HEADERS or KDEB_NO_FIRMWARE are non-empty.
>>
>> Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

> Ping :)

I'm not a big fan of this patch. It adds some complexity as evident by
extra indent
level it adds. On practice developers would end up passing a long command line
with all KDEB_NO* variables.

Riku

>> On top of d3e2773c4ede5c62d2a92dae20e3a09b1ca55b6e in kbuild#rc-fixes
>
>
> This of course is now in mainline.
>
>
> --
> Andrew Donnellan              OzLabs, ADL Canberra
> andrew.donnellan@au1.ibm.com  IBM Australia Limited
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
