Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 26.mail-out.ovh.net ([91.121.27.225]:38110 "HELO
	26.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751637Ab0C2Xot (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Mar 2010 19:44:49 -0400
Message-ID: <4BB13B6C.5090409@example.com>
Date: Tue, 30 Mar 2010 01:44:44 +0200
From: Piotr Hosowicz <piotr@hosowicz.com>
Reply-To: piotr@hosowicz.com
MIME-Version: 1.0
Subject: Re: Is root kernel parameter expected to be the first one or something?
References: <4B9FD5D1.8040203@example.com>	<4B9FDAF3.9010804@xenotime.net>	<4BB10A9D.7000506@example.com>	<20100329133809.af969338.rdunlap@xenotime.net>	<4BB1108C.60202@example.com>	<20100329143334.9b295e1d.rdunlap@xenotime.net>	<4BB12A8A.1040202@example.com>	<20100329153916.18afaf25.rdunlap@xenotime.net>	<4BB12D4C.7080904@example.com>	<20100329154852.5476ed2e.rdunlap@xenotime.net>	<4BB12FE6.9050805@example.com> <20100329160652.ab668ff9.rdunlap@xenotime.net>
In-Reply-To: <20100329160652.ab668ff9.rdunlap@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

Randy Dunlap wrote:

>> You download the driver and ru it :
>>
>> bash downloaded_file.run
> 
> but a large part of that file appears to be a pre-compiled binary.
> 

Yes, it is sort of runnable shell archive. It conatins binary drivers 
matching some common distro-supplied kernels and if it cannot math one 
it builds anew the driver for the system where it is run.

Regards,

Piotr Hosowicz

-- 
TV: "W tej chwili, ¿e siê tak wyra¿ê, zaliczonych mamy 17 zawodniczek."
NP: Mark Knopfler - Remembrance Day
NB: 2.6.34-rc2-next-20100329+
