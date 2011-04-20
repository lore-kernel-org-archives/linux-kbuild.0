Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 75.98.165.80.static.a2webhosting.com ([75.98.165.80]:36510 "EHLO
	greenroomsoftware.com" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
	with ESMTP id S1751318Ab1DTRfS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Apr 2011 13:35:18 -0400
Message-ID: <4DAF1952.4010206@greenroomsoftware.com>
Date: Wed, 20 Apr 2011 10:35:14 -0700
From: Robert Gordon <robert@greenroomsoftware.com>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild, deb-pkg: set host machine after dpkg-gencontrol
References: <1302891806-10458-1-git-send-email-robert@greenroomsoftware.com> <20110417222945.GC14561@stro.at> <20110418160625.GA13973@vostochny.stro.at> <aa1e1ed259dba5b6db3c3516bab80eef@greenroomsoftware.com> <20110419143355.GC17786@vostochny.stro.at>
In-Reply-To: <20110419143355.GC17786@vostochny.stro.at>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org, Robert Nelson <robertcnelson@gmail.com>

On 04/19/2011 07:33 AM, maximilian attems wrote:
> On Mon, Apr 18, 2011 at 03:28:28PM -0400, robert@greenroomsoftware.com wrote:
>> Here is the original 'make' command:
>> make ARCH=arm LOCALVERSION=-x1 CROSS_COMPILE=arm-linux-gnueabi-
>> KDEB_PKGVERSION=1.0cross deb-pkg
>>
>> Here is how it fails:
>> dpkg-gencontrol: error: current host architecture 'armel' does not
>> appear in package's architecture list (i386)
>> make[1]: *** [deb-pkg] Error 255
>> make: *** [deb-pkg] Error 2
>>
> did you check how it dpkg-gencontrol is called?
> just put an set -x on the top of builddeb.
>
Here is the output:
dpkg-gencontrol -isp -DArchitecture=armel -plinux-headers-2.6.38.2-x1
-P/opt/kernel_new/2.6-stable/KERNEL/debian/hdrtmp
dpkg-gencontrol: error: current host architecture 'armel' does not
appear in package's architecture list (i386)
make[1]: *** [deb-pkg] Error 255
make: *** [deb-pkg] Error 2
[2]+  Done                    gedit KERNEL/scripts/package/builddeb


The information in the debian/control file remains the same, i.e. it
seems to contain instructions to build headers for an i386.

Regards,
Robert
