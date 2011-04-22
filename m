Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 75.98.165.80.static.a2webhosting.com ([75.98.165.80]:50655 "EHLO
	greenroomsoftware.com" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
	with ESMTP id S1756413Ab1DVUYe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Apr 2011 16:24:34 -0400
Message-ID: <4DB1E3FF.10009@greenroomsoftware.com>
Date: Fri, 22 Apr 2011 13:24:31 -0700
From: Robert Gordon <robert@greenroomsoftware.com>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild, deb-pkg: set host machine after dpkg-gencontrol
References: <1302891806-10458-1-git-send-email-robert@greenroomsoftware.com> <20110417222945.GC14561@stro.at> <20110418160625.GA13973@vostochny.stro.at> <aa1e1ed259dba5b6db3c3516bab80eef@greenroomsoftware.com> <20110419143355.GC17786@vostochny.stro.at> <4DAF1952.4010206@greenroomsoftware.com>
In-Reply-To: <4DAF1952.4010206@greenroomsoftware.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org, Robert Nelson <robertcnelson@gmail.com>

On 04/20/2011 10:35 AM, Robert Gordon wrote:
> On 04/19/2011 07:33 AM, maximilian attems wrote:
>> On Mon, Apr 18, 2011 at 03:28:28PM -0400, robert@greenroomsoftware.com wrote:
>>> Here is the original 'make' command:
>>> make ARCH=arm LOCALVERSION=-x1 CROSS_COMPILE=arm-linux-gnueabi-
>>> KDEB_PKGVERSION=1.0cross deb-pkg
>>>
>>> Here is how it fails:
>>> dpkg-gencontrol: error: current host architecture 'armel' does not
>>> appear in package's architecture list (i386)
>>> make[1]: *** [deb-pkg] Error 255
>>> make: *** [deb-pkg] Error 2
>>>
>> did you check how it dpkg-gencontrol is called?
>> just put an set -x on the top of builddeb.
>>
> Here is the output:
> dpkg-gencontrol -isp -DArchitecture=armel -plinux-headers-2.6.38.2-x1
> -P/opt/kernel_new/2.6-stable/KERNEL/debian/hdrtmp
> dpkg-gencontrol: error: current host architecture 'armel' does not
> appear in package's architecture list (i386)
> make[1]: *** [deb-pkg] Error 255
> make: *** [deb-pkg] Error 2
> [2]+  Done                    gedit KERNEL/scripts/package/builddeb
>
>
> The information in the debian/control file remains the same, i.e. it
> seems to contain instructions to build headers for an i386.
>
> Regards,
> Robert


I have used the 2.6.39-rc4+ kernel to sort out the difficulties with
building .deb packages for a non-x86 architecture.  I repeated the same
steps four times:
fakeroot make ARCH=[x86_64,arm] [CROSS_COMPILE=] deb-pkg
cat debian/control

The four steps proceeded in this order:
1) ARCH=x86_64, the patch I submitted was not applied - succeeded
2) ARCH=x86_64, the patch I submitted was applied - failed
3) ARCH=arm, the patched I submitted was applied - succeeded
4) ARH=arm, the patched I submitted was removed - failed

The problem appears to be in lines 43 & 44 of the latest patch I sent:
x86_64)
    debarch=amd64 ;;

The debian arch for x86_64 is being set to amd64, which is getting
written into the debian/control file prior to invocation of
dpkg-gencontrol.  If my patch is not applied, i386 gets written into the
debian/control file instead, and the x86_64 cross compile succeeds. 
However, when my patch is not applied i386 is written into the
debian/control file when cross compiling for arm, which leads to the
script failing.  When my patch is applied, arm is written into the
debian/control file, when cross compiling for arm, and this succeeds.

I will attempt to modify the debarch for x86_64 to remain x86_64 and see
if that works.  If so, I'll submit a new patch.  The notes from what I
have described so far are included below.

Regards,
Robert Gordon



**********Using original /scripts/package/builddeb - succeeded ************
fakeroot make ARCH=x86_64 deb-pkg

+ dpkg-gencontrol -isp -DArchitecture=amd64 -plinux-headers-2.6.39-rc4+
-P/opt/kernel-linus/linux-2.6/debian/hdrtmp
+ dpkg-gencontrol -isp -DArchitecture=amd64 -plinux-firmware-image
-P/opt/kernel-linus/linux-2.6/debian/fwtmp
+ dpkg-gencontrol -isp -DArchitecture=amd64 -plinux-libc-dev
-P/opt/kernel-linus/linux-2.6/debian/headertmp
+ dpkg-gencontrol -isp -DArchitecture=amd64 -plinux-image-2.6.39-rc4+
-P/opt/kernel-linus/linux-2.6/debian/tmp

cat debian/control
Source: linux-upstream
Section: kernel
Priority: optional
Maintainer: Anonymous <root@robert-VGN-Z690Y>
Standards-Version: 3.8.4
Homepage: http://www.kernel.org/

Package: linux-image-2.6.39-rc4+
Provides: linux-image, linux-image-2.6, linux-modules-2.6.39-rc4+
Suggests: linux-firmware-image
Architecture: any
Description: Linux kernel, version 2.6.39-rc4+
 This package contains the Linux kernel, modules and corresponding other
 files, version: 2.6.39-rc4+.

Package: linux-headers-2.6.39-rc4+
Provides: linux-headers, linux-headers-2.6
Architecture: i386
Description: Linux kernel headers for 2.6.39-rc4+ on i386
 This package provides kernel header files for 2.6.39-rc4+ on i386
 .
 This is useful for people who need to build external modules

