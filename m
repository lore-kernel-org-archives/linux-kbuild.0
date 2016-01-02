Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:50072 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751562AbcABL7y (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Jan 2016 06:59:54 -0500
Subject: Re: [PATCH] [RFC] um: define and use HAVE_LIBPCAP/HAVE_LIBVDEPLUG
References: <1451701909-24430-1-git-send-email-vegard.nossum@oracle.com>
 <5687B7EA.9090605@nod.at>
From: Vegard Nossum <vegard.nossum@oracle.com>
Message-ID: <5687BBAA.3020101@oracle.com>
Date: Sat, 2 Jan 2016 12:59:38 +0100
MIME-Version: 1.0
In-Reply-To: <5687B7EA.9090605@nod.at>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: user-mode-linux-devel@lists.sourceforge.net, linux-kbuild@vger.kernel.org

On 01/02/2016 12:43 PM, Richard Weinberger wrote:
> Am 02.01.2016 um 03:31 schrieb Vegard Nossum:
>> If you don't have libpcap or libvdeplug installed, you will get build
>> failures when compiling certain files:
>>
>> arch/um/drivers/vde_user.c:8:24: fatal error: libvdeplug.h: No such file or directory
>>   #include <libvdeplug.h>
>>
>> arch/um/drivers/pcap_user.c:7:18: fatal error: pcap.h: No such file or directory
>>   #include <pcap.h>
>>
>> This patch adds a basic pre-build check and defines the kconfig variables
>> HAVE_LIBPCAP and HAVE_LIBVDEPLUG depending on the result.
>>
>> There is a basic disadvantage to this scheme, namely that the user may
>> never see the options that rely on these libraries if they are not
>> installed. As a trade-off, we add a brand new option, MISSING_LIBRARIES
>> (defaulting to 'y'), which allows those options to be visible (and
>> selectable) anyway.
>>
>> [Note: I find this useful personally as I ran into the above build
>>   failures when playing around with UML -- so take this more as a
>>   suggestion on how things MAY be done better than a real patch.]
>
> Why can't you build with UML_NET_VDE=n and UML_NET_PCAP=n
> or install the missing libs?
> To me the patch reads like a lazy approach to make allyesconfig somehow build. :-)
>
> If one selects VDE or PCAP (either manually or via allyesconfig) and the libs are
> missing the build has to fail. Everything else will introduce nasty side effects
> like having different builds with the same config and packagers will cry.

Yeah, fair enough.


Vegard
