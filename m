Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 75.98.165.80.static.a2webhosting.com ([75.98.165.80]:59499 "EHLO
	greenroomsoftware.com" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
	with ESMTP id S1756610Ab1DRT2c (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Apr 2011 15:28:32 -0400
MIME-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 18 Apr 2011 15:28:28 -0400
From: <robert@greenroomsoftware.com>
Subject: Re: [PATCH] kbuild, deb-pkg: set host machine after dpkg-gencontrol
In-Reply-To: <20110418160625.GA13973@vostochny.stro.at>
References: <1302891806-10458-1-git-send-email-robert@greenroomsoftware.com>
 <20110417222945.GC14561@stro.at> <20110418160625.GA13973@vostochny.stro.at>
Message-ID: <aa1e1ed259dba5b6db3c3516bab80eef@greenroomsoftware.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org, Robert Nelson <robertcnelson@gmail.com>

 On Mon, 18 Apr 2011 16:06:26 +0000, maximilian attems <max@stro.at> 
 wrote:
> On Mon, Apr 18, 2011 at 12:29:45AM +0200, maximilian attems wrote:
>> On Fri, 15 Apr 2011, Robert Gordon wrote:
>>
>> > This patch was prepared using git format-patch and git send-email. 
>> Details follow.
>> > Regards,
>> > Robert Gordon
>>
>> thanks so the patch was now applyable and so testable. (:
>>
>> > scripts/package/builddeb script was setting the host machine $arch 
>> in the KERNEL/debian/control prior to an invocation of 
>> dpkg-gencontrol.  The patch modifies the script to guarantee the 
>> correct debian arch for the target is written to the control file 
>> instead.  The issue originally arose in the 2.6.38 series.
>>
>> hmm don't be shy to use line-breaks in the desc for next times..
>>
>> >  Signed-off-by: Robert Gordon <robert@greenroomsoftware.com>
>>
>> rudimentary testing showed, that `make deb-pkg` works,
>> but `make ARCH=i386 deb-pkg` on an amd64 Debian box seems borked:
>> + dpkg-gencontrol -isp -DArchitecture=i386 
>> -plinux-headers-2.6.39-rc3+
>> -P/media/data/mattems/src/linux-2.6/debian/hdrtmp
>> dpkg-gencontrol: error: current host architecture 'amd64' does not 
>> appear in package's architecture list (i386)
>
> at a second look your patch is just wrong the arch overriding is
> currently correctly done in create_package(), with the debian/control
> file having the host arch written to it.
>
> so please post what exactly you were trying to build in the first 
> place?


 When cross compiling for an arm on an i386 machine, dpkg-gencontrol 
 fails.  I am currently on the road and my internet connection is not 
 allowing me to pull Linus's kernel onto my laptop.  If you will permit, 
 I'll use the latest kernel from Ubunutu for the (ARM) Beagleboard 
 (2.6.38), since I have it with me already.  I worked with the latest 
 kernel at home this past weekend and the /scripts/packages/buildeb file 
 was the same in both versions (i.e. I can apply the patch to the 2.6.38 
 or 2.6.39 versions).

 Here is the original 'make' command:
 make ARCH=arm LOCALVERSION=-x1 CROSS_COMPILE=arm-linux-gnueabi- 
 KDEB_PKGVERSION=1.0cross deb-pkg

 Here is how it fails:
 dpkg-gencontrol: error: current host architecture 'armel' does not 
 appear in package's architecture list (i386)
 make[1]: *** [deb-pkg] Error 255
 make: *** [deb-pkg] Error 2

 Immediately after the failure, the debian/control file contains the 
 following section:
 Package: linux-headers-2.6.38.2-x1
 Provides: linux-headers, linux-headers-2.6
 Architecture: i386
 Description: Linux kernel headers for 2.6.38.2-x1 on i386
  This package provides kernel header files for 2.6.38.2-x1 on i386

 Since I am cross-compiling for an ARM machine, I don't think I want 
 kernel headers for i386.  After my patch is applied, the relevant fields 
 say 'armel' and the deb-pkg process executes to successful completion.

 I will pull Linus's kernel at my first opportunity, but I hope this 
 answer helps.

 Regards,
 Robert Gordon
