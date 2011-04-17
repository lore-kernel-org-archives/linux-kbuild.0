Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:56313 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751803Ab1DQWfA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 17 Apr 2011 18:35:00 -0400
Received: by ewy4 with SMTP id 4so1206541ewy.19
        for <linux-kbuild@vger.kernel.org>; Sun, 17 Apr 2011 15:34:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110417222945.GC14561@stro.at>
References: <1302891806-10458-1-git-send-email-robert@greenroomsoftware.com>
	<20110417222945.GC14561@stro.at>
Date: Sun, 17 Apr 2011 17:34:57 -0500
Message-ID: <BANLkTinP5sUv2-_Y+UZMvgPJFHsdypcLHA@mail.gmail.com>
Subject: Re: [PATCH] kbuild, deb-pkg: set host machine after dpkg-gencontrol
From: Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: Robert Gordon <robert@greenroomsoftware.com>, linux-kbuild@vger.kernel.org

On Sun, Apr 17, 2011 at 5:29 PM, maximilian attems <max@stro.at> wrote:
> On Fri, 15 Apr 2011, Robert Gordon wrote:
>
>> This patch was prepared using git format-patch and git send-email.  Details follow.
>> Regards,
>> Robert Gordon
>
> thanks so the patch was now applyable and so testable. (:
>
>> scripts/package/builddeb script was setting the host machine $arch in the KERNEL/debian/control prior to an invocation of dpkg-gencontrol.  The patch modifies the script to guarantee the correct debian arch for the target is written to the control file instead.  The issue originally arose in the 2.6.38 series.
>
> hmm don't be shy to use line-breaks in the desc for next times..
>
>>  Signed-off-by: Robert Gordon <robert@greenroomsoftware.com>
>
> rudimentary testing showed, that `make deb-pkg` works,
> but `make ARCH=i386 deb-pkg` on an amd64 Debian box seems borked:
> + dpkg-gencontrol -isp -DArchitecture=i386 -plinux-headers-2.6.39-rc3+
> -P/media/data/mattems/src/linux-2.6/debian/hdrtmp
> dpkg-gencontrol: error: current host architecture 'amd64' does not appear in package's architecture list (i386)

Weird, as without the patch we get the same error just with (i386)
swapped for (armel)..

make ARCH=armel deb-pkg (on amd64)

Note, with cross building we always have CROSS_COMPILE=something too..

Regards,

-- 
Robert Nelson
http://www.rcn-ee.com/
