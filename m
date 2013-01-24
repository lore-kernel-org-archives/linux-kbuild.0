Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-da0-f53.google.com ([209.85.210.53]:51794 "EHLO
	mail-da0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752782Ab3AXK0z (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2013 05:26:55 -0500
Message-ID: <51010C66.7080908@gmail.com>
Date: Thu, 24 Jan 2013 18:26:46 +0800
From: winton <newtonliuwen@gmail.com>
MIME-Version: 1.0
Subject: Re: Security Kconfig is not common
References: <50FFE587.4020801@gmail.com> <5100102A.6020009@schaufler-ca.com>
In-Reply-To: <5100102A.6020009@schaufler-ca.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: james.l.morris@oracle.com, linux-security-module@vger.kernel.org, linux-kbuild@vger.kernel.org

On 01/24/2013 12:30 AM, Casey Schaufler wrote:
> On 1/23/2013 5:28 AM, winton wrote:
>> Hi James,
>>
>>      Please help to review this patch.
>>      When I analysis Kconfig files, I searched the keywork "source" and
>> then follow double quotations. The Kconfig in security is missing.
>> That's because security/Kconfig source keyword didn't using double
>> quotations.
>>      Although that's may be not necessary. But I think the same as
>> other Kconfig files will be better.
>>
>> Best regards,
>> Winton.Liu
> The practice of quoting the source pathnames is usual, but far from
> universal. There are several examples in the arch and drivers directories.
> If you believe this is significant, see if the checkpatch maintainer is
> interested in adding a check.
>
>
Dear Casey,

     Thank you for your explanations. Indeed that's now universal right now.
     That's the result I calculate (from the newest kenerl) :
     Only 9 Kconfig doesn't contains quotations as belowing:
./arch/cris/arch-v32/Kconfig
./arch/cris/arch-v32/drivers/Kconfig
./security/integrity/Kconfig
./security/Kconfig
./drivers/crypto/Kconfig
./drivers/pps/Kconfig
./drivers/hwmon/Kconfig
./drivers/i2c/Kconfig
./drivers/w1/Kconfig
There are 967 Kconfig in kernel
There are 159 Kconfig containning source keyword

     I hope that would be universal one day. Just 9, not so much.

Best regards,
Winton.Liu





