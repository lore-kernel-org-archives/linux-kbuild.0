Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:36249 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932450AbbDWJBM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 23 Apr 2015 05:01:12 -0400
Received: by wizk4 with SMTP id k4so207785266wiz.1
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Apr 2015 02:01:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150422155057.GA32026@gluino>
References: <cf573e24baadc04da27c471dafee90344e0cb400.1428671643.git.riku.voipio@linaro.org>
	<34017611f8a0056a09d2c38412efd7828efe00fe.1428671643.git.riku.voipio@linaro.org>
	<20150422155057.GA32026@gluino>
Date: Thu, 23 Apr 2015 12:01:10 +0300
Message-ID: <CAAqcGHnRinMmG++0d02-ANYrdhxod5K3G5qcwxbA7tKOqe+Fjw@mail.gmail.com>
Subject: Re: [PATCH 2/2] deb-pkg: add source package
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <maks@stro.at>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, mmarek <mmarek@suse.cz>, debian-kernel <debian-kernel@lists.debian.org>

On 22 April 2015 at 18:50, maximilian attems <maks@stro.at> wrote:
> On Fri, Apr 10, 2015 at 04:15:14PM +0300, riku.voipio@linaro.org wrote:
>> From: Riku Voipio <riku.voipio@linaro.org>
>>
>> By passing BUILD_SOURCE=y variable, make deb-pkg builds a debian source
>> package. It will generate a minimal debian/rules file that calls back
>> to make deb-pkg. Generated source package will build the same kernel
>> .config than what was available for make deb-pkg.
>>
>> The source package is useful for gpl compliance, or for feeding to a
>> automated debian package builder.
>>
>> Patch depends on the "deb-pkg: move setting debarch for a separate function"
>> for correct changelog filenames.
>>
>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
>> ---
>
> great this is a much requested feature for wider adoption of make
> deb-pkg. In general acked-by me, just minor comment below.
>
> I do not like the BUILD_SOURCE=y variable,
> I think it should just be like the other scripts and do it by default.
>
> What we do need is a target that *only* compiles the linux image.

So a bin-debpkg target in scripts/package/Makefile ?

>>  scripts/package/builddeb | 42 ++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
>> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
>> index e397815..3d77fd3 100755
>> --- a/scripts/package/builddeb
>> +++ b/scripts/package/builddeb
>> @@ -272,12 +272,23 @@ On Debian GNU/Linux systems, the complete text of the GNU General Public
>>  License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
>>  EOF
>>
>> +
>> +build_depends="bc, "
>> +if [ -n "$BUILD_TOOLS" ]

> why this dual stage?

That variable was introduced in "RFC: builddeb: add linux-tools
package with perf" [1]. Building perf
as part of deb-pkg was kind of the major motivation for these series.

>> +then
>> +     build_depends="$build_depends python-dev, libperl-dev, bison, flex, \
>> +libaudit-dev, libdw-dev, libelf-dev, libiberty-dev, libnewt-dev, autoconf, \
>> +automake, libtool, libglib2.0-dev, libudev-dev, libwrap0-dev, libiberty-dev, \
>> +libunwind8-dev [amd64 arm64 i386], libnuma-dev [amd64 arm64 i386 powerpc ppc64 ppc64el] "

> how did you generate this list, this seems bogus to me?!

> python-dev should probably be python
> why would you need automake?

These are build-depends of linux-tools (perf etc).

> plus I do seem to miss cpio, kmod.

I'll add kmod and cpio to the non-tools case.

[1] [1] https://lists.debian.org/debian-kernel/2015/04/msg00013.html