Package: linux-firmware-image
Architecture: all
Description: Linux kernel firmware, version 2.6.39-rc4+
 This package contains firmware from the Linux kernel, version 2.6.39-rc4+.

Package: linux-libc-dev
Section: devel
Provides: linux-kernel-headers
Architecture: any
Description: Linux support headers for userspace development
 This package provides userspaces headers from the Linux kernel.  These
headers
 are used by the installed headers for GNU glibc and other system libraries.



**********Using patched /scripts/package/builddeb - failed ************
patch -p1 < builddeb.patch
fakeroot make ARCH=x86_64 deb-pkg

+ dpkg-gencontrol -isp -DArchitecture=amd64 -plinux-headers-2.6.39-rc4+
-P/opt/kernel-linus/linux-2.6/debian/hdrtmp
dpkg-gencontrol: error: current host architecture 'i386' does not appear
in package's architecture list (amd64)
make[1]: *** [deb-pkg] Error 255
make: *** [deb-pkg] Error 2

cat debian/control
Source: linux-upstream
Section: kernel
Priority: optional
Maintainer: Anonymous <root@robert-VGN-Z690Y>
Standards-Version: 3.8.4
Homepage: http://www.kernel.org/

Package: linux-image-2.6.39-rc4+
Provides: linux-image, linux-image-2.6, linux-modules-2.6.39-rc4+
Suggests: linux-firmware-image
Architecture: any
Description: Linux kernel, version 2.6.39-rc4+
 This package contains the Linux kernel, modules and corresponding other
 files, version: 2.6.39-rc4+.

Package: linux-headers-2.6.39-rc4+
Provides: linux-headers, linux-headers-2.6
Architecture: amd64
Description: Linux kernel headers for 2.6.39-rc4+ on amd64
 This package provides kernel header files for 2.6.39-rc4+ on amd64
 .
 This is useful for people who need to build external modules



**********Using patched /scripts/package/builddeb - succeeded ************
fakeroot make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- deb-pkg

+ dpkg-gencontrol -isp -DArchitecture=armel -plinux-headers-2.6.39-rc4+
-P/opt/kernel-linus/linux-2.6/debian/hdrtmp
+ dpkg-gencontrol -isp -DArchitecture=armel -plinux-firmware-image
-P/opt/kernel-linus/linux-2.6/debian/fwtmp
+ dpkg-gencontrol -isp -DArchitecture=armel -plinux-libc-dev
-P/opt/kernel-linus/linux-2.6/debian/headertmp
+ dpkg-gencontrol -isp -DArchitecture=armel -plinux-image-2.6.39-rc4+
-P/opt/kernel-linus/linux-2.6/debian/tmp

cat debian/control
Source: linux-upstream
Section: kernel
Priority: optional
Maintainer: Anonymous <root@robert-VGN-Z690Y>
Standards-Version: 3.8.4
Homepage: http://www.kernel.org/

Package: linux-image-2.6.39-rc4+
Provides: linux-image, linux-image-2.6, linux-modules-2.6.39-rc4+
Suggests: linux-firmware-image
Architecture: any
Description: Linux kernel, version 2.6.39-rc4+
 This package contains the Linux kernel, modules and corresponding other
 files, version: 2.6.39-rc4+.

Package: linux-headers-2.6.39-rc4+
Provides: linux-headers, linux-headers-2.6
Architecture: armel
Description: Linux kernel headers for 2.6.39-rc4+ on armel
 This package provides kernel header files for 2.6.39-rc4+ on armel
 .
 This is useful for people who need to build external modules

Package: linux-firmware-image
Architecture: all
Description: Linux kernel firmware, version 2.6.39-rc4+
 This package contains firmware from the Linux kernel, version 2.6.39-rc4+.

Package: linux-libc-dev
Section: devel
Provides: linux-kernel-headers
Architecture: any
Description: Linux support headers for userspace development
 This package provides userspaces headers from the Linux kernel.  These
headers
 are used by the installed headers for GNU glibc and other system libraries.


**********Using original /scripts/package/builddeb - failed ************
fakeroot make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- deb-pkg

+ dpkg-gencontrol -isp -DArchitecture=armel -plinux-headers-2.6.39-rc4+
-P/opt/kernel-linus/linux-2.6/debian/hdrtmp
dpkg-gencontrol: error: current host architecture 'armel' does not
appear in package's architecture list (i386)
make[1]: *** [deb-pkg] Error 255
make: *** [deb-pkg] Error 2

cat debian/control
Source: linux-upstream
Section: kernel
Priority: optional
Maintainer: Anonymous <root@robert-VGN-Z690Y>
Standards-Version: 3.8.4
Homepage: http://www.kernel.org/

Package: linux-image-2.6.39-rc4+
Provides: linux-image, linux-image-2.6, linux-modules-2.6.39-rc4+
Suggests: linux-firmware-image
Architecture: any
Description: Linux kernel, version 2.6.39-rc4+
 This package contains the Linux kernel, modules and corresponding other
 files, version: 2.6.39-rc4+.

Package: linux-headers-2.6.39-rc4+
Provides: linux-headers, linux-headers-2.6
Architecture: i386
Description: Linux kernel headers for 2.6.39-rc4+ on i386
 This package provides kernel header files for 2.6.39-rc4+ on i386
 .
 This is useful for people who need to build external modules





