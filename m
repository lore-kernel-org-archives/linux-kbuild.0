Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:42090 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752380AbeC0N2j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 09:28:39 -0400
Received: by mail-lf0-f48.google.com with SMTP id a22-v6so33302276lfg.9
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Mar 2018 06:28:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAqcGHkvKssjFmG0ebz5uBeO_PGeov5_C6MutW65ONp5riFwRg@mail.gmail.com>
References: <20180221101032.27263-1-riku.voipio@linaro.org>
 <CAK7LNAQ+evMKMMcqQ8KX2aFGthsx=20o2X4EiQ7qu9y50ZvZjw@mail.gmail.com> <CAAqcGHkvKssjFmG0ebz5uBeO_PGeov5_C6MutW65ONp5riFwRg@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Tue, 27 Mar 2018 16:28:36 +0300
Message-ID: <CAAqcGHmeYqe81zG=PvoCtzhKhAU=27LT_K8OVhTykyBZGdML4A@mail.gmail.com>
Subject: Fwd: [PATCH v4] scripts/package/builddeb: split generating packaging
 and build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>

resend, sorry forgot the mailing lists from last post.

Hi Masahiro,

On 27 March 2018 at 12:07, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2018-02-21 19:10 GMT+09:00  <riku.voipio@linaro.org>:
>> From: Riku Voipio <riku.voipio@linaro.org>
>>
>> Move debian/ directory generation out of builddeb to a new script,
>> mkdebian. The package build commands are kept in builddeb, which
>> is now an internal command called from debian/rules.
>>
>> With these changes in place, we can now use dpkg-buildpackage from
>> deb-pkg and bindeb-pkg removing need for handrolled source/changes
>> generation.
>>
>> This patch is based on the criticism of the current state of builddeb
>> discussed on:
>>
>> https://patchwork.kernel.org/patch/9656403/
>>
>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
>> ---
>
> Sorry for the delay.
>
>
>> changes since v3:
>> - removed hack from make clean target
>> - updated copyright year
>> - verified works with make 4.2
>
>
> I have to say the same comment as in v3.
>
> This patch does not work for me if I use Make 4.2 or newer.
>
>
> I compared v3 and v4, and the diff is just below:
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index a151646..7944776 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -119,7 +119,7 @@ This is a packacked upstream version of the Linux kernel.
>  The sources may be found at most Linux archive sites, including:
>  https://www.kernel.org/pub/linux/kernel
>
> -Copyright: 1991 - 2017 Linus Torvalds and others.
> +Copyright: 1991 - 2018 Linus Torvalds and others.
>
>  The git repository for mainline kernel development is at:
>  git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> @@ -181,9 +181,7 @@ binary-arch:
>
>  clean:
>         rm -rf debian/*tmp debian/files
> -       mv debian/ debian.backup # debian/ might be cleaned away
>         \$(MAKE) clean
> -       mv debian.backup debian
>
>  binary: binary-arch
>  EOF
>
>
>
>
> I still see the fork bomb problem on my machine, like the same as before.
> It is curious you mention this is working on your machine.
>
>
> So, something is different between your build machine and mine.
>
> Perhaps, dpkg-buildpackage version?
>
> I use Ubuntu 16.04 LTS.
>
> My version:
>
> $ dpkg-buildpackage --version
> Debian dpkg-buildpackage version 1.18.4.
>
> This is free software; see the GNU General Public License version 2 or
> later for copying conditions. There is NO warranty.
>
>
>
>
> Could you apply the following patch to get the log?
>
>
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 19ce021..849058e 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -68,6 +68,7 @@ binrpm-pkg: FORCE
>  clean-files += $(objtree)/*.spec
>
>  deb-pkg: FORCE
> +       echo MAKEFLAGS for deb-pkg: $(MAKEFLAGS) > deb_pkg_log.txt
>         $(MAKE) clean
>         $(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
>         $(call cmd,src_tar,$(KDEB_SOURCENAME))
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 7944776..158b121 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -174,6 +174,7 @@ cat <<EOF > debian/rules
>  #!/usr/bin/make -f
>
>  build:
> +       echo MAKEFLAGS for mkdebian internal: \$(MAKEFLAGS) >> deb_pkg_log.txt
>         \$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} KBUILD_SRC=
>
>  binary-arch:
>
>
>
> Run the following:
>
> $ make -s tinyconfig
> $ make -j8 deb-pkg
>
>
> Then, can you provide the content of deb_pkg_log.txt, please?

I tested again with:

With debian testing:

$ dpkg-buildpackage --version
Debian dpkg-buildpackage version 1.19.0.5.
$ make --version
GNU Make 4.2.1

MAKEFLAGS for deb-pkg: rR -I/home/voipio/linaro/linux -j8
--jobserver-auth=3,4 --no-print-directory -- obj=scripts/package
MAKEFLAGS for mkdebian internal: rR -I/home/voipio/linaro/linux -j8
--jobserver-auth=3,4 --no-print-directory -- obj=scripts/package

And using container for Ubuntu 16.04:

docker run  --rm -v (pwd):/work  -it ubuntu:16.04 /bin/bash
apt-get update; apt-get install build-essential bc kmod bison flex cpio
Debian dpkg-buildpackage version 1.18.4.
GNU Make 4.1

MAKEFLAGS for deb-pkg: rR -I/work -j --jobserver-fds=3,4
--no-print-directory -- obj=scripts/package
MAKEFLAGS for mkdebian internal: rR -I/work -j --jobserver-fds=3,4
--no-print-directory -- obj=scripts/package

And finally with old ubuntu 16.04 dpkg and make 4.2.1 from debian
installed into container:

MAKEFLAGS for deb-pkg: rR -I/work -j8 --jobserver-auth=3,4
--no-print-directory -- obj=scripts/package
MAKEFLAGS for mkdebian internal: rR -I/work -j8 --jobserver-auth=3,4
--no-print-directory -- obj=scripts/package

> If I use GNU Make 4.0
>
> $ cat deb_pkg_log.txt
> MAKEFLAGS for deb-pkg: rR -I/home/masahiro/ref/linux -j
> --jobserver-fds=3,4 --no-print-directory -- obj=scripts/package
> MAKEFLAGS for mkdebian internal: rR -I/home/masahiro/ref/linux -j
> --jobserver-fds=3,4 --no-print-directory -- obj=scripts/package
>
>
>
> If I use GNU Make 4.2
>
> $ cat deb_pkg_log.txt
> MAKEFLAGS for deb-pkg: rR -I/home/masahiro/ref/linux -j8
> --jobserver-auth=3,4 --no-print-directory -- obj=scripts/package
> MAKEFLAGS for mkdebian internal: rR -I/home/masahiro/ref/linux -j
> --jobserver-fds=5,6 --no-print-directory -- obj=scripts/package

I'll make a wild guess, and "outside" make is your 4.2 build while the
intdeb-pkg ends up calling the make 4.0 that comes with your ubuntu?
observe the --jobserver-auth vs ---jobsserver-fds arguments.


Riku
