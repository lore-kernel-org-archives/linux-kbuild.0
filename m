Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43083 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756829Ab3HOQCd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 Aug 2013 12:02:33 -0400
Message-ID: <520CFB94.6050005@suse.cz>
Date: Thu, 15 Aug 2013 18:02:28 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Provide version number for Debian firmware package
References: <1376250919-13886-1-git-send-email-xypron.glpk@gmx.de> <520A9528.4000309@suse.cz> <1376427766.11676.42.camel@deadeye.wl.decadent.org.uk> <20130814181523.GA16017@stro.at>
In-Reply-To: <20130814181523.GA16017@stro.at>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: Ben Hutchings <ben@decadent.org.uk>, Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-kbuild@vger.kernel.org

On 14.8.2013 20:15, maximilian attems wrote:
> On Tue, 13 Aug 2013, Ben Hutchings wrote:
> 
>> On Tue, 2013-08-13 at 22:20 +0200, Michal Marek wrote:
>>> Dne 11.8.2013 21:55, Heinrich Schuchardt napsal(a):
>>>> scripts/package/builddeb is used to create Debian packages.
>>>> Currently the firmware package always gets the same version number
>>>> irrespective of the Kernel version.
>>>> The paths inside the firmware package depend on the Kernel
>>>> version.
>>>>
>>>> With the patch supplied the Kernel version becomes part of the
>>>> Debian firmware package number.
>>>
>>> Ben, Max, is this how the official linux-firmware-image package is built
>>> in Debian? The change makes sense to me.
>>
>> but since builddeb is already doing so, and the generated package
>> installs files in /lib/firmware/$version, it would make sense to include
>> $version in the package name.
> 
> acked by me too.

Added to kbuild.git#misc now.

Michal

